package com.tianmao.mapper;

import com.tianmao.pojo.Sellercategory;

public interface SellercategoryMapper {
    int deleteByPrimaryKey(Integer sellercategoryid);

    int insert(Sellercategory record);

    int insertSelective(Sellercategory record);

    Sellercategory selectByPrimaryKey(Integer sellercategoryid);

    int updateByPrimaryKeySelective(Sellercategory record);

    int updateByPrimaryKey(Sellercategory record);
}