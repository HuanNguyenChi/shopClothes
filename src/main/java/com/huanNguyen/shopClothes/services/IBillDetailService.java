package com.huanNguyen.shopClothes.services;

import com.huanNguyen.shopClothes.entity.Bill;
import com.huanNguyen.shopClothes.entity.BillDetail;

import java.util.List;

public interface IBillDetailService {
    public void saveBillDetail(BillDetail billDetail);
    public List<BillDetail> getAllBillDetail();
    public List<BillDetail> getBillDetailLimit(int start, int max);
}
