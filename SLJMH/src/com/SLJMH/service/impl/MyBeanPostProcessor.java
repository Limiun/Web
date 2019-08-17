package com.SLJMH.service.impl;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

public class MyBeanPostProcessor implements BeanPostProcessor{
    /**
     * bean:实例对象
     * beanName:在配置文件中配置的类的标识.
     */
    public Object postProcessBeforeInitialization(Object bean, String beanName)
            throws BeansException {
        System.out.println("生命周期第五步:初始化之前执行..."+"【"+beanName+"】");
        return bean;
    }

    public Object postProcessAfterInitialization(final Object bean, String beanName)
            throws BeansException {
        System.out.println("生命周期第八步:初始化后执行...."+"【"+beanName+"】");
        
        if(beanName.equals("UserServiceImpl")){
        Object proxy = Proxy.newProxyInstance(bean.getClass().getClassLoader(), bean.getClass().getInterfaces() , new InvocationHandler() {
		public Object invoke(Object proxy, Method method, Object[] args)
				throws Throwable {
			// TODO Auto-generated method stub
			 if("save".equals(method.getName())){
                 System.out.println("记录日志开始...");
                 Object result = method.invoke(bean, args);
                 System.out.println("记录日志结束...");
                 return result;
             }
               return method.invoke(bean, args);
		     }
            });
               
               return proxy;
        }
                
        return bean;
    }

}