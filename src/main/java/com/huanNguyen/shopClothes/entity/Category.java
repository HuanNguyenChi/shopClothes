package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "image_category")
    private String image_category;
    @OneToMany(mappedBy = "categoryId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<Product> productId;

    public Category() {
    }

    public Category(Integer id, String name, String image_category, List<Product> productId) {
        this.id = id;
        this.name = name;
        this.image_category = image_category;
        this.productId = productId;
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

    public String getImage_category() {
        return image_category;
    }

    public void setImage_category(String image_category) {
        this.image_category = image_category;
    }

    public List<Product> getProductId() {
        return productId;
    }

    public void setProductId(List<Product> productId) {
        this.productId = productId;
    }
}
