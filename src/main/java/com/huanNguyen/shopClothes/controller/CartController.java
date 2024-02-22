package com.huanNguyen.shopClothes.controller;

import com.huanNguyen.shopClothes.entity.Bill;
import com.huanNguyen.shopClothes.entity.BillDetail;
import com.huanNguyen.shopClothes.entity.Cart;
import com.huanNguyen.shopClothes.entity.Product;
import com.huanNguyen.shopClothes.services.impl.BillDetailServiceImpl;
import com.huanNguyen.shopClothes.services.impl.BillServiceImpl;
import com.huanNguyen.shopClothes.services.impl.ProductDetailSeviceImpl;
import com.huanNguyen.shopClothes.services.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cart")
@SessionAttributes({"cart","email"})
public class CartController {

    @Autowired
    private ProductServiceImpl productService;

    @Autowired
    private ProductDetailSeviceImpl productDetailSevice;

    @Autowired
    private BillServiceImpl billService;

    @Autowired
    private BillDetailServiceImpl billDetailService;

    @GetMapping()
    public String getCart(ModelMap model, HttpSession session){

        List<Product> listProduct = productService.getProductLimit(0);
        model.addAttribute("listProduct",listProduct);
        List<Cart> listCart = (List<Cart>) session.getAttribute("cart");
        model.addAttribute("listCart",listCart);
        return "cart";
    }

    @PostMapping()
    public String saveBill(@RequestParam String nameOfConsignee,
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
            int total = 0;
            for(Cart item : listCart){
                BillDetail billDetail = new BillDetail();
                billDetail.setBillId(bill);
                billDetail.setProductDetailId(productDetailSevice.getProductDetailById(item.getProductDetailId()));
                billDetail.setPrice(item.getPrice());
                billDetail.setQuantity(item.getQuantity());
                billDetailService.saveBillDetail(billDetail);
                total += billDetail.getPrice();
            }
            listCart.clear();
            modelMap.addAttribute("cart",listCart);
            modelMap.addAttribute("total",total);
            modelMap.addAttribute("date",LocalDate.now().plusDays(2).toString());
            modelMap.addAttribute("address",address);
            modelMap.addAttribute("phone",phoneNumber);
            modelMap.addAttribute("name",nameOfConsignee);
        }
        return "paymentpage";
    }
}
