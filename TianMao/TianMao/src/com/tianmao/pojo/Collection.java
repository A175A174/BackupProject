package com.tianmao.pojo;

import java.io.Serializable;

public class Collection implements Serializable {
    private Integer collectionid;

    private String collectioner;

    private String type;

    private String value;

    private static final long serialVersionUID = 1L;

    public Integer getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(Integer collectionid) {
        this.collectionid = collectionid;
    }

    public String getCollectioner() {
        return collectioner;
    }

    public void setCollectioner(String collectioner) {
        this.collectioner = collectioner == null ? null : collectioner.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }
}