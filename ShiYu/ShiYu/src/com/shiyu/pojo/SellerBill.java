package com.shiyu.pojo;

import java.util.Date;

public class SellerBill {
    private Integer id;

    private Double money;

    private Date withdrawalstime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getWithdrawalstime() {
        return withdrawalstime;
    }

    public void setWithdrawalstime(Date withdrawalstime) {
        this.withdrawalstime = withdrawalstime;
    }
}