package com.huanNguyen.shopClothes.entity;

import javax.persistence.*;
import java.util.List;

@Entity(name = "bill")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "name_customer")
    private String nameCustomer;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "address")
    private String address;
    @Column(name = "status_bill")
    private Boolean statusBill;
    @Column(name = "date_created")
    private String dateCreated;
    @Column(name = "note")
    private String note;
    @OneToMany(mappedBy = "billId",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<BillDetail> billDetailList;

    public Bill() {
    }

    public Bill( String nameCustomer, String phoneNumber, String address, String note) {

        this.nameCustomer = nameCustomer;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.note = note;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Boolean getStatusBill() {
        return statusBill;
    }

    public void setStatusBill(Boolean statusBill) {
        this.statusBill = statusBill;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public List<BillDetail> getBillDetailList() {
        return billDetailList;
    }

    public void setBillDetailList(List<BillDetail> billDetailList) {
        this.billDetailList = billDetailList;
    }
}
