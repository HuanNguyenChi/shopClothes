package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.BillDetailDAO;
import com.huanNguyen.shopClothes.entity.BillDetail;
import com.huanNguyen.shopClothes.services.IBillDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillDetailServiceImpl implements IBillDetailService {
    @Autowired
    private BillDetailDAO billDetailDAO;
    @Override
    public void saveBillDetail(BillDetail billDetail) {
        billDetailDAO.saveBillDetail(billDetail);
    }

    @Override
    public List<BillDetail> getAllBillDetail() {
        return billDetailDAO.getAllBillDetail();
    }

    @Override
    public List<BillDetail> getBillDetailLimit(int start, int max) {
        return billDetailDAO.getBillDetailLimit(start,max);
    }
}
