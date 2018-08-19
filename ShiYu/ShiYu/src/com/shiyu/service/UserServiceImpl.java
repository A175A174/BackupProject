package com.shiyu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shiyu.mapper.OrderListMapper;
import com.shiyu.mapper.OrderMapper;
import com.shiyu.mapper.UserMapper;
import com.shiyu.pojo.Order;
import com.shiyu.pojo.OrderList;
import com.shiyu.pojo.User;

@Service
public class UserServiceImpl implements BaseService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
	@Autowired
	OrderListMapper orderListMapper;
	
	public boolean cz(Order order) {
		return orderMapper.updateByPrimaryKeySelective(order)==1?true:false;
	}
	
	public Order getOrder(Order order) {
		return orderMapper.selectByPrimaryKey(order.getId());
	}
	
	public boolean cz(User user) {
		return userMapper.updateByPrimaryKeySelective(user)==1?true:false;
	}
	
	public List<Order> getOrders(User user) {
		return orderMapper.selectByPrimaryUserId(user.getId());
	}
	
	public boolean tj(Order order) {
		return orderMapper.insertSelective(order)==1?true:false;
	}
	
	public boolean tj(OrderList orderList) {
		return orderListMapper.insertSelective(orderList)==1?true:false;
	}
	
	public boolean reg(User user) {
		return userMapper.insertSelective(user)==1?true:false;
	}
	
	public User log(User user) {
		return userMapper.selectByPrimaryUserName(user.getUsername());
	}
	
	public User logbyid(User user) {
		return userMapper.selectByPrimaryKey(user.getId());
	}
}
