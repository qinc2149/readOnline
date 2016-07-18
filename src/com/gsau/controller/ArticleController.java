package com.gsau.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.gsau.entity.Article;
import com.gsau.entity.Column;
import com.gsau.entity.page.ArticlePage;
import com.gsau.utils.StringToList;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Resource 
	private ArticleMapper articleMapper;
	@Resource
	private ColumnMapper columnMapper;
	@RequestMapping("/toArticle.do")
	public String toArticle(){
		return "news/article_list";
	}
	//分页查询
	@ResponseBody
	@RequestMapping("/findAllByPage.do")
	public Map<String,Object> findAll(ArticlePage page){
		Map<String, Object> result= new HashMap<String, Object>();
		List<Map<String,Object>> articles=articleMapper.findAllByPage(page);
		Integer total = articleMapper.totalRows(page);
		result.put("rows", articles);
		result.put("total", total);
		return result;
	}
	//查询全部
	@RequestMapping("/findAll.do")
	public String findAllA(Model model){
		Map<String, Object> articleLists= new HashMap<String, Object>();
		List<Column> columns = columnMapper.findAll();
		for (Column colu : columns){
			List<Article> articles=articleMapper.findArtByColuId(colu.getColuId());
			articleLists.put(colu.getColuName(), articles);
		}
		model.addAttribute("articleLists", articleLists);
		return "../index";
	}
	//查询美文库
	@RequestMapping("/toArticles.do")
	public String findtoArticles(String coluName,Model model){
		String coluNa="";
		try {
			coluNa = new String(coluName .getBytes("iso8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> articleLists= new HashMap<String, Object>();
		List<Column> columns = columnMapper.findAll();
		for (Column colu : columns){
			List<Article> articles=articleMapper.findArtByColuId(colu.getColuId());
			articleLists.put(colu.getColuName(), articles);
		}
		model.addAttribute("articleLists", articleLists);
		model.addAttribute("coluNa",coluNa);
		return "../list";
	}
	//增加文献
	@ResponseBody
	@RequestMapping("/addArticle.do")
	public 	boolean addArticle(Article Article){
		articleMapper.addArticle(Article);
		return true;
	}
	//删除文章
	@RequestMapping("/delArtById.do")
	@ResponseBody
	public boolean delArtById(String delIds) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("ids", StringToList.buildIdList(delIds));
		articleMapper.delArtByIds(param);
		return true;
	}
	//根据文章id查询文章
	@RequestMapping("/findArtById.do")
	public String findArtById(Integer id ,Model model) {
		Article article=articleMapper.findArtById(id);
		model.addAttribute(article);
		return "../content";
	}
}
