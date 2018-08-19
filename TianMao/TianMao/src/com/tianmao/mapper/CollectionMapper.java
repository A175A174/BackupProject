package com.tianmao.mapper;

import com.tianmao.pojo.Collection;

public interface CollectionMapper {
    int deleteByPrimaryKey(Integer collectionid);

    int insert(Collection record);

    int insertSelective(Collection record);

    Collection selectByPrimaryKey(Integer collectionid);

    int updateByPrimaryKeySelective(Collection record);

    int updateByPrimaryKey(Collection record);
}