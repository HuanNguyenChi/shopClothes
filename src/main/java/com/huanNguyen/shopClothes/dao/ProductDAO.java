package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Product;
import com.huanNguyen.shopClothes.services.IProductService;
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
public class ProductDAO implements IProductService {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Product> getProductLimit(int productStarted) {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = new ArrayList<>();
        String sql = "from product";
        try {
            list = (List<Product>) session.createQuery(sql.toString()).
                    setFirstResult(productStarted).
                    setMaxResults(8).
                    getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from product where id = " + id;
        Product product = new Product();
        try{
            product = (Product) session.createQuery(sql).getSingleResult();
        }catch (Exception e){
            e.printStackTrace();
        }
        return product;
    }

    @Override
    @Transactional
    public List<Product> getProductByCategoryId(int[] ids) {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = new ArrayList<>();
        try{
            for (Integer id : ids ){
                String sql = "from  product where category_id = " + id;
                List<Product> subList = (ArrayList<Product>)session.createQuery(sql).getResultList();
                for(Product item : subList){
                    list.add(item);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    @Transactional
    public int saveProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();
        return (int) session.save(product);
    }

    @Override
    @Transactional
    public List<Product> getAllProduct() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from product";
        List<Product> ans = new ArrayList<>();
        try{
            ans = session.createQuery(sql.toString()).getResultList();
        }catch (Exception e){
            e.printStackTrace();
        }
        return ans;
    }
}
