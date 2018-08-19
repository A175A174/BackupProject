package com.musics.service;

import java.sql.SQLException;
import java.util.List;

import com.musics.dao.BaseDao;
import com.musics.dao.MyMusicsDaoImpl;
import com.musics.dto.MyMusicsDto;

public class MyMusicsServiceImpl implements BaseService{
	
	public List<MyMusicsDto> getMyMusicsId(MyMusicsDto t) {
		try {
			BaseDao<MyMusicsDto> bd = new MyMusicsDaoImpl();
			return bd.selects(t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean addMyMusics(MyMusicsDto t) {
		try {
			BaseDao<MyMusicsDto> bd = new MyMusicsDaoImpl();
			return bd.update(t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteMyMusics(MyMusicsDto t) {
		try {
			MyMusicsDaoImpl bd = new MyMusicsDaoImpl();
			return bd.delete(t);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
