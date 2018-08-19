package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Productdetails;

public interface ProductdetailsMapper {
    int deleteByPrimaryKey(Integer productdetailsid);
    
    int deleteByproductId(Integer productId);

    int insert(Productdetails record);

    int insertSelective(Productdetails record);

    Productdetails selectByPrimaryKey(Integer productdetailsid);
    
    List<Productdetails> selectByproductId(Integer productId);

    int updateByPrimaryKeySelective(Productdetails record);

    int updateByPrimaryKey(Productdetails record);
}