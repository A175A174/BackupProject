package com.musics.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.musics.dto.MyMusicsDto;
import com.musics.util.DBUtil;
import com.musics.util.DBUtil.CallBack;

public class MyMusicsDaoImpl implements BaseDao<MyMusicsDto>{

	@Override
	public MyMusicsDto select(MyMusicsDto t) throws SQLException {
		return null;
	}

	@Override
	public List<MyMusicsDto> selects(MyMusicsDto t) throws SQLException {
		String sql = "select mm_id,mm_mid,mm_ishide from mymusics where mm_uid = ?";
		return DBUtil.selects(sql, new CallBack<MyMusicsDto>() {

			@Override
			public MyMusicsDto getData(ResultSet res) throws SQLException {return null;}

			@Override
			public List<MyMusicsDto> getDatas(ResultSet res) throws SQLException {
				List<MyMusicsDto> list = new ArrayList<MyMusicsDto>();
				MyMusicsDto myMusics = null;
				while (res.next()) {
					myMusics = new MyMusicsDto(res.getInt("mm_id"),
												t.getUid(),
												res.getInt("mm_mid"),
												res.getInt("mm_ishide"));
					list.add(myMusics);
				}
				return list;
			}
		}, t.getUid());
	}

	@Override
	public boolean update(MyMusicsDto t) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into mymusics values(null,?,?,0)";
		boolean boo = DBUtil.update(conn, sql, t.getUid(),t.getMid());
		conn.close();
		return boo;
	}
	
	public boolean delete(MyMusicsDto t) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from mymusics where  mm_uid=? and mm_mid=?";
		boolean boo = DBUtil.update(conn, sql, t.getUid(),t.getMid());
		conn.close();
		return boo;
	}
}
