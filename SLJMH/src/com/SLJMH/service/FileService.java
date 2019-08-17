package com.SLJMH.service;

import com.SLJMH.entity.Files;

public interface  FileService extends  BaseService<Files> {

	Files findById(Integer integer);

	void deleteFile(String fileUrl, String fileUuuName);
}
