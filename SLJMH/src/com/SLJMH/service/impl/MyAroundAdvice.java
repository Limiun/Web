package com.SLJMH.service.impl;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
/**
 * 增强的类:
 * 使用的是Spring传统自动AOP的环绕增强
 *
 */
public class MyAroundAdvice implements MethodInterceptor{
	
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {
		System.out.println(methodInvocation.getMethod().getName()+"方法：使用Spring传统的AOP环绕前增强...自动方式");
		Object result = methodInvocation.proceed();// 执行目标对象的方法
		System.out.println(methodInvocation.getMethod().getName()+"方法：使用Spring传统的AOP环绕后增强...自动方式");
		return result;
	}

}