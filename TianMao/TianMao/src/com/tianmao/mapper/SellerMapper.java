package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Seller;

public interface SellerMapper {
    int deleteByPrimaryKey(Integer sellerid);

    int insert(Seller record);

    int insertSelective(Seller record);

    Seller selectByPrimaryKey(Integer sellerid);
    
    Seller selectByName(String name);
    
    Seller selectBysellerCode(String name);
    
    List<Seller> selectSellers();

    int updateByPrimaryKeySelective(Seller record);

    int updateByPrimaryKey(Seller record);
    
    int updateBysellerCodeSelective(Seller record);
}