package com.tianmao.mapper;

import com.tianmao.pojo.Categoryvalue;

public interface CategoryvalueMapper {
    int deleteByPrimaryKey(Integer categoryvalueid);

    int insert(Categoryvalue record);

    int insertSelective(Categoryvalue record);

    Categoryvalue selectByPrimaryKey(Integer categoryvalueid);
    
    Categoryvalue selectByproductId(Integer productId);

    int updateByPrimaryKeySelective(Categoryvalue record);
    
    int updateByproductIdSelective(Categoryvalue record);

    int updateByPrimaryKey(Categoryvalue record);
}