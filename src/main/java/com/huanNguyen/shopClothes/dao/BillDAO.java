package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Bill;
import com.huanNguyen.shopClothes.services.IBillService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BillDAO implements IBillService {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public int saveBill(Bill bill) {
        Session session = sessionFactory.getCurrentSession();
        try{
            int position = (int) session.save(bill);
            return position;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }
}
