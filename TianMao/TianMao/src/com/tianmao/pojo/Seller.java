package com.tianmao.pojo;

import java.io.Serializable;

public class Seller implements Serializable {
    private Integer sellerid;

    private String sellercode;

    private String name;

    private String password;

    private String address;

    private Double balance;

    private String isdel;

    private String banner;

    private String notice;

    private static final long serialVersionUID = 1L;

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public String getSellercode() {
        return sellercode;
    }

    public void setSellercode(String sellercode) {
        this.sellercode = sellercode == null ? null : sellercode.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner == null ? null : banner.trim();
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice == null ? null : notice.trim();
    }

	@Override
	public String toString() {
		return "Seller [sellerid=" + sellerid + ", sellercode=" + sellercode + ", name=" + name + ", password="
				+ password + ", address=" + address + ", balance=" + balance + ", isdel=" + isdel + ", banner=" + banner
				+ ", notice=" + notice + "]";
	}
}