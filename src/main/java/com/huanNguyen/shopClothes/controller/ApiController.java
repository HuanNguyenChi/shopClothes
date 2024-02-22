package com.huanNguyen.shopClothes.controller;


import com.huanNguyen.shopClothes.entity.*;
import com.huanNguyen.shopClothes.services.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/api")
@SessionAttributes({"email", "cart"})
public class ApiController {
    @Autowired
    private StaffServiceImpl staffService;

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private ColorServiceImpl colorService;

    @Autowired
    private SizeServiceImpl sizeService;

    @Autowired
    private ProductDetailSeviceImpl productDetailSevice;

    @Autowired
    private BillServiceImpl billService;

    @Autowired
    private BillDetailServiceImpl billDetailService;

    @Autowired
    private ServletContext servletContext;

    @GetMapping(path = "/getbilldetaillimit",produces = "text/plain; charset=UTF-8")
    @ResponseBody
    public String getBillDetailLimit(@RequestParam int start){
        String ans = "";
        List<BillDetail> billDetailList = billDetailService.getBillDetailLimit(start,10);
        for (BillDetail item: billDetailList){
            ans += "<tr>";
            ans += "<td class='id-bill-detail'>" + item.getId() + "</td>";
            ans += "<td class = 'ten-bill-detai'>" + item.getProductDetailId().getProductId().getName() + "</td>";
            ans += "<td class = 'quantity-item'>"+item.getQuantity() +"</td>";
            ans += "<td class = 'name-customer'>" + item.getBillId().getNameCustomer()+"</td>";
            ans += "<td class = 'phone-customer'>" + item.getBillId().getPhoneNumber()+"</td>";
            ans += "<td class = 'price-item'>"+item.getPrice()*item.getQuantity()+"</td>";
            ans += "<td><input type='button' value='View'></td>";
            ans += "</tr>";

        }
        System.out.println(ans);
        return ans;
    }

    @GetMapping("/check")
    @ResponseBody
    public String loginProcess(@RequestParam String email, @RequestParam String password, ModelMap model) {
        boolean check = staffService.checkLogin(email, password);
        model.addAttribute("email", email);
        return "" + check;
    }
//    @PostMapping("/addproduct")
//    @ResponseBody
//    public String addProduct(@RequestParam String data){
//        ObjectMapper objectMapper = new ObjectMapper();
//        try {
//            objectMapper.readValue(data,Product.class);
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
//        System.out.println(data);
//        return null;
//    }
    @PostMapping("/uploadfile")
    public String uploadFile(MultipartHttpServletRequest request){
        String savefile = servletContext.getRealPath("/WEB-INF/resources/image/product/");
        Iterator<String> listname = request.getFileNames();
        MultipartFile filename = request.getFile(listname.next());
        File filesave = new File(savefile + filename.getOriginalFilename());
        try {
            filename.transferTo(filesave);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        System.out.println(savefile);
        return "true";
    }
    @PostMapping("/savebill")
    public boolean saveBill(@RequestParam String nameOfConsignee,
                            @RequestParam String phoneNumber,
                            @RequestParam String address,
                            @RequestParam String note,
                            HttpSession session,
                            ModelMap modelMap){
        System.out.println(nameOfConsignee);
        int id = -1;
        if(session.getAttribute("cart") != null){
            List<Cart> listCart = (List<Cart>) session.getAttribute("cart");
            Bill bill = new Bill();
            bill.setNameCustomer(nameOfConsignee);
            bill.setAddress(address);
            bill.setPhoneNumber(phoneNumber);
            bill.setNote(note);
            bill.setStatusBill(false);
            bill.setDateCreated(LocalDate.now().toString());
            id = billService.saveBill(bill);
            List<BillDetail> billDetailList = new ArrayList<>();
            for(Cart item : listCart){
                BillDetail billDetail = new BillDetail();
                billDetail.setBillId(bill);
                billDetail.setProductDetailId(productDetailSevice.getProductDetailById(item.getProductDetailId()));
                billDetail.setPrice(item.getPrice());
                billDetail.setQuantity(item.getQuantity());
                billDetailService.saveBillDetail(billDetail);
            }
        }
        if(id < 0) return false;
        return true;
    }

    @GetMapping("/deletecart")
    @ResponseBody
    public String deleteCart(ModelMap modelMap, HttpSession session,
                             @RequestParam("productId") int productId,
                             @RequestParam("sizeId") int sizeId,
                             @RequestParam("colorId") int colorId) {

        if (session.getAttribute("cart") != null) {
            List<Cart> list = (List<Cart>) session.getAttribute("cart");
            Cart cart = new Cart();
            cart.setProductId(productId);
            cart.setColorId(colorId);
            cart.setSizeId(sizeId);
            int position = checkCartContain(session, cart);
            list.remove(position);
            modelMap.addAttribute("cart", list);
            List<Cart> listCart = (List<Cart>) session.getAttribute("cart");
            modelMap.addAttribute("listCart", listCart);
            System.out.println(listCart.size());
            return String.valueOf(listCart.size());
        }
        return "0";
    }

    @GetMapping("/addtocart")
    @ResponseBody
    public String addToCart(ModelMap modelMap, HttpSession session,
                            @RequestParam("productId") int productId,
                            @RequestParam("sizeId") int sizeId,
                            @RequestParam("colorId") int colorId,
                            @RequestParam("quantity") int quantity) {
        String tmp = "0";
        Product product = productService.getProductById(productId);
        Color color = colorService.getColorById(colorId);
        Size size = sizeService.getSizeById(sizeId);
        int index = -1;
        if (checkProductDetailExist(productId, colorId, sizeId) < 0) {
            ProductDetail item = new ProductDetail(49, "2023/11/11", product, color, size);
            index = productDetailSevice.saveproductDetail(item);
        } else {
            index = checkProductDetailExist(productId, colorId, sizeId);
        }

        Cart cart = new Cart();
        cart.setProductDetailId(index);
        cart.setProductId(productId);
        cart.setProduct(product.getName());
        cart.setColorId(colorId);
        cart.setColor(color.getName());
        cart.setSizeId(sizeId);
        cart.setSize(size.getName());
        cart.setPrice(product.getPrice());
        cart.setQuantity(quantity);

        if (session.getAttribute("cart") == null) {
            List<Cart> list = new ArrayList<>();
            list.add(cart);
            modelMap.addAttribute("cart", list);
            tmp = String.valueOf(list.size());
        } else {
            List<Cart> list = (List<Cart>) session.getAttribute("cart");
            if (checkCartContain(session, cart) != -1) {
                int location = checkCartContain(session, cart);
                list.get(location).setQuantity(quantity);
            } else {
                list.add(cart);
            }
            tmp = String.valueOf(list.size());
        }
        return tmp;
    }

    private int checkCartContain(HttpSession session, Cart cart) {
        List<Cart> list = (List<Cart>) session.getAttribute("cart");
        int cnt = 0;
        for (Cart item : list) {
            if (item.equals(cart)) return cnt;
            cnt += 1;
        }
        return -1;
    }

    private int checkProductDetailExist(int productId, int colorId, int sizeId) {
        List<ProductDetail> list = productDetailSevice.getAllProductDetail();
        int cnt = -1;
        for (ProductDetail item : list) {
            if (item.getProductId().getId().equals(productId)
                    && item.getColorId().getId().equals(colorId)
                    && item.getSizeId().getId().equals(sizeId)) {
                return cnt;
            }
            cnt += 1;
        }
        return -1;
    }
}
