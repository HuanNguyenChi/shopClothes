package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Size;
import com.huanNguyen.shopClothes.services.ISizeService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class SizeDAO implements ISizeService {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Size getSizeById(int id) {
        String sql = "from size where id = " + id ;
        Session session = sessionFactory.getCurrentSession();
        try{

            Size size = (Size) session.createQuery(sql).getSingleResult();
            return size;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Size> getAllSize() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from size";
        List<Size> ans = new ArrayList<>();
        try{
            ans = session.createQuery(sql.toString()).getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return ans;
    }
}
