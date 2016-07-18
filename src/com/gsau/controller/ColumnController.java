package com.gsau.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsau.dao.ArticleMapper;
import com.gsau.dao.ColumnMapper;
import com.gsau.entity.Article;
import com.gsau.entity.Column;
import com.gsau.entity.page.ColumnPage;
import com.gsau.utils.StringToList;

@Controller
@RequestMapping("/column")
public class ColumnController {
	@Resource
	private ColumnMapper columnMapper;
	@Resource 
	private ArticleMapper articleMapper;
	//跳转到栏目列表
	@RequestMapping("/toColumn.do")
	public String toColumn(){
		return "news/column_list";
	}
	@ResponseBody
	@RequestMapping("/findAllColumn.do")
	public Map<String,Object> findAll(ColumnPage page){
		Map<String, Object> result= new HashMap<String, Object>();
		List<Column> columns=columnMapper.findAllByPage(page);
		Integer total = columnMapper.totalRows(page);
		result.put("rows", columns);
		result.put("total", total);
		return result;
	}
	//无条件查询全部
	@RequestMapping("/findAll.do")
	@ResponseBody
	public List<Column> findAll(){
		List<Column> columns = columnMapper.findAll();
		return columns;
	}
	//增加栏目
	@ResponseBody
	@RequestMapping("/addColumn.do")
	public 	boolean addColumn(Column column){
		columnMapper.addColu(column);
		return true;
	}
	//修改栏目
	@RequestMapping("/updateColumn.do")
	public void updateColumn(Column column){
		columnMapper.updateColu(column);
	}
	//删除栏目
	@RequestMapping("/delColumn.do")
	@ResponseBody
	public boolean delColumn(String delIds){
		Map<String,Object> param = new HashMap<String, Object>();
		List<Integer> listIds= StringToList.buildIdList(delIds);
		List<Article> arts = null;
		for(Integer id:listIds ){
			arts=articleMapper.findArtByColuId(id);
		}
		param.put("ids",listIds);
		if(arts.size()==0){
			 columnMapper.deleteColu(param);
			 return true;
		}
		return false;
		
	}
	
	
}
