package com.musics.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.musics.dto.UserDto;
import com.musics.util.DBUtil;
import com.musics.util.DBUtil.CallBack;

public class UserDaoImpl implements BaseDao<UserDto>{

	@Override
	public UserDto select(UserDto t) throws SQLException {
		String sql = "select u_id,u_name,u_pass,u_ishide,u_isvip,u_icon,u_age,u_sex,u_birth from user where u_name = ?";
		return DBUtil.select(sql,new CallBack<UserDto>() {
			@Override
			public UserDto getData(ResultSet res) throws SQLException {
				UserDto user = null;
				if (res.next()) {
					user = new UserDto(res.getString("u_name"),
							res.getString("u_pass"),
							res.getString("u_icon"),
							res.getInt("u_age"),
							res.getInt("u_sex"),
							res.getTimestamp("u_birth"));
					user.setId(res.getInt("u_id"));
					user.setHide(res.getInt("u_ishide"));
					user.setVip(res.getInt("u_isvip"));
				}
				return user;
			}
			@Override
			public List<UserDto> getDatas(ResultSet res) throws SQLException {return null;}
		}, t.getName());
	}

	@Override
	public boolean update(UserDto t) throws SQLException {
		String sql = "insert into user(u_name,u_pass,u_icon,u_age,u_sex,u_birth) values(?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		boolean boo = DBUtil.update(conn, sql, t.getName(),t.getPass(),t.getIcon(),t.getAge(),t.getSex(),t.getBirth());
		conn.close();
		return boo;
	}
	
	public boolean updateInfo(UserDto t) throws SQLException {
		String sql = "update user set u_pass = ?,u_icon = ? where u_name = ?";
		Connection conn = DBUtil.getConnection();
		boolean boo = DBUtil.update(conn, sql, t.getPass(),t.getIcon(),t.getName());
		conn.close();
		return boo;
	}

	@Override
	public List<UserDto> selects(UserDto t) throws SQLException {return null;}

}
