package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.ProductDAO;
import com.huanNguyen.shopClothes.entity.Product;
import com.huanNguyen.shopClothes.services.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductDAO productDAO;

    @Override
    public List<Product> getProductLimit(int productStarted) {
        return productDAO.getProductLimit(productStarted);
    }

    @Override
    public Product getProductById(int id) {
        return productDAO.getProductById(id);
    }

    @Override
    public List<Product> getProductByCategoryId(int[] id) {
        return productDAO.getProductByCategoryId(id);
    }

    @Override
    public int saveProduct(Product product) {
        return productDAO.saveProduct(product);
    }

    @Override
    public List<Product> getAllProduct() {
        return productDAO.getAllProduct();
    }
}
