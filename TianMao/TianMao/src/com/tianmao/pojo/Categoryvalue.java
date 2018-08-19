package com.tianmao.pojo;

import java.io.Serializable;

public class Categoryvalue implements Serializable {
    private Integer categoryvalueid;

    private Integer productid;

    private Integer categoryid;

    private static final long serialVersionUID = 1L;

    public Integer getCategoryvalueid() {
        return categoryvalueid;
    }

    public void setCategoryvalueid(Integer categoryvalueid) {
        this.categoryvalueid = categoryvalueid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

	@Override
	public String toString() {
		return "Categoryvalue [categoryvalueid=" + categoryvalueid + ", productid=" + productid + ", categoryid="
				+ categoryid + "]";
	}
}