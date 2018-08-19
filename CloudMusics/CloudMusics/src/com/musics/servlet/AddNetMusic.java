package com.musics.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musics.dto.MusicsDto;
import com.musics.dto.MyMusicsDto;
import com.musics.service.MusicsSreviceImpl;
import com.musics.service.MyMusicsServiceImpl;

@WebServlet("/addnetmusic")
public class AddNetMusic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddNetMusic() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String singer = request.getParameter("singer");
		String album = request.getParameter("album");
		String path = request.getParameter("path");
		String img = request.getParameter("img");
		MusicsDto musics = new MusicsDto();
		musics.setName(name);
		musics.setSinger(singer);
		musics.setAlbum(album);
		musics.setNet_Address(path);
		musics.setDescribe(img);
		musics.setLocal_Address("NET");
		System.out.println(musics.toString());
		int x = MusicsSreviceImpl.addMusic(musics);
		if(x != -1) {
			MyMusicsDto mm = new MyMusicsDto();
			mm.setMid(x);
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if("uid".equals(cookie.getName())) {
					mm.setUid(Integer.parseInt(cookie.getValue()));
					break;
				}
			}
			MyMusicsServiceImpl mmsi = new MyMusicsServiceImpl();
			mmsi.addMyMusics(mm);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
