package com.tianmao.mapper;

import java.util.List;

import com.tianmao.pojo.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evaluateid);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evaluateid);
    
    List<Evaluate> selectByproductId(Integer evaluateid);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);
}