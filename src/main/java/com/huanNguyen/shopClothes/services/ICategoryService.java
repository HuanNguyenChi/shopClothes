package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Category;

import java.util.List;

public interface ICategoryService {
    public List<Category> getAllCategory();
    public Category getCategoryById(int id);
}
