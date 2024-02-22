package com.huanNguyen.shopClothes.controller;

import com.huanNguyen.shopClothes.entity.Product;
import com.huanNguyen.shopClothes.services.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/itemdetail")
public class ItemController {

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping("/{id}")
    public String item(@PathVariable("id") Integer id, ModelMap model){
        Product product = productService.getProductById(id);
        List<Product> listProduct = productService.getProductLimit(0);
        model.addAttribute("item",product);
        model.addAttribute("listProduct",listProduct);
        return "itemdetail";
    }
}
