package com.shiyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shiyu.mapper.GoodsMapper;
import com.shiyu.mapper.OrderListMapper;
import com.shiyu.mapper.OrderMapper;
import com.shiyu.mapper.SellerMapper;
import com.shiyu.pojo.Goods;
import com.shiyu.pojo.Order;
import com.shiyu.pojo.OrderGoods;
import com.shiyu.pojo.Seller;

@Service
public class SellerServiceImpl implements BaseService {
	
	@Autowired
	SellerMapper sellerMapper;
	
	@Autowired
	GoodsMapper goodsMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	OrderListMapper orderListMapper;
	
	public List<OrderGoods> getOrderGoods(Order order) {
		return orderListMapper.selectByOrderId(order.getId());
	}
	
	public boolean addGoods(Goods goods) {
		return goodsMapper.insertSelective(goods)==1?true:false;
	}
	
	public List<Goods> getGoods(Seller seller) {
		return goodsMapper.selectByPrimarySellerId(seller.getId());
	}
	
	public List<Goods> getAGoods(Seller seller) {
		return goodsMapper.selectByPrimaryASellerId(seller.getId());
	}
	
	public List<Order> getOrders(Seller seller) {
		return orderMapper.selectByPrimarySellerId(seller.getId());
	}
	
	public List<Seller> getSellers() {
		return sellerMapper.selectList();
	}
	
	public Seller getSellersById(Seller seller) {
		return sellerMapper.selectByPrimaryKey(seller.getId());
	}
	
	public List<Seller> getAllSellers() {
		return sellerMapper.selectAllList();
	}
	
	public boolean reg(Seller seller) {
		return sellerMapper.insertSelective(seller)==1?true:false;
	}
	
	public boolean cz(Seller seller) {
		return sellerMapper.updateByPrimaryKeySelective(seller)==1?true:false;
	}
	
	public Seller log(Seller seller) {
		return sellerMapper.selectByPrimaryUserName(seller.getUsername());
	}
	
	public boolean verify(Seller seller) {
		return sellerMapper.updateByPrimaryKeySelective(seller)==1?true:false;
	}
	
	public boolean gverify(Goods goods) {
		return goodsMapper.updateByPrimaryKeySelective(goods)==1?true:false;
	}
	
}
