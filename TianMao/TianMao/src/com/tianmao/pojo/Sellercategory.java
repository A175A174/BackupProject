package com.tianmao.pojo;

import java.io.Serializable;

public class Sellercategory implements Serializable {
    private Integer sellercategoryid;

    private String seller;

    private String name;

    private String isdel;

    private static final long serialVersionUID = 1L;

    public Integer getSellercategoryid() {
        return sellercategoryid;
    }

    public void setSellercategoryid(Integer sellercategoryid) {
        this.sellercategoryid = sellercategoryid;
    }

    public String getSeller() {
        return seller;
    }

    public void setSeller(String seller) {
        this.seller = seller == null ? null : seller.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }
}