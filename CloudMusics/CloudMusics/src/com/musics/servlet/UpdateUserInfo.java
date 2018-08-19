package com.musics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.musics.dto.UserDto;
import com.musics.service.UserServiceImpl;
import com.musics.util.Encryption;

@WebServlet("/updateuserinfo")
@MultipartConfig(
		//设置单个文件的最大值
		maxFileSize=1024*1024*1000
		)
public class UpdateUserInfo extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public UpdateUserInfo() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("myname");
		String pass = request.getParameter("mynewpasswordr");
		pass = Encryption.signature(pass, 0, null);
		UserDto user = new UserDto();
		user.setName(name);
		user.setPass(pass);
		PrintWriter pw = response.getWriter();
		if (UserServiceImpl.login(user) != null) {
			Part part = request.getPart("myicon");
			String iconname = part.getSubmittedFileName();
			iconname = UUID.randomUUID().toString() + iconname.substring(iconname.lastIndexOf("."));
			part.write("D:\\MusicFile\\icon\\"+iconname);
			user.setIcon(iconname);
			if (UserServiceImpl.update(user)) {
				pw.print(iconname);
				pw.flush();
				pw.close();
				return;
			}
		}
		pw.print(0);
		pw.flush();
		pw.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
