package com.shiyu.mapper;

import java.util.List;

import com.shiyu.pojo.Seller;

public interface SellerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Seller record);

    int insertSelective(Seller record);

    Seller selectByPrimaryKey(Integer id);
    
    List<Seller> selectList();
    
    List<Seller> selectAllList();
    
    Seller selectByPrimaryUserName(String username);

    int updateByPrimaryKeySelective(Seller record);

    int updateByPrimaryKey(Seller record);
}