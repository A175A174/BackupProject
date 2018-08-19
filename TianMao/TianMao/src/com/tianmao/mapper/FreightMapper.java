package com.tianmao.mapper;

import com.tianmao.pojo.Freight;

public interface FreightMapper {
    int deleteByPrimaryKey(Integer freightid);

    int insert(Freight record);

    int insertSelective(Freight record);

    Freight selectByPrimaryKey(Integer freightid);
    
    Freight selectBysellerId(String sellerId);

    int updateBysellerIdSelective(Freight record);
    
    int updateByPrimaryKeySelective(Freight record);

    int updateByPrimaryKey(Freight record);
}