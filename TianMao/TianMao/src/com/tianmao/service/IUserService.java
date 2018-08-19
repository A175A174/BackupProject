package com.tianmao.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tianmao.pojo.Freight;
import com.tianmao.pojo.Seller;
import com.tianmao.pojo.Shippingaddress;
import com.tianmao.pojo.User;

@Service
public interface IUserService {
	boolean reg(User user);
	User log(User user);
	boolean reg(Seller seller);
	List<Seller> selectSellers();
	Seller log(Seller seller);
	Seller getBysellerCode(Seller seller);
	User getByuserCode(User user);
	boolean upBysellerCode(Seller seller);
	boolean upByuserCode(User user);
	boolean addAddress(Shippingaddress address);
	List<Shippingaddress> getAddress(Shippingaddress address);
	Shippingaddress getAddressById(Shippingaddress address);
	boolean delAddress(Shippingaddress address);
	Freight selectBysellerId(Freight record);
	boolean updateBysellerIdSelective(Freight record);
	boolean insertFreightSelective(Freight record);
}
