package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Shippingaddress;

public interface ShippingaddressMapper {
    int deleteByPrimaryKey(Integer addressid);

    int insert(Shippingaddress record);

    int insertSelective(Shippingaddress record);

    Shippingaddress selectByPrimaryKey(Integer addressid);
    
    List<Shippingaddress> selectByuserID(String userID);

    int updateByPrimaryKeySelective(Shippingaddress record);

    int updateByPrimaryKey(Shippingaddress record);
}