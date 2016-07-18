package com.gsau.dao;

import java.util.List;
import java.util.Map;

import com.gsau.annotation.MyBatisRepository;
import com.gsau.entity.Picture;

@MyBatisRepository
public interface PictureMapper {
	
	List<Map<String,String>> findAllPic();
	
	void addPic(Picture picture);
		
}
