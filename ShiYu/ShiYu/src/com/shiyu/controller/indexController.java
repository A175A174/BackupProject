package com.shiyu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.shiyu.pojo.Order;
import com.shiyu.pojo.OrderGoods;
import com.shiyu.pojo.OrderList;
import com.shiyu.pojo.OrderLists;
import com.shiyu.pojo.Seller;
import com.shiyu.pojo.User;
import com.shiyu.service.BaseService;
import com.shiyu.service.SellerServiceImpl;
import com.shiyu.service.UserServiceImpl;

@Controller
public class indexController implements BaseService {
	
	@Autowired
	SellerServiceImpl sellerServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@RequestMapping("/xq")
	public void xq(HttpServletResponse response,Order order) {
		List<OrderGoods> list = sellerServiceImpl.getOrderGoods(order);
		try {
			PrintWriter pw = response.getWriter();
			pw.print(JSON.toJSON(list));
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/zf")
	public void zf(HttpServletRequest request,HttpServletResponse response,Order order){
		User user = new User();
		Seller seller = new Seller();
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if ("userid".equals(cookie.getName())) {
				user.setId(Integer.valueOf(cookie.getValue()));
			}
			if ("shopid".equals(cookie.getName())) {
				seller.setId(Integer.valueOf(cookie.getValue()));
			}
		}
		seller = sellerServiceImpl.getSellersById(seller);
		user = userServiceImpl.logbyid(user);
		order = userServiceImpl.getOrder(order);
		try {
			PrintWriter pw = response.getWriter();
			if (user.getBalance()>=order.getPrice()) {
				user.setBalance(user.getBalance()-order.getPrice());
				if (userServiceImpl.cz(user)) {
					order.setState(1);
					if(userServiceImpl.cz(order)) {
						seller.setBalance(seller.getBalance()+order.getPrice());
						if (sellerServiceImpl.cz(seller)) {
							pw.print(1);
						}else {
							pw.print(0);
						}
					}else {
						pw.print(0);
					}
				}else {
					pw.print(0);
				}
			}else {
				pw.print(0);
			}
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/cz")
	public void cz(HttpServletRequest request,HttpServletResponse response,String je){
		User user = new User();
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if ("userid".equals(cookie.getName())) {
				user.setId(Integer.valueOf(cookie.getValue()));
				break;
			}
		}
		user = userServiceImpl.logbyid(user);
		Double s = user.getBalance()+Double.valueOf(je);
		user.setBalance(s);
		try {
			PrintWriter pw = response.getWriter();
			if (userServiceImpl.cz(user)) {
				pw.print(1);
			}else {
				pw.print(0);
			}
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/myorder")
	public String myorder(HttpServletRequest request,Model model){
		User user = new User();
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if ("userid".equals(cookie.getName())) {
				user.setId(Integer.valueOf(cookie.getValue()));
				break;
			}
		}
		user = userServiceImpl.logbyid(user);
		model.addAttribute("AllOrder", JSON.toJSON(userServiceImpl.getOrders(user)));
		model.addAttribute("ye", user.getBalance());
		return "myorder";
	}
	
	@RequestMapping("/js")
	public void js(HttpServletRequest request,HttpServletResponse response,OrderLists ols,Order order) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if ("userid".equals(cookie.getName())) {
				order.setUserid(Integer.valueOf(cookie.getValue()));
				break;
			}
		}
		try {
			PrintWriter pw = response.getWriter();
			if (userServiceImpl.tj(order)) {
				int i = order.getId();
				for (OrderList o : ols.getOls()) {
					o.setOrderid(i);
					userServiceImpl.tj(o);
				}
				pw.println(1);
			}else {
				pw.println(0);
			}
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("index");
		List<Seller> sellers = sellerServiceImpl.getSellers();
		modelAndView.addObject("datas", sellers);
		modelAndView.addObject("name", "qweqwewq");
		return modelAndView;
	}
	
	@RequestMapping("/root")
	public ModelAndView root(String x) {
		ModelAndView modelAndView;
		if ("root".equals(x)) {
			modelAndView = new ModelAndView("WEB-INF/root");
			List<Seller> sellers = sellerServiceImpl.getAllSellers();
			for (Seller seller : sellers) {
				seller.setAddress("xxx");
			}
			modelAndView.addObject("AllDatas", JSON.toJSON(sellers));
		}else {			
			modelAndView = new ModelAndView("index");
		}
		return modelAndView;
		
	}
}
