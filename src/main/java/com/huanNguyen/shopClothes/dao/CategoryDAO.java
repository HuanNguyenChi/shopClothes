package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Category;
import com.huanNguyen.shopClothes.services.ICategoryService;
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
public class CategoryDAO implements ICategoryService {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Category> getAllCategory() {
        Session session = sessionFactory.getCurrentSession();
        String sql = " from category";
        List<Category> ans = new ArrayList<>();
        try {
            ans = session.createQuery(sql.toString()).getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return ans;
    }

    @Override
    public Category getCategoryById(int id) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from category where id = " + id;
        Category category = new Category();
        try{
            category = (Category) session.createQuery(sql.toString()).getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
        }
        return category;
    }
}
