package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Color;

import java.util.List;

public interface IColorService {
    Color getColorById(int id);
    public List<Color> getAllColor();
}
