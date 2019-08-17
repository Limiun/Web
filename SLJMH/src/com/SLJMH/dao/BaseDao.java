package com.SLJMH.dao;

import java.util.List;

public interface BaseDao<T>  {
	/**
	 * 保存实体
	 * @param entity
	 */
	void save(T entity);

	/**
	 * 删除实体
	 * @param entity
	 */
	void delete(T entity);
	

	/**
	 * 更新实体
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 按id查询
	 * @param id
	 * @return
	 */

	/**
	 * 按id查询
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Integer[] ids);

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	List<T> findAll(String clazz);
	
	/**
	 * 按姓名查询
	 * @return
	 */
	List<T> findByName(String name);
	
}
