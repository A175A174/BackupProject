package com.shiyu.mapper;

import java.util.List;

import com.shiyu.pojo.OrderGoods;
import com.shiyu.pojo.OrderList;

public interface OrderListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderList record);

    int insertSelective(OrderList record);

    OrderList selectByPrimaryKey(Integer id);
    
    List<OrderGoods> selectByOrderId(Integer id);

    int updateByPrimaryKeySelective(OrderList record);

    int updateByPrimaryKey(OrderList record);
}