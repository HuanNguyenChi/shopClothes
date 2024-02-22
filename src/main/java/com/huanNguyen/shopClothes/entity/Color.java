package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "color")
public class Color {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "colorId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<ProductDetail> productDetailId;

    public Color() {
    }

    public Color(Integer id, String color, List<ProductDetail> productDetailId) {
        this.id = id;
        this.name = color;
        this.productDetailId = productDetailId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColor() {
        return name;
    }

    public void setColor(String color) {
        this.name = color;
    }

    public List<ProductDetail> getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(List<ProductDetail> productDetailId) {
        this.productDetailId = productDetailId;
    }
}
