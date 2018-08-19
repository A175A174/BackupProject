package com.musics.service;

import java.sql.SQLException;

import com.musics.dao.BaseDao;
import com.musics.dao.UserDaoImpl;
import com.musics.dto.UserDto;
import com.musics.util.Encryption;

/**
 * 登陆注册逻辑
 * @author Administrator
 *
 */
public class UserServiceImpl implements BaseService{
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public static boolean register(UserDto user) {
		try {
			BaseDao<UserDto> bd = new UserDaoImpl();
			user.setPass(Encryption.signature(user.getPass(), 0, null));
			return bd.update(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 登陆
	 * @param user
	 * @return
	 */
	public static UserDto login(UserDto user) {
		try {
			String pass = user.getPass();
			BaseDao<UserDto> bd = new UserDaoImpl();
			user = bd.select(user);
			if (user != null && user.getPass().equals(pass)) {
				return user;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改
	 * @param user
	 * @return
	 */
	public static boolean update(UserDto user) {
		try {
			UserDaoImpl bd = new UserDaoImpl();
			return bd.updateInfo(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
