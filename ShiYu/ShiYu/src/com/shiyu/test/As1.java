package com.shiyu.test;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.shiyu.pojo.User;


//持久层 @Repository
//业务层 @Service
//控制层 @Controller
@Component("user")//(通用)加入ioc容器，不写值注入时会根据容器中的类型自动匹配
public class As1 {
	
	@Resource(name = "user")//注入属性对象，不写name则根据容器中的类型自动匹配注入
					//自动匹配注入需确保容器中只有一个该类型引用，若有多个该类型则都创建
	private As1 as1;
	public void setAs1(As1 as1) {
		this.as1 = as1;
	}
	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		//从容器中获取对象
		User user = (User) ac.getBean("user");
		System.out.println(user);
		user = (User) ac.getBean("user");
		System.out.println(user);
		
	}
}
