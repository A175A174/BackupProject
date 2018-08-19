package com.shiyu.pojo;

public class OrderGoods {
	
	@Override
	public String toString() {
		return "OrderGoods [name=" + name + ", price=" + price + ", icon=" + icon + ", sum=" + sum + "]";
	}

	private String name;

    private Double price;
    
    private String icon;
    
    private Integer sum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}
}
