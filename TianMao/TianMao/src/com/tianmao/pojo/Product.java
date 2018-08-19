package com.tianmao.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Product implements Serializable {
    private Integer productid;

    private String sellerid;

    private String name;

    private String title;

    private BigDecimal originalprice;

    private BigDecimal discountprice;

    private Integer stock;

    private String introduce;

    private Date createdate;

    private String isdel;

    private static final long serialVersionUID = 1L;

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getSellerid() {
        return sellerid;
    }

    public void setSellerid(String sellerid) {
        this.sellerid = sellerid == null ? null : sellerid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public BigDecimal getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(BigDecimal originalprice) {
        this.originalprice = originalprice;
    }

    public BigDecimal getDiscountprice() {
        return discountprice;
    }

    public void setDiscountprice(BigDecimal discountprice) {
        this.discountprice = discountprice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

	@Override
	public String toString() {
		return "Product [productid=" + productid + ", sellerid=" + sellerid + ", name=" + name + ", title=" + title
				+ ", originalprice=" + originalprice + ", discountprice=" + discountprice + ", stock=" + stock
				+ ", introduce=" + introduce + ", createdate=" + createdate + ", isdel=" + isdel + "]";
	}
}