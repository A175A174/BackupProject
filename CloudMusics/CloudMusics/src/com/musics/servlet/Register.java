package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.musics.dto.UserDto;
import com.musics.service.UserServiceImpl;

/**
 * 注册
 * @author Administrator
 *
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		UserDto user = new UserDto(name, pass, null, 0, 0, new Date());
		PrintWriter pw = response.getWriter();
		if (UserServiceImpl.register(user)) {
			pw.println(1);
		}else {
			pw.println(0);
		}
		pw.flush();
		pw.close();
	}
}
