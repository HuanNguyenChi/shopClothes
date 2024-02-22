package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.BillDetail;
import com.huanNguyen.shopClothes.services.IBillDetailService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BillDetailDAO implements IBillDetailService {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void saveBillDetail(BillDetail billDetail) {
        Session session = sessionFactory.getCurrentSession();
        try{
            int x = (int) session.save(billDetail);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    @Transactional
    public List<BillDetail> getAllBillDetail() {
        List<BillDetail> result = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from bill_detail";
        try{
            result = session.createQuery(sql.toString()).getResultList();
            Collections.sort(result, new Comparator<BillDetail>() {
                @Override
                public int compare(BillDetail o1, BillDetail o2) {
                    return o1.getBillId().getDateCreated().compareTo(o1.getBillId().getDateCreated());
                }
            });
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    @Transactional
    public List<BillDetail> getBillDetailLimit(int start, int max) {
        List<BillDetail> result = new ArrayList<>();
        Session session = sessionFactory.getCurrentSession();
        String sql = "from bill_detail";
        try{
            result = session.createQuery(sql.toString()).setFirstResult(start).setMaxResults(max).getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

}
