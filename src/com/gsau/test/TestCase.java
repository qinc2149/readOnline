package com.gsau.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.gsau.dao.ColumnMapper;
import com.gsau.entity.Column;

public class TestCase {
	@Test
	public void testFindAll(){
		ApplicationContext ctx= new ClassPathXmlApplicationContext("applicationContext.xml");
		ColumnMapper mapper= ctx.getBean("columnMapper", ColumnMapper.class);
		System.out.println(mapper);
	}
}
