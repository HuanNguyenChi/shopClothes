package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "roleId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Staff> staffId;

    public Role() {
    }

    public Role(Integer id, String name, List<Staff> staffId) {
        this.id = id;
        this.name = name;
        this.staffId = staffId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Staff> getStaffId() {
        return staffId;
    }

    public void setStaffId(List<Staff> staffId) {
        this.staffId = staffId;
    }
}
