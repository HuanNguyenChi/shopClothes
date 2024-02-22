package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getProductLimit(int productStarted);
    Product getProductById(int id);
    List<Product> getProductByCategoryId(int[] id);
    int saveProduct(Product product);
    List<Product> getAllProduct();
}
