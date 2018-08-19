package com.tianmao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Order;
import com.tianmao.pojo.Orderexpress;
import com.tianmao.pojo.Orderitem;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.User;

@Service
public interface IOrderService {
	
	boolean insertOrderSelective(Order order,List<Orderitem> list);
	
	boolean payOrder(Order order,User user);
	
	boolean qrshOrder(Order order,Seller seller);
	
	Order selectByorderCode(Order order);
	
	Order selectByorderCodeAndstatus(Order order);
    
    List<Order> selectBysellerIdAndstatus(Order order);
    
    List<Order> selectByuserIdAndstatus(Order order);
    
    List<Orderitem> selectByorderId(Orderitem orderitem);
    
    Orderitem selectNUM(Orderitem orderitem);
    
    boolean updateByorderCodeSelective(Order order);
    
    boolean insertOrderexpressSelective(Orderexpress record);
    
    boolean updateByorderCodeSelective(Orderexpress orderexpress);
    
    boolean fhOrder(Order order,Orderexpress orderexpress);
    
    Orderexpress getOrderexpress(Orderexpress orderexpress);
    
    boolean wythOrder(Order order,Orderexpress orderexpress);
    
    boolean qrthOrder(Order order,User User);
    
    boolean insertEvaluateSelective(Evaluate record);
    
    List<Evaluate> selectEvaluateByproductId(Evaluate evaluateid);
}