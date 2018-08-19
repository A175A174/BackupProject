package com.shiyu.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//注解版本 @org.springframework.stereotype.Controller
//访问hello/xxx @RequestMapping(value="hello")
public class Mvc implements Controller{
	
	//注解mvc,value可对应多个请求(数组)
	@RequestMapping(method=RequestMethod.POST,value="hello.action")
	public String xxx(Model model) {
		System.out.println("haha");
		return "hello.jsp";
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView modelAndView = new ModelAndView("NewFile.jsp");
		modelAndView.addObject("name", "haha");
		//modelAndView.setViewName("NewFile.jsp");
		return modelAndView;
	}

}
