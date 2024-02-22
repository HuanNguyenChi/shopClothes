package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "size")
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "sizeId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<ProductDetail> productDetailId;
    public Size() {
    }

    public Size(Integer id, String name, List<ProductDetail> productDetailId) {
        this.id = id;
        this.name = name;
        this.productDetailId = productDetailId;
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

    public List<ProductDetail> getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(List<ProductDetail> productDetailId) {
        this.productDetailId = productDetailId;
    }
}
