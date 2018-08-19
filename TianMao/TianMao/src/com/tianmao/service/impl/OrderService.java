package com.tianmao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tianmao.mapper.EvaluateMapper;
import com.tianmao.mapper.OrderMapper;
import com.tianmao.mapper.OrderexpressMapper;
import com.tianmao.mapper.OrderitemMapper;
import com.tianmao.mapper.ProductMapper;
import com.tianmao.mapper.SellerMapper;
import com.tianmao.mapper.UserMapper;
import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Order;
import com.tianmao.pojo.Orderexpress;
import com.tianmao.pojo.Orderitem;
import com.tianmao.pojo.Product;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.User;
import com.tianmao.service.IOrderService;

@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderitemMapper orderitemMapper;
	
	@Autowired
	private OrderexpressMapper orderexpressMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private SellerMapper sellerMapper;
	
	@Autowired
	private EvaluateMapper evaluateMapper;
	
	/**
	 * 查询销量
	 */
	@Override
	public Orderitem selectNUM(Orderitem orderitem) {
		return orderitemMapper.selectByproductIdNum(orderitem.getProductid());
	}
	

	/**
	 * 查询订单
	 */
	@Override
	public Order selectByorderCode(Order order) {
		return orderMapper.selectByorderCode(order);
	}
	@Override
	public Order selectByorderCodeAndstatus(Order order) {
		return orderMapper.selectByorderCodeAndstatus(order);
	}
	@Override
	public List<Order> selectBysellerIdAndstatus(Order order) {
		return orderMapper.selectBysellerIdAndstatus(order);
	}
	@Override
	public List<Order> selectByuserIdAndstatus(Order order) {
		return orderMapper.selectByuserIdAndstatus(order);
	}

	/**
	 * 更新订单
	 */
	@Override
	public boolean updateByorderCodeSelective(Order record) {
		return orderMapper.updateByorderCodeSelective(record)==1?true:false;
	}

	/**
	 * 更新订单物流(退货)
	 */
	@Override
	public boolean updateByorderCodeSelective(Orderexpress record) {
		return orderexpressMapper.updateByorderCodeSelective(record)==1?true:false;
	}
	/**
	 * 更新订单物流(发货)
	 */
	@Override
	public boolean insertOrderexpressSelective(Orderexpress record) {
		return orderexpressMapper.insertSelective(record)==1?true:false;
	}

	/**
	 * 添加订单
	 */
	@Override
	public synchronized boolean insertOrderSelective(Order order,List<Orderitem> list) {
		//判断每个商品库存是否充足
		for (Orderitem orderitem : list) {
			int sum = productMapper.selectByPrimaryKey(orderitem.getProductid()).getStock();
			if (orderitem.getNumber() > sum) {
				return false;
			}
		}
		//开始添加
		Product product;
		for (Orderitem orderitem : list) {
			product = productMapper.selectByPrimaryKey(orderitem.getProductid());
			product.setStock(product.getStock()-orderitem.getNumber());
			if(productMapper.updateByPrimaryKey(product)!=1) {
				return false;
			}
			if (orderitemMapper.insertSelective(orderitem)!=1) {
				return false;
			}
		}
		return orderMapper.insertSelective(order)==1?true:false;
	}
	
	/**
	 * 查询订单类容
	 */
	@Override
	public List<Orderitem> selectByorderId(Orderitem orderitem) {
		return orderitemMapper.selectByorderId(orderitem.getOrderid());
	}
	
	/**
	 * 支付订单
	 */
	@Override
	public boolean payOrder(Order order, User user) {
		if(user.getBalance() >= order.getTradeprice().doubleValue()) {
			order.setStatus("1");
			if (orderMapper.updateByorderCodeSelective(order) == 1) {
				user.setBalance(user.getBalance()-order.getTradeprice().doubleValue());
				if(userMapper.updateByuserCodeSelective(user) == 1) {
					return true;					
				}
			}
		}
		return false;
	}
	
	/**
	 * 发货
	 */
	@Override
	public boolean fhOrder(Order order, Orderexpress orderexpress) {
		if(updateByorderCodeSelective(order)) {
			if(insertOrderexpressSelective(orderexpress)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 获取发货物流
	 */
	@Override
	public Orderexpress getOrderexpress(Orderexpress orderexpress) {
		return orderexpressMapper.selectByorderCode(orderexpress.getOrdercode());
	}
	
	/**
	 * 确认收货
	 */
	@Override
	public boolean qrshOrder(Order order, Seller seller) {
		if(updateByorderCodeSelective(order)){
			return sellerMapper.updateBysellerCodeSelective(seller)==1?true:false;
		}
		return false;
	}
	
	/**
	 * 用户退货
	 */
	@Override
	public boolean wythOrder(Order order,Orderexpress orderexpress) {
		if(updateByorderCodeSelective(order)){
			if(updateByorderCodeSelective(orderexpress)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 商户确认退货
	 */
	@Override
	public boolean qrthOrder(Order order,User user) {
		if(updateByorderCodeSelective(order)){
			return userMapper.updateByuserCodeSelective(user)==1?true:false;
		}
		return false;
	}
	
	/**
	 * 添加评论
	 */
	@Override
	public boolean insertEvaluateSelective(Evaluate record) {
		return evaluateMapper.insertSelective(record)==1?true:false;
	}
	
	/**
	 * 获取评论
	 */
	@Override
	public List<Evaluate> selectEvaluateByproductId(Evaluate evaluateid) {
		return evaluateMapper.selectByproductId(evaluateid.getProductid());
	}
}
