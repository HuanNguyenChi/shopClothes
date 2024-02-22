package com.huanNguyen.shopClothes.entity;

import java.util.Objects;

public class Cart {
    private Integer productDetailId;
    private Integer productId;
    private Integer colorId;
    private Integer sizeId;
    private Integer quantity;
    private Integer price;
    private String color;
    private String size;
    private String product;

    public Cart(Integer productDetailId, Integer productId, Integer colorId, Integer sizeId, Integer quantity, Integer price, String color, String size, String product) {
        this.productDetailId = productDetailId;
        this.productId = productId;
        this.colorId = colorId;
        this.sizeId = sizeId;
        this.quantity = quantity;
        this.price = price;
        this.color = color;
        this.size = size;
        this.product = product;
    }

    public Integer getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(Integer productDetailId) {
        this.productDetailId = productDetailId;
    }

    public Cart() {
    }

    @Override
    public String toString() {
        return "Cart{" +
                "productId=" + productId +
                ", colorId=" + colorId +
                ", sizeId=" + sizeId +
                ", quantity=" + quantity +
                ", price=" + price +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", product='" + product + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Cart)) return false;
        Cart cart = (Cart) o;
        return Objects.equals(getProductId(), cart.getProductId())
                && Objects.equals(getColorId(), cart.getColorId())
                && Objects.equals(getSizeId(), cart.getSizeId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getProductId(), getColorId(), getSizeId(), getQuantity(), getPrice(), getColor(), getSize(), getProduct());
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getColorId() {
        return colorId;
    }

    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }

    public Integer getSizeId() {
        return sizeId;
    }

    public void setSizeId(Integer sizeid) {
        this.sizeId = sizeid;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }
}
