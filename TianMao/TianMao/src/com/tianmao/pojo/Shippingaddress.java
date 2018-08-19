package com.tianmao.pojo;

import java.io.Serializable;

public class Shippingaddress implements Serializable {
    private Integer addressid;

    private String userid;

    private String address;

    private String postcode;

    private String consignee;

    private String phonecode;

    private String isdel;

    private static final long serialVersionUID = 1L;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public String getPhonecode() {
        return phonecode;
    }

    public void setPhonecode(String phonecode) {
        this.phonecode = phonecode == null ? null : phonecode.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

	@Override
	public String toString() {
		return "Shippingaddress [addressid=" + addressid + ", userid=" + userid + ", address=" + address + ", postcode="
				+ postcode + ", consignee=" + consignee + ", phonecode=" + phonecode + ", isdel=" + isdel + "]";
	}
}