package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "voucher")
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String name;
    @Column
    private String date_started;
    @Column
    private String date_end;
    @Column
    private String description;
    @Column
    private String image_voucher;
    @Column
    private Integer reduce;

    @ManyToMany(mappedBy = "voucherList",cascade = CascadeType.ALL)
    private List<Product> productList;

    public Voucher() {
    }

    public Voucher(Integer id, String name, String date_started, String date_end, String description, String image_voucher, Integer reduce, List<Product> productList) {
        this.id = id;
        this.name = name;
        this.date_started = date_started;
        this.date_end = date_end;
        this.description = description;
        this.image_voucher = image_voucher;
        this.reduce = reduce;
        this.productList = productList;
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

    public String getDate_started() {
        return date_started;
    }

    public void setDate_started(String date_started) {
        this.date_started = date_started;
    }

    public String getDate_end() {
        return date_end;
    }

    public void setDate_end(String date_end) {
        this.date_end = date_end;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_voucher() {
        return image_voucher;
    }

    public void setImage_voucher(String image_voucher) {
        this.image_voucher = image_voucher;
    }

    public Integer getReduce() {
        return reduce;
    }

    public void setReduce(Integer reduce) {
        this.reduce = reduce;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }
}
