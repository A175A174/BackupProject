package com.tianmao.pojo;

import java.io.Serializable;

public class Orderitem implements Serializable {
    private Integer orderitemid;

    private String orderid;

    private Integer productid;

    private Integer number;

    private static final long serialVersionUID = 1L;

    public Integer getOrderitemid() {
        return orderitemid;
    }

    public void setOrderitemid(Integer orderitemid) {
        this.orderitemid = orderitemid;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid == null ? null : productid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

	@Override
	public String toString() {
		return "Orderitem [orderitemid=" + orderitemid + ", orderid=" + orderid + ", productid=" + productid
				+ ", number=" + number + "]";
	}
}