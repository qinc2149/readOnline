package com.gsau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsau.dao.ArticleMapper;
import com.gsau.dao.ColumnMapper;
import com.gsau.dao.PictureMapper;
import com.gsau.entity.Article;
import com.gsau.entity.Column;
import com.gsau.entity.page.ColumnPage;
import com.gsau.utils.StringToList;

@Controller
@RequestMapping("/picture")
public class PicController {
	@Resource 
	private PictureMapper pictureMapper;
	//无条件查询全部
	@RequestMapping("/findAllPic.do")
	public String findAllPic(Model model){
		List<Map<String,String>> pics=pictureMapper.findAllPic();
		model.addAttribute("pics", pics);
		return "../picture";
	}
}
