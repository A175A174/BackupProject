package com.shiyu.mapper;

import java.util.List;

import com.shiyu.pojo.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);
    
    List<Order> selectByPrimaryUserId(Integer id);
    
    List<Order> selectByPrimarySellerId(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}