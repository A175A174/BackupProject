package com.shiyu.controller;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shiyu.UtilTools.Encryption;
import com.shiyu.pojo.User;
import com.shiyu.service.BaseService;
import com.shiyu.service.UserServiceImpl;

@Controller
public class UserController implements BaseService {
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping("/reg")
	public void reg(User user,HttpServletResponse response) {
		try {
			String pass = user.getPassword().split(",")[0];
			user.setPassword(Encryption.signature(pass, 0, "null"));
			PrintWriter pw = response.getWriter();
			if (userServiceImpl.reg(user)) {
				pw.print("1");
			}else {
				pw.print("0");
			}
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/log")
	public void log(User user,HttpServletResponse response) {
		try {
			String pass = user.getPassword().split(",")[0];
			pass = Encryption.signature(pass, 0, "null");
			user = userServiceImpl.log(user);
			PrintWriter pw = response.getWriter();
			if (user != null && pass.equals(user.getPassword())) {
				Cookie cookie = new Cookie("username", user.getUsername());
				cookie.setMaxAge(1000*60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("userid", user.getId().toString());
				cookie.setMaxAge(1000*60*60*24*7);
				response.addCookie(cookie);
				pw.print("1");
			}else {
				pw.print("0");
			}
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
