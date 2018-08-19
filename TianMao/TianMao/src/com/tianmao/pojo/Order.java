package com.tianmao.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Order implements Serializable {
    private Integer orderid;

    private String ordercode;

    private String sellerid;

    private String userid;

    private String userremark;

    private Date createdate;

    private Date paydate;

    private Date confirmdate;

    private String status;

    private BigDecimal tradeprice;

    private String isdel;

    private Integer addressid;

    private static final long serialVersionUID = 1L;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getOrdercode() {
        return ordercode;
    }

    public void setOrdercode(String ordercode) {
        this.ordercode = ordercode == null ? null : ordercode.trim();
    }

    public String getSellerid() {
        return sellerid;
    }

    public void setSellerid(String sellerid) {
        this.sellerid = sellerid == null ? null : sellerid.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUserremark() {
        return userremark;
    }

    public void setUserremark(String userremark) {
        this.userremark = userremark == null ? null : userremark.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getPaydate() {
        return paydate;
    }

    public void setPaydate(Date paydate) {
        this.paydate = paydate;
    }

    public Date getConfirmdate() {
        return confirmdate;
    }

    public void setConfirmdate(Date confirmdate) {
        this.confirmdate = confirmdate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public BigDecimal getTradeprice() {
        return tradeprice;
    }

    public void setTradeprice(BigDecimal tradeprice) {
        this.tradeprice = tradeprice;
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", ordercode=" + ordercode + ", sellerid=" + sellerid + ", userid="
				+ userid + ", userremark=" + userremark + ", createdate=" + createdate + ", paydate=" + paydate
				+ ", confirmdate=" + confirmdate + ", status=" + status + ", tradeprice=" + tradeprice + ", isdel="
				+ isdel + ", addressid=" + addressid + "]";
	}
}