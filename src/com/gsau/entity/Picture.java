package com.gsau.entity;

import java.io.Serializable;
import java.sql.Date;

public class Picture implements Serializable {
	private Integer picId;
	private String  picName;
	private String picDescr;
	private Date create_Date;
	private String picTitle;
	
	public String getPicTitle() {
		return picTitle;
	}
	public void setPicTitle(String picTitle) {
		this.picTitle = picTitle;
	}
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public Integer getPicId() {
		return picId;
	}
	public void setPicId(Integer picId) {
		this.picId = picId;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public String getPicDescr() {
		return picDescr;
	}
	public void setPicDescr(String picDescr) {
		this.picDescr = picDescr;
	}
	
}
