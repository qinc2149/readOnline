package com.gsau.dao;

import java.util.List;
import java.util.Map;

import com.gsau.annotation.MyBatisRepository;
import com.gsau.entity.Report;
import com.gsau.entity.page.ReportPage;
@MyBatisRepository
public interface ReportMapper {
	
	List<Report> findSum(ReportPage page);//柱状图

	List<Report> findAll(ReportPage page);//表格
	
}
