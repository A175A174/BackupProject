package com.tianmao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tianmao.pojo.Category;
import com.tianmao.pojo.Categoryvalue;
import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Product;
import com.tianmao.pojo.Productdetails;

@Service
public interface IProductService {
	Product addProduct(Product product,List<Productdetails> productdetails,Categoryvalue categoryvalue);
	boolean addProductdetails(List<Productdetails> productdetails);
	boolean addCategoryvalue(Categoryvalue categoryvalue);
	
	List<Evaluate> getEvaluates(Evaluate evaluate);
	List<Product> serachshopProduct(Product product);
	List<Product> serachProduct(Product product);
	List<Product> getProductsBycategory(Product product);
	Categoryvalue getCategoryvalue(Categoryvalue categoryvalue);
	Product getProduct(Product product);
	List<Product> getProducts(Product product);
	List<Category> getCategorys();
	List<Productdetails> getProductdetails(Productdetails productdetails);
	
	boolean upProduct(Product product,List<Productdetails> productdetails,Categoryvalue categoryvalue);
	boolean upProduct(Product product);
	
	boolean delProduct();
	boolean delProductdetails(Productdetails productdetails);
}
