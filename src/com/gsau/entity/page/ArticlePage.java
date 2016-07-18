package com.gsau.entity.page;

import java.sql.Timestamp;

public class ArticlePage extends Page{

	//分装查询条件
	
	private String author;
	private String create_date;
	private String coluId;
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getColuId() {
		return coluId;
	}
	public void setColuId(String coluId) {
		this.coluId = coluId;
	}
	
}
