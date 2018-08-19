package com.tianmao.pojo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Gwc implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Map<String,Map<Integer,Integer>> map = new HashMap<String,Map<Integer,Integer>>();
	
	public Map<String, Map<Integer, Integer>> getMap() {
		return map;
	}
	
	public void del(String sellerid) {
		Map<String,Map<Integer,Integer>> map = getMap();
		map.remove(sellerid);
	}
	
	public void add(Product product,Integer num) {
		Map<String,Map<Integer,Integer>> map = getMap();
		Map<Integer,Integer> mp = map.get(product.getSellerid());
		if(mp == null) {
			mp = new HashMap<Integer,Integer>();
			mp.put(product.getProductid(), num);
			map.put(product.getSellerid(), mp);
		}else {
			mp.put(product.getProductid(), num);
			map.put(product.getSellerid(), mp);
		}
	}
	
	public String delItem(Product product) {
		Map<String,Map<Integer,Integer>> map = getMap();
		Map<Integer,Integer> mp = map.get(product.getSellerid());
		mp.remove(product.getProductid());
		if(mp.size()==0) {
			map.remove(product.getSellerid());
			return "1";
		}
		return "2";
	}

	@Override
	public String toString() {
		return "Gwc [map=" + map + "]";
	}
}
