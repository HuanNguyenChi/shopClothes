package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.ColorDAO;
import com.huanNguyen.shopClothes.entity.Color;
import com.huanNguyen.shopClothes.services.IColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColorServiceImpl implements IColorService {
    @Autowired
    private ColorDAO colorDAO;

    @Override
    public Color getColorById(int id) {
        return colorDAO.getColorById(id);
    }

    @Override
    public List<Color> getAllColor() {
        return colorDAO.getAllColor();
    }
}
