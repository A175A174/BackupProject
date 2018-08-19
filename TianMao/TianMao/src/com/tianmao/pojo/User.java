package com.tianmao.pojo;

import java.io.Serializable;

public class User implements Serializable {
    private Integer userid;

    private String usercode;

    private String name;

    private String password;

    private Integer paypass;

    private Double balance;

    private String isdel;

    private static final long serialVersionUID = 1L;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode == null ? null : usercode.trim();
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

    public Integer getPaypass() {
        return paypass;
    }

    public void setPaypass(Integer paypass) {
        this.paypass = paypass;
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

	@Override
	public String toString() {
		return "User [userid=" + userid + ", usercode=" + usercode + ", name=" + name + ", password=" + password
				+ ", paypass=" + paypass + ", balance=" + balance + ", isdel=" + isdel + "]";
	}
}