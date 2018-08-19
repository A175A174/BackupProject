package com.musics.dto;

public class CategoryDto implements BaseDto {

	private int id;
	private String category;
	private String describe;
	private int hide;

	/**
	 * 默认的构造方法必须不能省，不然JSON不能解析
	 */
	public CategoryDto() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getHide() {
		return hide;
	}

	public void setHide(int hide) {
		this.hide = hide;
	}

	public CategoryDto(int id, String category, String describe, int hide) {
		super();
		this.id = id;
		this.category = category;
		this.describe = describe;
		this.hide = hide;
	}
}
