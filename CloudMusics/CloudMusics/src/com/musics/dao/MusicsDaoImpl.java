package com.musics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.musics.dto.MusicsDto;
import com.musics.util.DBUtil;
import com.musics.util.DBUtil.CallBack;

public class MusicsDaoImpl implements BaseDao<MusicsDto>{

	@Override
	public MusicsDto select(MusicsDto t) throws SQLException {
		return null;
	}

	@Override
	public List<MusicsDto> selects(MusicsDto t) throws SQLException {
		String sql = "select m_id,m_name,m_singer,m_album,m_category,m_describe,m_ishide,m_net_Address,m_local_Address from musics where m_id in ("+t.getName()+")";
		return DBUtil.selects(sql, new CallBack<MusicsDto>() {
			@Override
			public MusicsDto getData(ResultSet res) throws SQLException {return null;}
			@Override
			public List<MusicsDto> getDatas(ResultSet res) throws SQLException {
				List<MusicsDto> list = new ArrayList<MusicsDto>();
				MusicsDto music = null;
				while(res.next()) {
					music = new MusicsDto(res.getInt("m_id"),
										res.getString("m_name"),
										res.getString("m_singer"),
										res.getString("m_album"),
										res.getInt("m_category"),
										res.getString("m_describe"),
										res.getInt("m_ishide"),
										res.getString("m_net_Address"),
										res.getString("m_local_Address"));
					list.add(music);
				}
				return list;
			}
		});
	}

	public int updatei(MusicsDto t) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into musics values(null,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, t.getName());
		ps.setString(2, t.getSinger());
		ps.setString(3, t.getSinger());
		ps.setInt(4, t.getCategory());
		ps.setString(5, t.getDescribe());
		ps.setInt(6, t.getHide());
		ps.setString(7, t.getNet_Address());
		ps.setString(8, t.getLocal_Address());
		ps.executeUpdate();
		ResultSet res = ps.getGeneratedKeys();
		int x = -1;
		if(res.next()) {
			x = res.getInt(1);
		}
		res.close();
		ps.close();
		conn.close();
		return x;
	}

	@Override
	public boolean update(MusicsDto t) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
}
