package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.StaffDAO;
import com.huanNguyen.shopClothes.entity.Staff;
import com.huanNguyen.shopClothes.services.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StaffServiceImpl implements IStaffService {
    @Autowired
    private StaffDAO staffDAO;
    @Override
    public boolean checkLogin(String email,String password) {
        return staffDAO.checkLogin(email,password);
    }

    @Override
    public boolean addStaff(Staff staff) {
        return staffDAO.addStaff(staff);
    }
}
