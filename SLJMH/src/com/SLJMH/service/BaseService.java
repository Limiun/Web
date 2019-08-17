package com.SLJMH.service;

import java.util.List;

public interface BaseService<T> {
	/**
	 * 保存实体
	 * 
	 * @param entity
	 */
	    public void save(T entity);
	    /**
		 * 删除实体
		 * 
		 * @param id
		 */
	    public void delete(T entity);
	    /**
		 * 根据ID删除实体
		 * 
		 * @param id
		 */
	    
	    
	    /**
		 * 更新实体
		 * 
		 * @param entity
		 */
	    public void update(T entity);
	    /**
		 * 按id查询
		 * 
		 * @param id
		 * @return
		 */
	    /**
		 * 查询所有
		 * 
		 * @return
		 */
	    public List<T> findAll(String clazz);
	    
		/**
		 * 按姓名查询
		 * 
		 * @return
		 */
	    List<T> findByName(String name);
}
