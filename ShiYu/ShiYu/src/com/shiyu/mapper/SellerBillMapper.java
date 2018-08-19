package com.shiyu.mapper;

import com.shiyu.pojo.SellerBill;

public interface SellerBillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SellerBill record);

    int insertSelective(SellerBill record);

    SellerBill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SellerBill record);

    int updateByPrimaryKey(SellerBill record);
}