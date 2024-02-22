package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.ProductDetailDAO;
import com.huanNguyen.shopClothes.entity.ProductDetail;
import com.huanNguyen.shopClothes.services.IProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductDetailSeviceImpl implements IProductDetailService {
    @Autowired
    private ProductDetailDAO productDetailDAO;
    @Override
    public List<ProductDetail> getAllProductDetail() {
        return productDetailDAO.getAllProductDetail();
    }

    @Override
    public int saveproductDetail(ProductDetail productDetail) {
        return productDetailDAO.saveproductDetail(productDetail);
    }

    @Override
    public ProductDetail getProductDetailById(int id) {
        return productDetailDAO.getProductDetailById(id);
    }
}
