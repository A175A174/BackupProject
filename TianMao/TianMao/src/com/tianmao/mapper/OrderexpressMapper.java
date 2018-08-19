package com.tianmao.mapper;

import com.tianmao.pojo.Orderexpress;

public interface OrderexpressMapper {
    int deleteByPrimaryKey(Integer expressid);

    int insert(Orderexpress record);

    int insertSelective(Orderexpress record);

    Orderexpress selectByPrimaryKey(Integer expressid);
    
    Orderexpress selectByorderCode(String expressid);

    int updateByPrimaryKeySelective(Orderexpress record);
    
    int updateByorderCodeSelective(Orderexpress record);

    int updateByPrimaryKey(Orderexpress record);
}