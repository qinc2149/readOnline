package com.gsau.dao;

import java.util.List;
import java.util.Map;

import com.gsau.annotation.MyBatisRepository;
import com.gsau.entity.User;
import com.gsau.entity.page.UserPage;
@MyBatisRepository
public interface UserMapper {
	
	List<User> findAllByPage(UserPage page);
	
	int totalRows(UserPage page);
	
	User findByCode(String adminCode);
	
}
