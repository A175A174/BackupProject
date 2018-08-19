package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Orderitem;

public interface OrderitemMapper {
    int deleteByPrimaryKey(Integer orderitemid);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    Orderitem selectByPrimaryKey(Integer orderitemid);
    
    List<Orderitem> selectByorderId(String orderId);
    
    Orderitem selectByproductIdNum(Integer productId);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);
}