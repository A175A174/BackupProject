package com.shiyu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.shiyu.UtilTools.Encryption;
import com.shiyu.pojo.Goods;
import com.shiyu.pojo.Order;
import com.shiyu.pojo.Seller;
import com.shiyu.service.BaseService;
import com.shiyu.service.SellerServiceImpl;

@Controller
public class SellerController implements BaseService {
	
	@Autowired
	SellerServiceImpl sellerServiceImpl;
	
	@RequestMapping(value = "/sreg" , method = RequestMethod.POST)
	public void reg(HttpServletResponse response,@RequestParam("myicon") MultipartFile myicon,Seller seller) {
		String name = myicon.getOriginalFilename();
		name = name.substring(name.lastIndexOf("."));
		name = UUID.randomUUID().toString() + name;
		try {
			myicon.transferTo(new File("D:/icon/"+name));
			String pass = seller.getPassword().split(",")[0];
			seller.setPassword(Encryption.signature(pass, 0, "null"));
			seller.setIcon(name);
			PrintWriter pw = response.getWriter();
			if (sellerServiceImpl.reg(seller)) {
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
	
	@RequestMapping("/slog")
	public void log(Seller seller,HttpServletResponse response,HttpServletRequest request) {
		try {
			String pass = seller.getPassword().split(",")[0];
			pass = Encryption.signature(pass, 0, "null");
			seller = sellerServiceImpl.log(seller);
			PrintWriter pw = response.getWriter();
			if (pass.equals(seller.getPassword())) {
				Cookie cookie = new Cookie("shopname", seller.getUsername());
				cookie.setMaxAge(1000*60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("icon", seller.getIcon());
				cookie.setMaxAge(1000*60*60*24*7);
				response.addCookie(cookie);
				cookie = new Cookie("shopid", seller.getId().toString());
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
	
	@RequestMapping("/verify")
	public void verify(Seller seller,HttpServletResponse response) {
		try {
			PrintWriter pw = response.getWriter();
			if (sellerServiceImpl.verify(seller)) {
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
	
	@RequestMapping("/gverify")
	public void gverify(Goods goods,HttpServletResponse response) {
		try {
			PrintWriter pw = response.getWriter();
			if (sellerServiceImpl.gverify(goods)) {
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
	
	@RequestMapping("/myshop")
	public String myshop(HttpServletRequest request,Model model) {
		Cookie[] cookies = request.getCookies();
		Seller seller = new Seller();
		for (Cookie cookie : cookies) {
			if ("shopid".equals(cookie.getName())) {
				seller.setId(Integer.valueOf(cookie.getValue()));
				break;
			}
		}
		seller = sellerServiceImpl.getSellersById(seller);
		List<Goods> list = sellerServiceImpl.getAGoods(seller);
		model.addAttribute("AllGoods", JSON.toJSON(list));
		model.addAttribute("yes", seller.getBalance());
		return "sbody";
	}
	
	@RequestMapping("/smyorder")
	public String smyorder(HttpServletRequest request,HttpServletResponse response,Model model) {
		Cookie[] cookies = request.getCookies();
		Seller seller = new Seller();
		for (Cookie cookie : cookies) {
			if ("shopid".equals(cookie.getName())) {
				seller.setId(Integer.valueOf(cookie.getValue()));
				break;
			}
		}
		seller = sellerServiceImpl.getSellersById(seller);
		List<Order> list = sellerServiceImpl.getOrders(seller);
		model.addAttribute("AllOrders", JSON.toJSON(list));
		model.addAttribute("yes", seller.getBalance());
		return "smyorder";
	}
	
	@RequestMapping("/getshop")
	public String getshop(Seller seller,Model model) {
		List<Goods> list = sellerServiceImpl.getGoods(seller);
		seller = sellerServiceImpl.getSellersById(seller);
		model.addAttribute("seller", seller);
		model.addAttribute("AllGoods", JSON.toJSON(list));
		return "ubody";
	}
	
	@RequestMapping("/addGoods")
	public void addGoods(HttpServletRequest request,HttpServletResponse response,Goods goods,@RequestParam("myicon") MultipartFile myicon) {
		try {
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if ("shopid".equals(cookie.getName())) {
					goods.setSellerid(Integer.valueOf(cookie.getValue()));
					break;
				}
			}
			String name = myicon.getOriginalFilename();
			name = name.substring(name.lastIndexOf("."));
			name = UUID.randomUUID().toString() + name;
			myicon.transferTo(new File("D:/icon/"+name));
			goods.setIcon(name);
			PrintWriter pw = response.getWriter();
			if (sellerServiceImpl.addGoods(goods)) {
				pw.print("1");
			}else {
				pw.print("0");
			}
			pw.flush();
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
