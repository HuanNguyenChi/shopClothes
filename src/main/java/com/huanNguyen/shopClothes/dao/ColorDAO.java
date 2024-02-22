package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Color;
import com.huanNguyen.shopClothes.services.IColorService;
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
public class ColorDAO implements IColorService {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Color getColorById(int id) {
        String sql = "from color where id = " + id;
        Session session = sessionFactory.getCurrentSession();
        try {
            Color color = (Color) session.createQuery(sql).getSingleResult();
            return color;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Color> getAllColor() {
        String sql = "from color";
        Session session = sessionFactory.getCurrentSession();
        List<Color> ans = new ArrayList<>();
        try{
            ans = session.createQuery(sql.toString()).getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return ans;
    }
}
