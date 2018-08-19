package com.shiyu.mapper;

import com.shiyu.pojo.UserBill;

public interface UserBillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserBill record);

    int insertSelective(UserBill record);

    UserBill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserBill record);

    int updateByPrimaryKey(UserBill record);
}