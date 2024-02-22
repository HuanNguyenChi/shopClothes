package com.huanNguyen.shopClothes.controller;

import com.huanNguyen.shopClothes.entity.Product;
import com.huanNguyen.shopClothes.services.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("firstChar")
public class TrangChuController {
    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/home")
    public String home(ModelMap model, HttpSession session) {
        try{
            if (session.getAttribute("email") != null) {
                String emailSession = (String) session.getAttribute("email");
                System.out.println(emailSession);
                String[] word = emailSession.split("@");
                String firstChar = word[0];
                model.addAttribute("firstChar", firstChar);
            }
            List<Product> list = productService.getProductLimit(0);
            model.addAttribute("listProduct",list);

        }catch(Exception e){
            e.printStackTrace();
        }

        return "index";
    }
    @GetMapping("/clothes")
    public String getClothes(ModelMap modelMap){
        int [] ids = {1,2,3,4,5};
        List<Product> listClothes = productService.getProductByCategoryId(ids);
        modelMap.addAttribute("listClothes",listClothes);
        return "allclothes";
    }
    @GetMapping("/shoes")
    public String getShoes(ModelMap modelMap){
        int [] ids = {9};
        List<Product> listShoes = productService.getProductByCategoryId(ids);
        modelMap.addAttribute("listShoes",listShoes);
        return "allshoes";
    }
    @GetMapping("/accessory")
    public String getAccessory(ModelMap modelMap){
        int [] ids = {6,7,8};
        List<Product> listAccessory = productService.getProductByCategoryId(ids);
        modelMap.addAttribute("listAccessory",listAccessory);
        return "allaccessory";
    }
    @GetMapping("/check")
    public String check1(){
        return "paymentpage";
    }
}
