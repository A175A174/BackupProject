package com.musics.dto;

public class MyMusicsDto implements BaseDto{
	
	private int id;
	private int uid;
	private int mid;
	private int hide;
	
	/**
	 * 默认的构造方法必须不能省，不然JSON不能解析
	 */
	public MyMusicsDto() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getHide() {
		return hide;
	}
	public void setHide(int hide) {
		this.hide = hide;
	}
	
	public MyMusicsDto(int id, int uid, int mid, int hide) {
		super();
		this.id = id;
		this.uid = uid;
		this.mid = mid;
		this.hide = hide;
	}
}