package com.tianmao.pojo;

import java.io.Serializable;

public class Orderexpress implements Serializable {
    private Integer expressid;

    private String ordercode;

    private String shipmentsname;

    private String shipmentscode;

    private String returnname;

    private String returncode;

    private static final long serialVersionUID = 1L;

    public Integer getExpressid() {
        return expressid;
    }

    public void setExpressid(Integer expressid) {
        this.expressid = expressid;
    }

    public String getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(String ordercode) {
        this.ordercode = ordercode == null ? null : ordercode.trim();
    }

    public String getShipmentsname() {
        return shipmentsname;
    }

    public void setShipmentsname(String shipmentsname) {
        this.shipmentsname = shipmentsname == null ? null : shipmentsname.trim();
    }

    public String getShipmentscode() {
        return shipmentscode;
    }

    public void setShipmentscode(String shipmentscode) {
        this.shipmentscode = shipmentscode == null ? null : shipmentscode.trim();
    }

    public String getReturnname() {
        return returnname;
    }

    public void setReturnname(String returnname) {
        this.returnname = returnname == null ? null : returnname.trim();
    }

    public String getReturncode() {
        return returncode;
    }

    public void setReturncode(String returncode) {
        this.returncode = returncode == null ? null : returncode.trim();
    }

	@Override
	public String toString() {
		return "Orderexpress [expressid=" + expressid + ", ordercode=" + ordercode + ", shipmentsname=" + shipmentsname
				+ ", shipmentscode=" + shipmentscode + ", returnname=" + returnname + ", returncode=" + returncode
				+ "]";
	}
}