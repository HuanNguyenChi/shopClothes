package com.huanNguyen.shopClothes.controller;

import com.huanNguyen.shopClothes.entity.*;
import com.huanNguyen.shopClothes.services.impl.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class DashboardController {

    @Autowired
    private BillDetailServiceImpl billDetailService;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private ColorServiceImpl colorService;
    @Autowired
    private SizeServiceImpl sizeService;
    @Autowired
    private ProductServiceImpl productService;
    @Autowired
    private ProductDetailSeviceImpl productDetailSevice;

    @GetMapping()
    public String dashboard(ModelMap modelMap){
        List<BillDetail> listBillDetail = billDetailService.getAllBillDetail();
        List<BillDetail> listBillDetailLimit = billDetailService.getBillDetailLimit(0,10);
        modelMap.addAttribute("listBillDetail",listBillDetail);
        modelMap.addAttribute("listBillDetailLimit",listBillDetailLimit);

        if(listBillDetail.size() % 10 == 0){
            modelMap.addAttribute("sumPage",listBillDetail.size()/10 );
        }else {
            modelMap.addAttribute("sumPage",listBillDetail.size()/10 + 1);
        }

        return "dashboard";
    }
    @GetMapping("/addproduct")
    public String addProduct(ModelMap modelMap){
        List<Category> category = categoryService.getAllCategory();
        List<Color> color = colorService.getAllColor();
        List<Size> size = sizeService.getAllSize();
        modelMap.addAttribute("category",category);
        modelMap.addAttribute("color",color);
        modelMap.addAttribute("size",size);
        return "addproduct";
    }
    @PostMapping("/addproduct")
    public String addProductPost(ModelMap modelMap, @RequestParam String name,
                                 @RequestParam String category, @RequestParam String quantity,
                                 @RequestParam String price, @RequestParam("file") MultipartFile image, @RequestParam String description,
                                 @RequestParam List<String> size, @RequestParam List<String> color ){
        Product product = new Product();
        product.setPrice(Integer.valueOf(price));
        product.setName(name);
        product.setDescription(description);
        product.setImage_product(image.getOriginalFilename());
        product.setCategoryId(categoryService.getCategoryById(Integer.parseInt(category)));
        int idProduct = productService.saveProduct(product);
        List<Size> sizeList = new ArrayList<>();
        for (String item : size){
            Size si = sizeService.getSizeById(Integer.parseInt(item));
            sizeList.add(si);
        }
        List<Color> colorList = new ArrayList<>();
        for (String item : color){
            Color co = colorService.getColorById(Integer.parseInt(item));
            colorList.add(co);
        }
        for(Size itemSize : sizeList){
            for (Color itemColor : colorList){
                ProductDetail productDetail = new ProductDetail();
                productDetail.setDateImported(String.valueOf(LocalDate.now()));
                productDetail.setQuantity(100);
                productDetail.setSizeId(itemSize);
                productDetail.setColorId(itemColor);
                productDetail.setProductId(productService.getProductById(idProduct));
                productDetailSevice.saveproductDetail(productDetail);
            }
        }
        return "redirect:addproduct";
    }
    @GetMapping("/updateproduct")
    public String updateProduct(ModelMap modelMap){
        List<Product> productList = new ArrayList<>();
        productList = productService.getAllProduct();
        modelMap.addAttribute("productList",productList);
        return "updateproduct";
    }
    @PostMapping("/updateproduct")
    public String updateProductPost(){
        return "redirect:updateproduct";
    }
    @GetMapping("/updateitemdetail/{id}")
    public String updateItemDetail(ModelMap modelMap, @PathVariable("id") Integer id){
        Product product = new Product();
        product = productService.getProductById(id);
        modelMap.addAttribute("product",product);
        return "updateproductdetail";
    }
    @PostMapping("/updateproductdetail/{id}")
    public String updateItemDetailPost(ModelMap modelMap, @RequestParam String name,
                                       @RequestParam String category, @RequestParam String quantity,
                                       @RequestParam String price, @RequestParam("file") MultipartFile image, @RequestParam String description,
                                       @RequestParam List<String> size, @RequestParam List<String> color){

        return "redirect:updateproduct";
    }
}
