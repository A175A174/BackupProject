package com.shiyu.pojo;

public class OrderList {
	
    @Override
	public String toString() {
		return "OrderList [id=" + id + ", orderid=" + orderid + ", goodsid=" + goodsid + ", sum=" + sum + "]";
	}

	private Integer id;

    private Integer orderid;

    private Integer goodsid;

    private Integer sum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }
}