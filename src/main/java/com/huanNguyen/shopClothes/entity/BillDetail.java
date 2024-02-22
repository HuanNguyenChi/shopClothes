package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;


@Entity(name = "bill_detail")
public class BillDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "bill_id")
    private Bill billId;

    @ManyToOne
    @JoinColumn(name = "product_detail_id")
    private ProductDetail productDetailId;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price")
    private Integer price;

    public BillDetail() {
    }

    public BillDetail(Integer id, Bill billId, ProductDetail productDetailId, Integer quantity, Integer price) {
        this.id = id;
        this.billId = billId;
        this.productDetailId = productDetailId;
        this.quantity = quantity;
        this.price = price;
    }

    @Override
    public String toString() {
        return "BillDetail{" +
                "id=" + id +
                ", billId=" + billId +
                ", productDetailId=" + productDetailId +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Bill getBillId() {
        return billId;
    }

    public void setBillId(Bill billId) {
        this.billId = billId;
    }

    public ProductDetail getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(ProductDetail productDetailId) {
        this.productDetailId = productDetailId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}

