package com.tianmao.pojo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public class MavData extends ModelAndView implements Serializable{
	
	private static final long serialVersionUID = -2501295028170455048L;
	
	private Map<String, List<Product>> mapp = new HashMap<String, List<Product>>();
	
	private Map<String, List<List<Productdetails>>> mapd = new HashMap<String, List<List<Productdetails>>>();
	
	public Map<String, List<Product>> getMapp() {
		return mapp;
	}
	public Map<String, List<List<Productdetails>>> getMapd() {
		return mapd;
	}
}
