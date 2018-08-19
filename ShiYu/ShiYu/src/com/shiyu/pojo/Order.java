package com.shiyu.pojo;

import java.util.Date;

public class Order {
	
    @Override
	public String toString() {
		return "Order [id=" + id + ", userid=" + userid + ", sellerid=" + sellerid + ", price=" + price + ", address="
				+ address + ", state=" + state + ", ishide=" + ishide + ", currentime=" + currentime + "]";
	}

	private Integer id;

    private Integer userid;

    private Integer sellerid;

    private Double price;

    private String address;

    private Integer state;

    private Integer ishide;

    private Date currentime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getSellerid() {
        return sellerid;
    }

    public void setSellerid(Integer sellerid) {
        this.sellerid = sellerid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getIshide() {
        return ishide;
    }

    public void setIshide(Integer ishide) {
        this.ishide = ishide;
    }

    public Date getCurrentime() {
        return currentime;
    }

    public void setCurrentime(Date currentime) {
        this.currentime = currentime;
    }
}