package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer productid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productid);
    
    List<Product> selectBysellerId(String sellerId);
    
    List<Product> selectByname(String name);
    
    List<Product> selectshopByname(Product record);
    
    List<Product> selectBycategoryId(Integer categoryId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}