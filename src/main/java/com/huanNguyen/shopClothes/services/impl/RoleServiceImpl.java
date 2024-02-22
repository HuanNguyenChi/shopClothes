package com.huanNguyen.shopClothes.services.impl;

import com.huanNguyen.shopClothes.dao.RoleDAO;
import com.huanNguyen.shopClothes.entity.Role;
import com.huanNguyen.shopClothes.services.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleDAO roleDAO ;

    @Override
    public Role getRoleById(Integer id) {
        return roleDAO.getRoleById(id);
    }
}
