package com.gsau.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsau.dao.ReportMapper;
import com.gsau.entity.Report;
import com.gsau.entity.page.ReportPage;
@Controller
@RequestMapping("/report")
public class ReportController implements Serializable {
	@Resource 
	private ReportMapper reportMapper;
	//表格数据
	@RequestMapping("/toReport.do")
	public String findTab(ReportPage page, Model model){
		List<Report> reports= new ArrayList<Report>();
		reports=reportMapper.findAll(page);
		model.addAttribute("reports", reports);
	    return "news/report_fx"; 
	}
	//分页查询
	@ResponseBody
	@RequestMapping("/findSum.do")
	public List<Report> findAll(ReportPage page){
		List<Report> result= new ArrayList<Report>();
		result=reportMapper.findSum(page);
		return result;
	}
	
}
