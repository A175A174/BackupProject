package com.shiyu.mapper;

import java.util.List;

import com.shiyu.pojo.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    List<Goods> selectByPrimarySellerId(Integer id);
    
    List<Goods> selectByPrimaryASellerId(Integer id);
    
    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
}