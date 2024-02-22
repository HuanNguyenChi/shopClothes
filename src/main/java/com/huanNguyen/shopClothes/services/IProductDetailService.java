package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.ProductDetail;

import java.util.List;

public interface IProductDetailService {
    public List<ProductDetail> getAllProductDetail();
    public int saveproductDetail(ProductDetail productDetail);
    public ProductDetail getProductDetailById(int id);
}
