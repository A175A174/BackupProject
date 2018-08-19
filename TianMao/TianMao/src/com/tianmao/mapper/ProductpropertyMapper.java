package com.tianmao.mapper;

import com.tianmao.pojo.Productproperty;

public interface ProductpropertyMapper {
    int deleteByPrimaryKey(Integer productpropertyid);

    int insert(Productproperty record);

    int insertSelective(Productproperty record);

    Productproperty selectByPrimaryKey(Integer productpropertyid);

    int updateByPrimaryKeySelective(Productproperty record);

    int updateByPrimaryKey(Productproperty record);
}