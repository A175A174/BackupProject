package com.tianmao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tianmao.mapper.CategoryMapper;
import com.tianmao.mapper.CategoryvalueMapper;
import com.tianmao.mapper.EvaluateMapper;
import com.tianmao.mapper.ProductMapper;
import com.tianmao.mapper.ProductdetailsMapper;
import com.tianmao.pojo.Category;
import com.tianmao.pojo.Categoryvalue;
import com.tianmao.pojo.Evaluate;
import com.tianmao.pojo.Product;
import com.tianmao.pojo.Productdetails;
import com.tianmao.service.IProductService;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductdetailsMapper productdetailsMapper;
	
	@Autowired
	private CategoryvalueMapper categoryvalueMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private EvaluateMapper evaluateMapper;
	
	/**
	 * 获取商品评论
	 */
	@Override
	public List<Evaluate> getEvaluates(Evaluate evaluate) {
		return evaluateMapper.selectByproductId(evaluate.getProductid());
	}
	
	/**
	 * 搜索商品
	 */
	@Override
	public List<Product> serachProduct(Product product) {
		return productMapper.selectByname(product.getName());
	}
	
	/**
	 * 店内搜索商品
	 */
	@Override
	public List<Product> serachshopProduct(Product product) {
		return productMapper.selectshopByname(product);
	}

	/**
	 * 添加商品
	 */
	@Override
	public Product addProduct(Product product,List<Productdetails> productdetails,Categoryvalue categoryvalue) {
		productMapper.insert(product);
		for (Productdetails p : productdetails) {
			p.setProductid(product.getProductid());
			productdetailsMapper.insertSelective(p);
		}
		categoryvalue.setProductid(product.getProductid());
		categoryvalueMapper.insertSelective(categoryvalue);
		return product;
	}

	/**
	 * 添加商品图片
	 */
	@Override
	public boolean addProductdetails(List<Productdetails> productdetails) {
		try {
			for (Productdetails p : productdetails) {
				productdetailsMapper.insertSelective(p);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * 用户获取卖家单个商品
	 */
	@Override
	public Product getProduct(Product product) {
		return productMapper.selectByPrimaryKey(product.getProductid());
	}

	/**
	 * 商家获取他的所有商品
	 */
	@Override
	public List<Product> getProducts(Product product) {
		return productMapper.selectBysellerId(product.getSellerid());
	}
	
	/**
	 * 获取分类商品
	 */
	@Override
	public List<Product> getProductsBycategory(Product product) {
		return productMapper.selectBycategoryId(product.getProductid());
	}

	/**
	 * 获取单个商品所有图片
	 */
	@Override
	public List<Productdetails> getProductdetails(Productdetails productdetails) {
		System.out.println("图片服务");
		return productdetailsMapper.selectByproductId(productdetails.getProductid());
	}

	/**
	 * 更新商品信息(图片)
	 */
	@Override
	public boolean upProduct(Product product,List<Productdetails> productdetails,Categoryvalue categoryvalue) {
		productMapper.updateByPrimaryKeySelective(product);
		productdetailsMapper.deleteByproductId(product.getProductid());
		for (Productdetails p : productdetails) {
			productdetailsMapper.insertSelective(p);
		}
		categoryvalueMapper.updateByproductIdSelective(categoryvalue);
		return true;
	}

	@Override
	public boolean delProduct() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delProductdetails(Productdetails productdetails) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 获取所有属性分类
	 */
	@Override
	public List<Category> getCategorys() {
		return categoryMapper.selectAll();
	}

	@Override
	public boolean addCategoryvalue(Categoryvalue categoryvalue) {
		return false;
	}

	/**
	 * 获取单个商品所属分类
	 */
	@Override
	public Categoryvalue getCategoryvalue(Categoryvalue categoryvalue) {
		return categoryvalueMapper.selectByproductId(categoryvalue.getProductid());
	}

	/**
	 * 更新商品信息(库存，删除)
	 */
	@Override
	public boolean upProduct(Product product) {
		return productMapper.updateByPrimaryKeySelective(product)==1?true:false;
	}
	
}
