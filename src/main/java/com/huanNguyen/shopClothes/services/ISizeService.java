package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Size;

import java.util.List;

public interface ISizeService {
    Size getSizeById(int id);
    public List<Size> getAllSize();
}
