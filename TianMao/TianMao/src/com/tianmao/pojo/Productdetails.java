package com.tianmao.pojo;

import java.io.Serializable;

public class Productdetails implements Serializable {
    private Integer productdetailsid;

    private Integer productid;

    private String type;

    private String image;

    private static final long serialVersionUID = 1L;

    public Integer getProductdetailsid() {
        return productdetailsid;
    }

    public void setProductdetailsid(Integer productdetailsid) {
        this.productdetailsid = productdetailsid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

	@Override
	public String toString() {
		return "Productdetails [productdetailsid=" + productdetailsid + ", productid=" + productid + ", type=" + type
				+ ", image=" + image + "]";
	}
}