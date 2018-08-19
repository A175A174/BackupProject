package com.tianmao.controller;

import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tianmao.pojo.Freight;
import com.tianmao.pojo.Gwc;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.User;
import com.tianmao.service.IUserService;
import com.tianmao.util.Encryption;
import com.tianmao.util.Redis;
import com.tianmao.util.Ut;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private Redis redis;
	
	/**
	 * 审核商家
	 * @param seller
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/shseller")
	public String shseller(Seller seller) {
		return userService.upBysellerCode(seller)?"1":"0";
	}
	
	@RequestMapping("/reg")
	public void reg(User user,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			user.setPassword(Encryption.signature(user.getPassword(), 0, "xxx"));
			user.setUsercode(UUID.randomUUID().toString());
			if(userService.reg(user)) {
				Gwc gwc = new Gwc();
				redis.addgwc(user.getUsercode(), gwc);
				Ut.back(pw, "1");				
			}else {
				Ut.back(pw, "0");
			}
		} catch (Exception e) {e.printStackTrace();Ut.back(pw, "0");}
	}
	@RequestMapping("/regs")
	public void reg(Seller seller,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			seller.setPassword(Encryption.signature(seller.getPassword(), 0, "xxx"));
			seller.setSellercode(UUID.randomUUID().toString());
			Ut.back(pw, userService.reg(seller)?"1":"0");
		} catch (Exception e) {e.printStackTrace();Ut.back(pw, "0");}
	}
	
	@RequestMapping("/log")
	public void log(User user,HttpServletResponse response) {
		PrintWriter pw = null;
		String pass = Encryption.signature(user.getPassword(), 0, "xxx");
		try {
			pw = response.getWriter();
			user = userService.log(user);
			if (user != null && pass.equals(user.getPassword())) {
				String uuid = UUID.randomUUID().toString();
				Cookie cookie = new Cookie("mux", uuid);
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("tmname", user.getName());
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				redis.addUUID(uuid, user.getUsercode());
				Ut.back(pw,"1");
			}else {
				Ut.back(pw,"0");
			}
		} catch (Exception e) {
			Ut.back(pw,"0");
			e.printStackTrace();
		}
	}
	@RequestMapping("/logs")
	public void log(Seller seller,HttpServletResponse response) {
		PrintWriter pw = null;
		String pass = Encryption.signature(seller.getPassword(), 0, "xxx");
		try {
			pw = response.getWriter();
			seller = userService.log(seller);
			if (seller != null && pass.equals(seller.getPassword())) {
				String uuid = UUID.randomUUID().toString();
				Cookie cookie = new Cookie("mux", uuid);
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("tmname", seller.getName());
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("xs", seller.getName());
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				redis.addUUID(uuid, seller.getSellercode());
				Ut.back(pw,"1");
			}else {
				Ut.back(pw,"0");
			}
		} catch (Exception e) {
			Ut.back(pw,"0");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/et")
	public void exit(String mux) {
		redis.delUUID(mux);
	}
	
	/**
	 * 获取当前登陆商户信息(公告，横幅，运费)
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/gts")
	public Seller gt(HttpServletRequest request) {
		Seller seller = new Seller();
		Cookie[] cs = request.getCookies();
		for (Cookie c : cs) {
			if ("mux".equals(c.getName())) {
				String s = redis.getUUID(c.getValue());
				if ("".equals(s) || s == null) {
					return null;
				}
				seller.setSellercode(s);
				seller = userService.getBysellerCode(seller);
				Freight freight = new Freight();
				freight.setSellerid(seller.getSellercode());
				freight = userService.selectBysellerId(freight);
				seller.setPassword(null);
				seller.setIsdel(null);
				seller.setName(freight.getCost().toString());
				return seller;
			}
		}
		return null;
	}
	
	/**
	 * 更新商户公告和横幅，运费
	 * @param seller
	 * @param response
	 * @param request
	 */
	@RequestMapping("/ups")
	public void up(Seller seller,Freight freight,HttpServletResponse response,HttpServletRequest request) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			Cookie[] cs = request.getCookies();
			for (Cookie c : cs) {
				if ("mux".equals(c.getName())) {
					String s = redis.getUUID(c.getValue());
					if ("".equals(s) || s == null) {
						Ut.back(pw, "0");
						return;
					}
					seller.setSellercode(s);
					seller.setBanner(seller.getBanner().replace("/img/", ""));
					freight.setSellerid(s);
					userService.updateBysellerIdSelective(freight);
					Ut.back(pw,userService.upBysellerCode(seller)==true?"1":"0");
					return;
				}
			}
		} catch (Exception e) {
			Ut.back(pw,"0");
		}
	}
	
	/**
	 * 更新用户支付密码
	 * @param seller
	 * @param response
	 * @param request
	 */
	@RequestMapping("/upuserpasss")
	public void upuserpasss(String oldpay,String newpay,HttpServletResponse response,HttpServletRequest request) {
		PrintWriter pw = null;
		User user = new User();
		try {
			pw = response.getWriter();
			user.setPaypass(Integer.valueOf(oldpay));
			Cookie[] cs = request.getCookies();
			for (Cookie c : cs) {
				if ("mux".equals(c.getName())) {
					String s = redis.getUUID(c.getValue());
					if ("".equals(s) || s == null) {
						Ut.back(pw, "0");
						return;
					}
					Integer old = user.getPaypass();
					user.setUsercode(s);
					user = userService.getByuserCode(user);
					if(user != null && old.equals(user.getPaypass())) {
						user.setPaypass(Integer.valueOf(newpay));
						if(userService.upByuserCode(user)) {
							Ut.back(pw, "1");
						}else {
							Ut.back(pw, "0");
						}
					}else {
						Ut.back(pw, "0");
					}
					return;
				}
			}
		} catch (Exception e) {
			Ut.back(pw,"0");
		}
	}
}
