package com.gsau.entity;

import java.io.Serializable;
import java.sql.Date;

public class Article implements Serializable {
	private Integer art_id;
	private String title;
	private String author;
	private Date create_date;
	private String content;
	private Integer colu_id;
	
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Article() {
	}
	public Integer getArt_id() {
		return art_id;
	}
	public void setArt_id(Integer art_id) {
		this.art_id = art_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getColu_id() {
		return colu_id;
	}
	public void setColu_id(Integer colu_id) {
		this.colu_id = colu_id;
	}
	public String toString() {
		
		return art_id+" "+title;
	}
	
}
