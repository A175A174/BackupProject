package com.tianmao.mapper;

import com.tianmao.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);
    
    User selectByName(String name);
    
    User selectByuserCode(String userCode);

    int updateByPrimaryKeySelective(User record);
    
    int updateByuserCodeSelective(User record);

    int updateByPrimaryKey(User record);
}