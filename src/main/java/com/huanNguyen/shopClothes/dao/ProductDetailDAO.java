package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.ProductDetail;
import com.huanNguyen.shopClothes.services.IProductDetailService;
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
public class ProductDetailDAO implements IProductDetailService {
    @Autowired
    private SessionFactory sessionFactory;


    @Override
    @Transactional
    public List<ProductDetail> getAllProductDetail() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from product_detail";
        List<ProductDetail> list = new ArrayList<>();
        try {
            list = session.createQuery(sql.toString()).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    @Transactional
    public int saveproductDetail(ProductDetail productDetail) {
        Session session = sessionFactory.getCurrentSession();
        try {
            int id = (int) session.save(productDetail);
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    @Transactional
    public ProductDetail getProductDetailById(int id) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from product_detail where id = " + id;
        ProductDetail item = new ProductDetail();
        try {
            item = (ProductDetail) session.createQuery(sql).getSingleResult();
            return item;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
