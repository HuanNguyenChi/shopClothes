package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.CategoryDAO;
import com.huanNguyen.shopClothes.entity.Category;
import com.huanNguyen.shopClothes.services.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private CategoryDAO categoryDAO;
    @Override
    public List<Category> getAllCategory() {
        return categoryDAO.getAllCategory();
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryDAO.getCategoryById(id);
    }
}
