package com.tianmao.pojo;

import java.io.Serializable;
import java.util.Date;

public class Evaluate implements Serializable {
    private Integer evaluateid;

    private Integer productid;

    private String userid;

    private String contention;

    private Date createdate;

    private static final long serialVersionUID = 1L;

    public Integer getEvaluateid() {
        return evaluateid;
    }

    public void setEvaluateid(Integer evaluateid) {
        this.evaluateid = evaluateid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid == null ? null : productid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getContention() {
        return contention;
    }

    public void setContention(String contention) {
        this.contention = contention == null ? null : contention.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
}