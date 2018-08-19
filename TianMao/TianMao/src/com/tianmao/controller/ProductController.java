package com.tianmao.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tianmao.pojo.Category;
import com.tianmao.pojo.Categoryvalue;
import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Product;
import com.tianmao.pojo.Productdetails;
import com.tianmao.pojo.User;
import com.tianmao.service.IProductService;
import com.tianmao.service.IUserService;
import com.tianmao.util.Redis;
import com.tianmao.util.Ut;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private Redis redis;
	
	
	/**
	 * 获取商品评论
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getproducttl")
	public List<Evaluate> getproducttl(Evaluate evaluate){
		List<Evaluate> list = productService.getEvaluates(evaluate);
		User user = null;
		for (Evaluate e : list) {
			user = new User();
			user.setUsercode(e.getUserid());
			user = userService.getByuserCode(user);
			e.setUserid(user.getName());
		}
		return list;
	}
	
	/**
	 * 上传商品图片
	 */
	@PostMapping("/upimg")
	private void upimg(HttpServletResponse response,@RequestParam("icon") MultipartFile myicon) {
		PrintWriter pw = null;
		String name = myicon.getOriginalFilename();
		name = name.substring(name.lastIndexOf("."));
		name = UUID.randomUUID().toString() + name;
		name = name.replaceAll("-", "");
		try {
			myicon.transferTo(new File("D:/TMImg/"+name));
			pw = response.getWriter();
			Ut.back(pw, name);
		} catch (Exception e) {
			Ut.back(pw, "0");
			e.printStackTrace();
		}
	}
	/**
	 * 删除商品图片
	 */
	@RequestMapping("/delChaheImg")
	private void delChaheImg(String path) {
		path = path.replace("/img/", "");
		File file = new File("D:/TMImg/"+path);
		file.delete();
	}
	/**
	 * 获取商品图片
	 */
	@ResponseBody
	@RequestMapping("/getImg")
	private List<Productdetails> getImg(Productdetails productdetails) {
		return productService.getProductdetails(productdetails);
	}
	
	/**
	 * 商家获取他的所有商品
	 */
	@RequestMapping("/getProduct")
	private String getProduct(HttpServletRequest request,Model model) {
		try {
			Cookie[] cs = request.getCookies();
			Product product = null;
			for (Cookie c : cs) {
				if ("mux".equals(c.getName())) {
					String s = redis.getUUID(c.getValue());
					if ("".equals(s) || s == null) {
						return "";
					}
					product = new Product();
					product.setSellerid(s);
					model.addAttribute("datas", productService.getProducts(product));
				}
			}
			return "mys-product";
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 添加商品
	 */
	@RequestMapping("/addProduct")
	private void addProduct(HttpServletRequest request,HttpServletResponse response,Product product,String[] imgg,Categoryvalue categoryvalue) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			List<Productdetails> list = new ArrayList<Productdetails>();
			Productdetails productdetails;
			for (String string : imgg) {
				productdetails = new Productdetails();
				productdetails.setImage(string);
				productdetails.setType("1");
				list.add(productdetails);
			}
			product.setCreatedate(new Date());
			Cookie[] cs = request.getCookies();
			for (Cookie c : cs) {
				if ("mux".equals(c.getName())) {
					String s = redis.getUUID(c.getValue());
					if ("".equals(s) || s == null) {
						Ut.back(pw, "0");
						return;
					}
					product.setSellerid(s);
					product.setIsdel("0");
				}
			}
			list.get(0).setType("0");
			productService.addProduct(product,list,categoryvalue);
			Ut.back(pw, "1");
		} catch (Exception e) {
			Ut.back(pw, "0");
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新商品
	 */
	@RequestMapping("/upProduct")
	private void upProduct(HttpServletRequest request,HttpServletResponse response,Product product,String[] imgg,Categoryvalue categoryvalue) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			List<Productdetails> list = new ArrayList<Productdetails>();
			Productdetails productdetails;
			for (String string : imgg) {
				productdetails = new Productdetails();
				productdetails.setImage(string);
				productdetails.setType("1");
				productdetails.setProductid(product.getProductid());
				list.add(productdetails);
			}
			Cookie[] cs = request.getCookies();
			for (Cookie c : cs) {
				if ("mux".equals(c.getName())) {
					String s = redis.getUUID(c.getValue());
					if ("".equals(s) || s == null) {
						Ut.back(pw, "0");
						return;
					}
					product.setSellerid(s);
					product.setIsdel("0");
				}
			}
			list.get(0).setType("0");
			categoryvalue.setProductid(product.getProductid());
			productService.upProduct(product,list,categoryvalue);
			Ut.back(pw, "1");
		} catch (Exception e) {
			Ut.back(pw, "0");
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取商品所有分类
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCategorys")
	private List<Category> getCategorys() {
		return productService.getCategorys();
	}
	
	/**
	 * 获取商品分类
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getCategoryvalue")
	private Categoryvalue getCategoryvalue(Categoryvalue categoryvalue) {
		return productService.getCategoryvalue(categoryvalue);
	}
	
	/**
	 * 上下架删除
	 */
	@RequestMapping("/delProduct")
	public void delProduct(HttpServletResponse response,Product product) {
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
			Ut.back(pw, productService.upProduct(product)==true?"1":"0");
		} catch (Exception e) {
			Ut.back(pw, "0");
		}
	}
}
