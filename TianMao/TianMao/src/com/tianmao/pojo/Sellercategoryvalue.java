package com.tianmao.pojo;

import java.io.Serializable;

public class Sellercategoryvalue implements Serializable {
    private Integer sellercategoryvalueid;

    private Integer sellercategoryid;

    private Integer product;

    private static final long serialVersionUID = 1L;

    public Integer getSellercategoryvalueid() {
        return sellercategoryvalueid;
    }

    public void setSellercategoryvalueid(Integer sellercategoryvalueid) {
        this.sellercategoryvalueid = sellercategoryvalueid;
    }

    public Integer getSellercategoryid() {
        return sellercategoryid;
    }

    public void setSellercategoryid(Integer sellercategoryid) {
        this.sellercategoryid = sellercategoryid;
    }

    public Integer getProduct() {
        return product;
    }

    public void setProduct(Integer product) {
        this.product = product;
    }
}