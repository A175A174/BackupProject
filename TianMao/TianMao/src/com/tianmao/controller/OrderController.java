package com.tianmao.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Freight;
import com.tianmao.pojo.Gwc;
import com.tianmao.pojo.Order;
import com.tianmao.pojo.Orderexpress;
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
public class OrderController {
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IProductService productService;
	
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private Redis redis;
	
	/**
	 * 购物车删除订单内容
	 */
	@ResponseBody
	@RequestMapping("/delorderItem")
	private String delorderItem(Product product,HttpServletResponse response,HttpServletRequest request) {
		try {
			String userid = null;
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if ("mux".equals(cookie.getName())) {
					userid = redis.getUUID(cookie.getValue());
					if (userid == null) {
						return "0";
					}
					break;
				}
			}
			Gwc gwc = redis.getgwc(userid);
			String xxx = gwc.delItem(product);
			redis.addgwc(userid, gwc);
			return xxx;
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	/**
	 * 购物车删除订单
	 */
	@ResponseBody
	@RequestMapping("/delorders")
	private String delorders(String name,HttpServletResponse response,HttpServletRequest request) {
		try {
			String userid = null;
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if ("mux".equals(cookie.getName())) {
					userid = redis.getUUID(cookie.getValue());
					if (userid == null) {
						return "0";
					}
					break;
				}
			}
			Gwc gwc = redis.getgwc(userid);
			gwc.del(name);
			redis.addgwc(userid, gwc);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	/**
	 * 购物车提交订单
	 */
	@ResponseBody
	@RequestMapping("/addorders")
	private String addorders(Order order,String[] nums,String[] pid,HttpServletResponse response,HttpServletRequest request) {
		String uuid = null;
		String userid = null;
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				userid = redis.getUUID(cookie.getValue());
				order.setUserid(userid);
				order.setCreatedate(new Date());
				order.setStatus("0");
				uuid = UUID.randomUUID().toString();
				order.setOrdercode(uuid);
				break;
			}
		}
		if(userid == null) {
			return "0";
		}
		List<Orderitem> list = new ArrayList<Orderitem>();
		Orderitem orderitem = null;
		for (int i = 0; i < nums.length; i++) {
			orderitem = new Orderitem();
			orderitem.setNumber(Integer.valueOf(nums[i]));
			orderitem.setOrderid(uuid);
			orderitem.setProductid(Integer.valueOf(pid[i]));
			list.add(orderitem);
		}
		if(orderService.insertOrderSelective(order, list)) {
			Gwc gwc = redis.getgwc(userid);
			gwc.del(order.getSellerid());
			redis.addgwc(userid, gwc);
			return "1";
		}else {
			return "0";
		}
	}
	
	
	/**
	 * 购物车显示商品
	 * @param pid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/showitem")
	public Map showitem(String[] pid) {
		Map<String, Object> map = new HashMap<>();
		List<Product> list = new ArrayList<Product>();
		List<Productdetails> lp = new ArrayList<Productdetails>();
		Product product = new Product();
		Productdetails productdetails = new Productdetails();
		for (String s : pid) {
			product.setProductid(Integer.valueOf(s));
			product = productService.getProduct(product);
			list.add(product);
			productdetails.setProductid(Integer.valueOf(s));
			productdetails = productService.getProductdetails(productdetails).get(0);
			lp.add(productdetails);
		}
		Freight freight = new Freight();
		freight.setSellerid(product.getSellerid());
		freight = userService.selectBysellerId(freight);
		map.put("freight", freight);
		map.put("p", list);
		map.put("pd", lp);
		return map;
	}
	
	/**
	 * 用户评价
	 * @param response
	 */
	@RequestMapping("/pjorder")
	private void pjorder(Order order,String[] pts,String[] pjlr,HttpServletResponse response,HttpServletRequest request) {
		PrintWriter pw = null;
		try {
			String mux = null;
			pw = response.getWriter();
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if ("mux".equals(cookie.getName())) {
					mux = redis.getUUID(cookie.getValue());
					break;
				}
			}
			for (int i = 0; i < pjlr.length; i++) {
				if( !"".equals(pjlr[i]) && pjlr[i] != null) {
					Evaluate evaluate = new Evaluate();
					evaluate.setUserid(mux);
					evaluate.setContention(pjlr[i]);
					evaluate.setCreatedate(new Date());
					evaluate.setProductid(Integer.valueOf(pts[i]));
					orderService.insertEvaluateSelective(evaluate);
				}
			}
			order.setStatus("4");
			Ut.back(pw, orderService.updateByorderCodeSelective(order)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 商户确认退货
	 * @param order
	 * @param response
	 */
	@RequestMapping("/qrth")
	private void qrth(Order order,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			order = orderService.selectByorderCode(order);
			order.setStatus("4");
			User user = new User();
			user.setUsercode(order.getUserid());
			user = userService.getByuserCode(user);
			user.setBalance(user.getBalance()+order.getTradeprice().doubleValue());
			Ut.back(pw, orderService.qrthOrder(order, user)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 用户退货
	 * @param order
	 * @param response
	 */
	@RequestMapping("/wyth")
	private void wyth(Order order,Orderexpress orderexpress,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			order = orderService.selectByorderCode(order);
			order.setStatus("3");
			Orderexpress o = orderService.getOrderexpress(orderexpress);
			o.setReturncode(orderexpress.getReturncode());
			o.setReturnname(orderexpress.getReturnname());
			Ut.back(pw, orderService.wythOrder(order, o)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 用户收货
	 * @param order
	 * @param response
	 */
	@RequestMapping("/qrsh")
	private void qrsh(Order order,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			order = orderService.selectByorderCode(order);
			order.setConfirmdate(new Date());
			order.setStatus("5");
			Seller seller = new Seller();
			seller.setSellercode(order.getSellerid());
			seller = userService.getBysellerCode(seller);
			seller.setBalance(seller.getBalance()+order.getTradeprice().doubleValue());
			Ut.back(pw, orderService.qrshOrder(order, seller)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 商户发货
	 */
	@RequestMapping("/fhx")
	private void fhx(Orderexpress orderexpress,Order order,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			if("".equals(orderexpress.getShipmentsname())) {
				orderexpress.setShipmentsname("退货");
				orderexpress.setShipmentscode("退货");
			}
			order.setStatus("2");
			Ut.back(pw, orderService.fhOrder(order, orderexpress)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	
	/**
	 * 支付订单
	 * @param order
	 * @param response
	 */
	@RequestMapping("/payorder")
	private void payorder(User user,Order order,HttpServletResponse response,HttpServletRequest request) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			Integer oldpaypass = user.getPaypass();
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if ("mux".equals(cookie.getName())) {
					String s = redis.getUUID(cookie.getValue());
					user.setUsercode(s);
					user = userService.getByuserCode(user);
					if (oldpaypass == user.getPaypass()) {
						order.setStatus("0");
						order = orderService.selectByorderCodeAndstatus(order);
						order.setPaydate(new Date());
						if (orderService.payOrder(order, user)){
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
			Ut.back(pw, "0");
		} catch (Exception e) {
			Ut.back(pw,"0");
		}
	}
	
	/**
	 * 删除订单
	 * @param order
	 * @param response
	 */
	@RequestMapping("/delorder")
	private void delorder(Order order,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			order.setIsdel("2");
			Ut.back(pw, orderService.updateByorderCodeSelective(order)?"1":"0");
		} catch (Exception e) {
			Ut.back(pw,"0");
		}
	}
	
	/**
	 * 获取订单内的商品，发货地址，物流
	 */
	@ResponseBody
	@RequestMapping("/getOrderitems")
	private Map getOrderitems(Orderitem orderitem){
		Map<String,Object> maps = new HashMap<>();
		List<Orderitem> ol = orderService.selectByorderId(orderitem);
		maps.put("o", ol);
		List<Product> pl = new ArrayList<Product>();
		List<Productdetails> pdl = new ArrayList<Productdetails>();
		Product p = null;
		Productdetails pd = null;
		for (Orderitem o : ol) {
			//获取商品信息
			p = new Product();
			p.setProductid(o.getProductid());
			pl.add(productService.getProduct(p));
			//获取商品图片信息
			pd = new Productdetails();
			pd.setProductid(o.getProductid());
			pdl.add(productService.getProductdetails(pd).get(0));
		}
		maps.put("p", pl);
		maps.put("pd", pdl);
		
		//获取发货地址
		Order order = new Order();
		order.setOrdercode(orderitem.getOrderid());
		order = orderService.selectByorderCode(order);
		Shippingaddress address = new Shippingaddress();
		address.setAddressid(order.getAddressid());
		address = userService.getAddressById(address);
		maps.put("add", address);
		
		Orderexpress orderexpress = new Orderexpress();
		orderexpress.setOrdercode(order.getOrdercode());
		orderexpress = orderService.getOrderexpress(orderexpress);
		maps.put("express", orderexpress);
		
		return maps;
	}
	
	/**
	 * 提交订单（单个商品）
	 */
	@RequestMapping("/addorder")
	private void addorder(Orderitem orderitem,Order order,HttpServletRequest request,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			Cookie[] cs = request.getCookies();
			for (Cookie cookie : cs) {
				if ("mux".equals(cookie.getName())) {
					String s = redis.getUUID(cookie.getValue());
					if("".equals(s) || s == null) {
						Ut.back(pw, "0");
						return;
					}
					order.setUserid(s);
					String uuid = UUID.randomUUID().toString().replaceAll("-","");
					order.setOrdercode(uuid);
					order.setCreatedate(new Date());
					order.setStatus("0");
					orderitem.setOrderid(uuid);
					List<Orderitem> list = new ArrayList<Orderitem>();
					list.add(orderitem);
					Ut.back(pw, orderService.insertOrderSelective(order, list)==true?"1":"0");
					return;
				}
			}
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
	
	/**
	 * 添加购物车
	 */
	@RequestMapping("/addgwc")
	private void addgwc(Product product,String num,HttpServletRequest request,HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (Exception e) {}
		Gwc gwc = null;
		product = productService.getProduct(product);
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				String s = redis.getUUID(cookie.getValue());
				gwc = redis.getgwc(s);
				if(gwc == null) {
					gwc = new Gwc();
					gwc.add(product, Integer.valueOf(num));
					redis.addgwc(s, gwc);
				}else {
					gwc.add(product, Integer.valueOf(num));
					redis.addgwc(s, gwc);
				}
				Ut.back(pw, "1");
				return;
			}
		}
		Ut.back(pw, "0");
	}
	
	/**
	 * 购物车
	 */
	@RequestMapping("/gwc")
	private ModelAndView gwc(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("order-gwc");
		Gwc gwc = null;
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				String s = redis.getUUID(cookie.getValue());
				if(s == null) {
					return mav;
				}
				Shippingaddress address = new Shippingaddress();
				address.setUserid(s);
				mav.addObject("add", userService.getAddress(address));
				gwc = redis.getgwc(s);
				if(gwc == null) {
					mav.addObject("datas", new Gwc());
				}else {
					mav.addObject("datas", gwc.getMap());
				}
			}
		}
		return mav;
	}
	
	/**
	 * 选择地址
	 */
	@RequestMapping("/selectAddress")
	private ModelAndView selectAddress(Orderitem orderitem,Product product,Productdetails productdetails,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("order-address");
		mav.addObject("datas",orderitem);
		mav.addObject("p",productService.getProductdetails(productdetails));
		mav.addObject("k",productService.getProduct(product));
		Cookie[] cs = request.getCookies();
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				Shippingaddress address = new Shippingaddress();
				String s = redis.getUUID(cookie.getValue());
				if("".equals(s) || s == null) {return mav;}
				address.setUserid(s);
				mav.addObject("add", userService.getAddress(address));
				product = productService.getProduct(product);
				Freight freight = new Freight();
				freight.setSellerid(product.getSellerid());
				freight = userService.selectBysellerId(freight);
				mav.addObject("addyf", freight);
				return mav;
			}
		}
		return mav;
	}
	
	/**
	 * 用户我的订单
	 * @return
	 */
	@RequestMapping("/myorder")
	private ModelAndView myorder(Order order,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("my-order");
		if ("0".equals(order.getStatus())) {
			mav.addObject("stat", "待支付");
		}else if ("1".equals(order.getStatus())) {
			mav.addObject("stat", "待发货");
		}else if ("2".equals(order.getStatus())) {
			mav.addObject("stat", "待收货");
		}else if ("3".equals(order.getStatus())) {
			mav.addObject("stat", "退货中");
		}else if ("4".equals(order.getStatus())) {
			mav.addObject("stat", "已完成");
		}else if ("5".equals(order.getStatus())) {
			mav.addObject("stat", "待评价");
		}
		Cookie[] cs = request.getCookies();
		boolean is = false;
		String uuid = null;
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				uuid = redis.getUUID(cookie.getValue());
				
			}else if("xs".equals(cookie.getName())){
				is = true;
			}
		}
		if(is) {
			order.setSellerid(uuid);
			mav.addObject("datas", orderService.selectBysellerIdAndstatus(order));
		}else {
			order.setUserid(uuid);;
			mav.addObject("datas", orderService.selectByuserIdAndstatus(order));
		}
		return mav;
	}
	
	/**
	 * 商家我的订单
	 * @return
	 */
	@RequestMapping("/mysorder")
	private ModelAndView mysorder(Order order,HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("mys-order");
		if ("0".equals(order.getStatus())) {
			mav.addObject("stat", "待支付");
		}else if ("1".equals(order.getStatus())) {
			mav.addObject("stat", "待发货");
		}else if ("2".equals(order.getStatus())) {
			mav.addObject("stat", "待收货");
		}else if ("3".equals(order.getStatus())) {
			mav.addObject("stat", "退货中");
		}else if ("4".equals(order.getStatus())) {
			mav.addObject("stat", "已完成");
		}else if ("5".equals(order.getStatus())) {
			mav.addObject("stat", "待评价");
		}
		Cookie[] cs = request.getCookies();
		boolean is = false;
		String uuid = null;
		for (Cookie cookie : cs) {
			if ("mux".equals(cookie.getName())) {
				uuid = redis.getUUID(cookie.getValue());
				
			}else if("xs".equals(cookie.getName())){
				is = true;
			}
		}
		if(is) {
			order.setSellerid(uuid);
			mav.addObject("datas", orderService.selectBysellerIdAndstatus(order));
		}else {
			order.setUserid(uuid);;
			mav.addObject("datas", orderService.selectByuserIdAndstatus(order));
		}
		return mav;
	}
}
