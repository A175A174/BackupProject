package com.tianmao.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tianmao.mapper.FreightMapper;
import com.tianmao.mapper.SellerMapper;
import com.tianmao.mapper.ShippingaddressMapper;
import com.tianmao.mapper.UserMapper;
import com.tianmao.pojo.Freight;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.Shippingaddress;
import com.tianmao.pojo.User;
import com.tianmao.service.IUserService;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private SellerMapper sellerMapper;
	
	@Autowired
	private FreightMapper freightMapper;
	
	@Autowired
	private ShippingaddressMapper shippingaddressMapper;

	@Override
	public boolean reg(User user) {
		return userMapper.insertSelective(user)==1?true:false;
	}

	@Override
	public User log(User user) {
		return userMapper.selectByName(user.getName());
	}

	@Override
	public boolean reg(Seller seller) {
		Freight freight = new Freight();
		freight.setCost(BigDecimal.valueOf(0));
		freight.setAddress("*");
		freight.setSellerid(seller.getSellercode());
		if(freightMapper.insertSelective(freight) == 1) {
			return sellerMapper.insertSelective(seller)==1?true:false;
		}
		return false;
	}

	@Override
	public Seller log(Seller seller) {
		return sellerMapper.selectByName(seller.getName());
	}
	
	@Override
	public Seller getBysellerCode(Seller seller) {
		return sellerMapper.selectBysellerCode(seller.getSellercode());
	}
	
	@Override
	public User getByuserCode(User user) {
		return userMapper.selectByuserCode(user.getUsercode());
	}

	@Override
	public boolean upBysellerCode(Seller seller) {
		return sellerMapper.updateBysellerCodeSelective(seller)==1?true:false;
	}
	
	@Override
	public boolean upByuserCode(User user) {
		return userMapper.updateByuserCodeSelective(user)==1?true:false;
	}

	/**
	 * 添加地址
	 */
	@Override
	public boolean addAddress(Shippingaddress address) {
		return shippingaddressMapper.insertSelective(address)==1?true:false;
	}
	
	/**
	 * 删出地址
	 */
	@Override
	public boolean delAddress(Shippingaddress address) {
		return shippingaddressMapper.updateByPrimaryKeySelective(address)==1?true:false;
	}

	/**
	 * 获取用户所有地址
	 */
	@Override
	public List<Shippingaddress> getAddress(Shippingaddress address) {
		return shippingaddressMapper.selectByuserID(address.getUserid());
	}
	/**
	 * 获取单个地址
	 */
	@Override
	public Shippingaddress getAddressById(Shippingaddress address) {
		return shippingaddressMapper.selectByPrimaryKey(address.getAddressid());
	}

	/**
	 * 获取运费
	 */
	@Override
	public Freight selectBysellerId(Freight record) {
		return freightMapper.selectBysellerId(record.getSellerid());
	}

	/**
	 * 更新运费
	 */
	@Override
	public boolean updateBysellerIdSelective(Freight record) {
		return freightMapper.updateBysellerIdSelective(record)==1?true:false;
	}

	/**
	 * 新建运费
	 */
	@Override
	public boolean insertFreightSelective(Freight record) {
		return freightMapper.insertSelective(record)==1?true:false;
	}

	/**
	 * 获取所有商家
	 */
	@Override
	public List<Seller> selectSellers() {
		return sellerMapper.selectSellers();
	}
}
