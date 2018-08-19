package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.musics.dto.UserDto;
import com.musics.service.UserServiceImpl;
import com.musics.util.Encryption;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Login() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		pass = Encryption.signature(pass, 0, null);
		String checkbox = request.getParameter("checkbox");
		UserDto user = new UserDto(name, pass, null, 0, 0, new Date());
		PrintWriter pw = response.getWriter();
		user = UserServiceImpl.login(user);
		if (user != null) {
			if("1".equals(checkbox)) {
				Cookie cookie = new Cookie("uid", String.valueOf(user.getId()));
				cookie.setMaxAge(60*60*27*7);
				response.addCookie(cookie);
				cookie = new Cookie("uname", user.getName());
				cookie.setMaxAge(60*60*27*7);
				response.addCookie(cookie);
				if (user.getIcon() != null) {
					cookie = new Cookie("uicon", user.getIcon());
					cookie.setMaxAge(60*60*27*7);
					response.addCookie(cookie);
				}
				cookie = new Cookie("upass", user.getPass());
				cookie.setMaxAge(60*60*27*7);
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("uid", String.valueOf(user.getId()));
				response.addCookie(cookie);
				cookie = new Cookie("uname", user.getName());
				response.addCookie(cookie);
				if (user.getIcon() != null) {
					cookie = new Cookie("uicon", user.getIcon());
					response.addCookie(cookie);
				}
				cookie = new Cookie("upass", user.getPass());
				response.addCookie(cookie);
			}
			pw.println(JSON.toJSONString(user));
		}else {
			pw.println(0);
		}
		pw.flush();
		pw.close();
		//System.out.println(name);
		//System.out.println(pass);
		//System.out.println(checkbox);
		//System.out.println(JSON.toJSONString(user));
	}

}
