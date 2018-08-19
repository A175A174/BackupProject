package com.musics.dto;

import java.util.Date;

public class UserDto implements BaseDto{

	private int id;
	private String name;
	private String pass;
	private int hide;
	private int vip;
	private String icon;
	private int age;
	private int sex;
	private Date birth;
	
	
	/**
	 * 默认的构造方法必须不能省，不然JSON不能解析
	 */
	public UserDto() {
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getHide() {
		return hide;
	}
	public void setHide(int hide) {
		this.hide = hide;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	public UserDto(String name, String pass, String icon, int age, int sex, Date birth) {
		this.name = name;
		this.pass = pass;
		this.icon = icon;
		this.age = age;
		this.sex = sex;
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "UserDto [id=" + id + ", name=" + name + ", pass=" + pass + ", hide=" + hide + ", vip=" + vip + ", icon="
				+ icon + ", age=" + age + ", sex=" + sex + ", birth=" + birth + "]";
	}
}
