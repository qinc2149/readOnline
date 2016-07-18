package com.gsau.dao;

import java.util.List;
import java.util.Map;

import com.gsau.annotation.MyBatisRepository;
import com.gsau.entity.Article;
import com.gsau.entity.Column;
import com.gsau.entity.page.ArticlePage;

@MyBatisRepository
public interface ArticleMapper {
	
	List<Map<String,Object>> findAllByPage(ArticlePage page);
	
	
	List<Article>  findArtByColuId(Integer id); 
	
	Integer totalRows(ArticlePage page);
	
	void addArticle(Article Article);
	
	void delArtByIds(Map<String, Object> param);
	
	Article findArtById(Integer id);
	
}
