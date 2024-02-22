package com.huanNguyen.shopClothes.dao;

import com.huanNguyen.shopClothes.entity.Role;
import com.huanNguyen.shopClothes.services.IRoleService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RoleDAO implements IRoleService {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public Role getRoleById(Integer id) {
        Session session =sessionFactory.getCurrentSession();
        Role role = new Role();
        try{
            role = (Role) session.createQuery(" from role where id ='" + id + "'").getSingleResult();
            if(role != null){
                System.out.println(role.toString());
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return role;
    }
}
