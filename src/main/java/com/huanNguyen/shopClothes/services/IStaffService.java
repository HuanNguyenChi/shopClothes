package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Staff;

public interface IStaffService {
    public boolean checkLogin(String email,String password);
    public boolean addStaff(Staff staff);
}
