package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "price")
    private Integer price;
    @Column(name = "description")
    private String description;
    @Column(name = "image_product")
    private String image_product;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category categoryId;

    @OneToMany(mappedBy = "productId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<ProductDetail> productDetailId;

    @ManyToMany
    @JoinTable(name = "product_voucher",
    joinColumns = {@JoinColumn(name = "product_id",referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "voucher_id",referencedColumnName = "id")})
    private List<Voucher> voucherList;

    public Product() {
    }

    public Product(Integer id, String name, Integer price, String description, String image_product, Category categoryId, List<ProductDetail> productDetailId, List<Voucher> voucherList) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image_product = image_product;
        this.categoryId = categoryId;
        this.productDetailId = productDetailId;
        this.voucherList = voucherList;
    }

    public List<ProductDetail> getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(List<ProductDetail> productDetailId) {
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_product() {
        return image_product;
    }

    public void setImage_product(String image_product) {
        this.image_product = image_product;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public List<Voucher> getVoucherList() {
        return voucherList;
    }

    public void setVoucherList(List<Voucher> voucherList) {
        this.voucherList = voucherList;
    }
}
