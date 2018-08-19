package com.tianmao.mapper;

import com.tianmao.pojo.Sellercategoryvalue;

public interface SellercategoryvalueMapper {
    int deleteByPrimaryKey(Integer sellercategoryvalueid);

    int insert(Sellercategoryvalue record);

    int insertSelective(Sellercategoryvalue record);

    Sellercategoryvalue selectByPrimaryKey(Integer sellercategoryvalueid);

    int updateByPrimaryKeySelective(Sellercategoryvalue record);

    int updateByPrimaryKey(Sellercategoryvalue record);
}