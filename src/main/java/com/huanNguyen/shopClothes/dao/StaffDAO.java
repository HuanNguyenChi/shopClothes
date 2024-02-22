package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Staff;
import com.huanNguyen.shopClothes.services.IStaffService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class StaffDAO implements IStaffService{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public boolean checkLogin(String email, String password){
        Session session = sessionFactory.getCurrentSession();

        try{
            Staff staff = (Staff) session.createQuery(" from staff where email = '"
                        + email + "' and password = '"
                        + password + "'").getSingleResult();
            if (staff != null){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    @Override
    @Transactional
    public boolean addStaff(Staff staff) {
        Session session = sessionFactory.getCurrentSession();
        try{
            int id = (int) session.save(staff);

            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
