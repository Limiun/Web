package com.SLJMH.dao;

import com.SLJMH.entity.Files;


public interface FileDao extends BaseDao<Files> {

	Files deleteById(Integer integer);

	void deleteFile(String fileUrl, String fileUuuName);
}
