package com.tianmao.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class Freight implements Serializable {
    private Integer freightid;

    private String sellerid;

    private String address;

    private BigDecimal cost;

    private static final long serialVersionUID = 1L;

    public Integer getFreightid() {
        return freightid;
    }

    public void setFreightid(Integer freightid) {
        this.freightid = freightid;
    }

    public String getSellerid() {
        return sellerid;
    }

    public void setSellerid(String sellerid) {
        this.sellerid = sellerid == null ? null : sellerid.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

	@Override
	public String toString() {
		return "Freight [freightid=" + freightid + ", sellerid=" + sellerid + ", address=" + address + ", cost=" + cost
				+ "]";
	}
}