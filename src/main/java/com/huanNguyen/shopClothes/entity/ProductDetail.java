package com.huanNguyen.shopClothes.entity;

import org.w3c.dom.stylesheets.LinkStyle;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Entity(name = "product_detail")
public class ProductDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "quatity")
    private Integer quantity;
    @Column(name = "date_imported")
    private String dateImported;
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product productId;
    @ManyToOne
    @JoinColumn(name = "color_id")
    private Color colorId;
    @ManyToOne
    @JoinColumn(name = "size_id")
    private Size sizeId;

    @OneToMany(mappedBy = "productDetailId",fetch = FetchType.EAGER)
    private List<BillDetail> billDetailList;
    public ProductDetail() {
    }

    public ProductDetail( Integer quantity, String dateImported, Product productId, Color colorId, Size sizeId) {
        this.quantity = quantity;
        this.dateImported = dateImported;
        this.productId = productId;
        this.colorId = colorId;
        this.sizeId = sizeId;

    }



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductDetail)) return false;
        ProductDetail that = (ProductDetail) o;
        return Objects.equals(getProductId(), that.getProductId()) && Objects.equals(getColorId(), that.getColorId()) && Objects.equals(getSizeId(), that.getSizeId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getProductId(), getColorId(), getSizeId());
    }

    public List<BillDetail> getBillDetailList() {
        return billDetailList;
    }

    public void setBillDetailList(List<BillDetail> billDetailList) {
        this.billDetailList = billDetailList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getDateImported() {
        return dateImported;
    }

    public void setDateImported(String dateImported) {
        this.dateImported = dateImported;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public Color getColorId() {
        return colorId;
    }

    public void setColorId(Color colorId) {
        this.colorId = colorId;
    }

    public Size getSizeId() {
        return sizeId;
    }

    public void setSizeId(Size sizeId) {
        this.sizeId = sizeId;
    }
}
