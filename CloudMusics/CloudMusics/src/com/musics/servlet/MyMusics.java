package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.musics.dto.MusicsDto;
import com.musics.dto.UserDto;
import com.musics.service.MusicsSreviceImpl;

@WebServlet("/mymusics")
public class MyMusics extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyMusics() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDto user = new UserDto();
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if("uid".equals(cookie.getName())) {
				user.setId(Integer.parseInt(cookie.getValue()));
				break;
			}
		}
		PrintWriter pw = response.getWriter();
		List<MusicsDto> list = MusicsSreviceImpl.getMusics(user);
		if(list != null) {
			String json = JSON.toJSONString(list);
			pw.print(json);
			//System.out.println(json);
		}else {
			pw.print(0);
		}
		pw.flush();
		pw.close();
	}

}
