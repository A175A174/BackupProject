package com.tianmao.pojo;

import java.io.Serializable;

public class Productproperty implements Serializable {
    private Integer productpropertyid;

    private Integer productid;

    private String name;

    private String value;

    private static final long serialVersionUID = 1L;

    public Integer getProductpropertyid() {
        return productpropertyid;
    }

    public void setProductpropertyid(Integer productpropertyid) {
        this.productpropertyid = productpropertyid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }
}