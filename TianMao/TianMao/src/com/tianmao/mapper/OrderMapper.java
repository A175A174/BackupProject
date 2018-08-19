package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderid);
    
    Order selectByorderCode(Order record);
    
    Order selectByorderCodeAndstatus(Order record);
    
    List<Order> selectBysellerIdAndstatus(Order record);
    
    List<Order> selectByuserIdAndstatus(Order record);
    
    int updateByorderCodeSelective(Order record);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}