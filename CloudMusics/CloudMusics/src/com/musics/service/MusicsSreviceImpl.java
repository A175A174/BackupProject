package com.musics.service;

import java.sql.SQLException;
import java.util.List;

import com.musics.dao.BaseDao;
import com.musics.dao.MusicsDaoImpl;
import com.musics.dto.MusicsDto;
import com.musics.dto.MyMusicsDto;
import com.musics.dto.UserDto;

public class MusicsSreviceImpl implements BaseService{
	
	public static List<MusicsDto> getMusics(UserDto user) {
		MyMusicsServiceImpl mmsi = new MyMusicsServiceImpl();
		MyMusicsDto mymusic = new MyMusicsDto();
		mymusic.setUid(user.getId());
		List<MyMusicsDto> list = mmsi.getMyMusicsId(mymusic);
		MusicsDto music = new MusicsDto();
		String id = "";
		for (MyMusicsDto myMusicsDto : list) {
			id += ","+myMusicsDto.getMid();
		}
		if(!"".equals(id)) {
			music.setName(id.substring(1,id.length()));
			BaseDao<MusicsDto> bd = new MusicsDaoImpl();
			try {
				return bd.selects(music);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static int addMusic(MusicsDto music) {
		try {
			MusicsDaoImpl bd = new MusicsDaoImpl();
			return bd.updatei(music);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
