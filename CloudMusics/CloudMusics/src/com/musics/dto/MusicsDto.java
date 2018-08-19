package com.musics.dto;

public class MusicsDto {

	private int id;
	private String name;
	private String singer;
	private String album;
	private int category;
	private String describe;
	private int hide;
	private String net_Address;
	private String local_Address;
	
	@Override
	public String toString() {
		return "MusicsDto [id=" + id + ", name=" + name + ", singer=" + singer + ", album=" + album + ", category="
				+ category + ", describe=" + describe + ", hide=" + hide + ", net_Address=" + net_Address
				+ ", local_Address=" + local_Address + "]";
	}

	/**
	 * 默认的构造方法必须不能省，不然JSON不能解析
	 */
	public MusicsDto() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
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
	public String getNet_Address() {
		return net_Address;
	}
	public void setNet_Address(String net_Address) {
		this.net_Address = net_Address;
	}
	public String getLocal_Address() {
		return local_Address;
	}
	public void setLocal_Address(String local_Address) {
		this.local_Address = local_Address;
	}
	
	public MusicsDto(int id, String name, String singer, String album, int category, String describe, int hide,String net_Address, String local_Address) {
		this.id = id;
		this.name = name;
		this.singer = singer;
		this.album = album;
		this.category = category;
		this.describe = describe;
		this.hide = hide;
		this.net_Address = net_Address;
		this.local_Address = local_Address;
	}	
}
