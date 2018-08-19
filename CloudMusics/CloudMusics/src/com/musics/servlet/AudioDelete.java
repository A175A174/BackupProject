package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musics.dto.MyMusicsDto;
import com.musics.service.MyMusicsServiceImpl;

@WebServlet("/audiodelete")
public class AudioDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AudioDelete() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyMusicsServiceImpl mmsi = new MyMusicsServiceImpl();
		MyMusicsDto mmd = new MyMusicsDto();
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if("uid".equals(cookie.getName())) {
				mmd.setUid(Integer.parseInt(cookie.getValue()));
				break;
			}
		}
		mmd.setMid(Integer.parseInt(request.getParameter("mid")));
		PrintWriter pw = response.getWriter();
		if (mmsi.deleteMyMusics(mmd)) {
			pw.print(1);
		}else {
			pw.print(0);
		}
		pw.flush();
		pw.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
