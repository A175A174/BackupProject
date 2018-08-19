package com.tianmao.aop;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.tianmao.util.Redis;

public class Uhi implements HandlerInterceptor{
	
	@Autowired
	private Redis redis;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Cookie[] cs = request.getCookies();
		for (Cookie c : cs) {
			if("mux".equals(c.getName())) {
				String s = redis.getUUID(c.getValue());
				String v = redis.getUUID(s+"s");
				if(!c.getValue().equals(v)) {
					System.out.println(c.getValue());
					System.out.println(v);
					System.out.println("三方登陆");
					for (Cookie cookie : cs) {
						if("mux".equals(cookie.getName())) {
							cookie.setMaxAge(0);
							cookie.setValue(null);
							response.addCookie(cookie);
						}else if("tmname".equals(cookie.getName())){
							cookie.setMaxAge(0);
							cookie.setValue(null);
							response.addCookie(cookie);
						}else if("xs".equals(cookie.getName())) {
							cookie.setMaxAge(0);
							cookie.setValue(null);
							response.addCookie(cookie);
						}
					}
				}
				break;
			}
		}
		return true;
	}
}
