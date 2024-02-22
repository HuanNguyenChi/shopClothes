package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.BillDAO;
import com.huanNguyen.shopClothes.entity.Bill;
import com.huanNguyen.shopClothes.services.IBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BillServiceImpl implements IBillService {
    @Autowired
    private BillDAO billDAO;
    @Override
    public int saveBill(Bill bill) {
        return billDAO.saveBill(bill);
    }
}
