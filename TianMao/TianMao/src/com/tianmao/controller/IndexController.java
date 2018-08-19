package com.tianmao.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tianmao.pojo.Freight;
import com.tianmao.pojo.MavData;
import com.tianmao.pojo.Orderitem;
import com.tianmao.pojo.Product;
import com.tianmao.pojo.Productdetails;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.Shippingaddress;
import com.tianmao.pojo.User;
import com.tianmao.service.IOrderService;
import com.tianmao.service.IProductService;
import com.tianmao.service.IUserService;
import com.tianmao.util.Redis;
import com.tianmao.util.Ut;

@Controller
public class IndexController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private Redis redis;
	
	/**
	 * 商家列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/root")
	private List<Seller> root() {
		return userService.selectSellers();
	}
	
	/**
	 * 天猫首页(redis缓存每小时刷新)
	 * @return
	 */
	@RequestMapping("/index")
	private ModelAndView index() {
		ModelAndView mav = new ModelAndView("body");
		MavData data = redis.getMavData();
		if(data != null) {
			for (Map.Entry<String, List<Product>> m : data.getMapp().entrySet()) {
				mav.addObject(m.getKey(), m.getValue());
			}
			for (Map.Entry<String, List<List<Productdetails>>> m : data.getMapd().entrySet()) {
				mav.addObject(m.getKey(), m.getValue());
			}
			return mav;
		}
		data = new MavData();
		Product p = new Product();
		List<Product> list = null;
		List<List<Productdetails>> listp = null;
		for (int i = 1; i < 6; i++) {
			p.setProductid(i);
			list = productService.getProductsBycategory(p);
			mav.addObject("k"+i, list);
			listp = new ArrayList<>();
			Productdetails productdetails;
			for (Product product : list) {
				productdetails = new Productdetails();
				productdetails.setProductid(product.getProductid());
				listp.add(productService.getProductdetails(productdetails));
			}
			mav.addObject("kp"+i, listp);
			
			data.getMapp().put("k"+i, list);
			data.getMapd().put("kp"+i, listp);
		}
		redis.addMavData(data);
		return mav;
	}
	
	/**
	 * 商家店铺首页
	 * @return
	 */
	@RequestMapping("/myshop")
	private ModelAndView myshop(Product product) {
		ModelAndView mav = new ModelAndView("myshop");
		List<Product> list = productService.getProducts(product);
		Seller seller = new Seller();
		seller.setSellercode(product.getSellerid());
		seller = userService.getBysellerCode(seller);
		Productdetails productdetails = new Productdetails();
		for (Product p : list) {
			productdetails.setProductid(p.getProductid());
			productdetails = productService.getProductdetails(productdetails).get(0);
			p.setIntroduce(productdetails.getImage());
		}
		mav.addObject("u",seller);
		mav.addObject("datas",list);
		return mav;
	}
	
	/**
	 * 用户获取商品页
	 * @param product
	 * @param productdetails
	 * @return
	 */
	@RequestMapping("/product")
	private ModelAndView product(Product product,Productdetails productdetails) {
		ModelAndView mav = new ModelAndView("product");
		product = productService.getProduct(product);
		List<Productdetails> list = productService.getProductdetails(productdetails);
		Seller seller = new Seller();
		seller.setSellercode(product.getSellerid());
		seller = userService.getBysellerCode(seller);
		mav.addObject("k", product);
		mav.addObject("kp", list);
		mav.addObject("u", seller);
		Freight freight = new Freight();
		freight.setSellerid(product.getSellerid());
		freight = userService.selectBysellerId(freight);
		mav.addObject("addyf", freight);
		return mav;
	}
	
	/**
	 * 店内搜索
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/searchbyshop")
	private List<Product> searchbyshop(Product product) {
		List<Product> list = productService.serachshopProduct(product);
		Productdetails productdetails = null;
		Orderitem orderitem = null;
		for (Product p : list) {
			productdetails = new Productdetails();
			productdetails.setProductid(p.getProductid());
			productdetails = productService.getProductdetails(productdetails).get(0);
			p.setIntroduce(productdetails.getImage());
			orderitem = new Orderitem();
			orderitem.setProductid(p.getProductid());
			orderitem = orderService.selectNUM(orderitem);
			if(orderitem==null) {
				p.setOriginalprice(BigDecimal.valueOf(Double.valueOf(String.valueOf("0"))));
			}else {
				p.setOriginalprice(BigDecimal.valueOf(Double.valueOf(String.valueOf(orderitem.getNumber()))));
			}
		}
		return list;
	}
	
	/**
	 * 搜索页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/search")
	private List<Product> search(Product product) {
		List<Product> list = productService.serachProduct(product);
		Productdetails productdetails = null;
		Orderitem orderitem = null;
		for (Product p : list) {
			productdetails = new Productdetails();
			productdetails.setProductid(p.getProductid());
			productdetails = productService.getProductdetails(productdetails).get(0);
			p.setIntroduce(productdetails.getImage());
			orderitem = new Orderitem();
			orderitem.setProductid(p.getProductid());
			orderitem = orderService.selectNUM(orderitem);
			if(orderitem==null) {
				p.setOriginalprice(BigDecimal.valueOf(Double.valueOf(String.valueOf("0"))));
			}else {
				p.setOriginalprice(BigDecimal.valueOf(Double.valueOf(String.valueOf(orderitem.getNumber()))));
			}
			
		}
		return list;
	}
	
	/**
	 * 添加余额
	 * @param request
	 * @param response
	 * @param user
	 */
	@RequestMapping("/addye")
	private void addye(HttpServletRequest request,HttpServletResponse response,User user) {
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
					user.setUsercode(s);
					Ut.back(pw, userService.upByuserCode(user)==true?"1":"0");
					return;
				}
			}
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	/**
	 * 获取余额
	 * @param request
	 * @param response
	 * @param user
	 */
	@RequestMapping("/getye")
	private void getye(HttpServletRequest request,HttpServletResponse response,User user) {
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
					user.setUsercode(s);
					Ut.back(pw, userService.getByuserCode(user).getBalance().toString());
				}
			}
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 删除地址
	 */
	@RequestMapping("/deladdress")
	private void deladdress(HttpServletResponse response,Shippingaddress shippingaddress) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			shippingaddress.setIsdel("1");
			Ut.back(pw, userService.delAddress(shippingaddress)==true?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 添加地址
	 */
	@RequestMapping("/addaddress")
	private void addaddress(HttpServletRequest request,HttpServletResponse response,Shippingaddress shippingaddress) {
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
					shippingaddress.setUserid(s);
					Ut.back(pw, userService.addAddress(shippingaddress)==true?"1":"0");
					return;
				}
			}
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 获取用户所有地址
	 */
	@RequestMapping("/getaddress")
	private ModelAndView getaddress(HttpServletRequest request,Model model,Shippingaddress shippingaddress) {
		ModelAndView mav = new ModelAndView("my-address");
		Cookie[] cs = request.getCookies();
		for (Cookie c : cs) {
			if ("mux".equals(c.getName())) {
				String s = redis.getUUID(c.getValue());
				if ("".equals(s) || s == null) {return mav;}
				shippingaddress.setUserid(s);
				List<Shippingaddress> list = userService.getAddress(shippingaddress);
				mav.addObject("adress", list);
				return mav;
			}
		}
		return mav;
	}
}
