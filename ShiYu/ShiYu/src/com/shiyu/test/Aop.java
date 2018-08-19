package com.shiyu.test;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Aspect//指定切面类
@Component//加入容器
public class Aop {
	
	//类有实现接口用JDK的动态代理，否则使用Cglib代理
	@Pointcut("execution(* 类路径.*(..))")//切入点表达式
	public void point() {
		
	}
	
	@Before("point()")//执行方法之前
	public void ben() {
		System.out.println("ben");
	}
	
	
	@After("point()")//执行方法之后，无论目标方法是否出现异常都会执行
	public void end() {
		System.out.println("end");
	}
	
	@AfterReturning("point()")//返回后通知，调用目标方法结束后执行，目标方法出现异常时不执行
	private void returning() {
		System.out.println("returning");
	}
	
	@AfterThrowing("point()")//异常通知，目标方法出现异常时执行
	private void throwing() {
		System.out.println("throwing");
	}
	
	@Around("point()")//环绕通知
	private void around(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("ben");
		pjp.proceed();//执行目标方法
		System.out.println("end");
	}
}
