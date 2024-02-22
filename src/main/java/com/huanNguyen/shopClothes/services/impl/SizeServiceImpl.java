package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.SizeDAO;
import com.huanNguyen.shopClothes.entity.Size;
import com.huanNguyen.shopClothes.services.ISizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SizeServiceImpl implements ISizeService {

    @Autowired
    private SizeDAO sizeDAO;

    @Override
    public Size getSizeById(int id) {
        return sizeDAO.getSizeById(id);
    }

    @Override
    public List<Size> getAllSize() {
        return sizeDAO.getAllSize();
    }
}
