package com.gsau.entity;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable {
	private Integer art_type_id;
	private String art_type_name;//文章类型名
	private String heat_index;//文章热度指数
	private String feedback_sum;//读者统计点击数
	private Date submission_time;//统计时间
	public Date getSubmission_time() {
		return submission_time;
	}
	public void setSubmission_time(Date submission_time) {
		this.submission_time = submission_time;
	}
	public String getHeat_index() {
		return heat_index;
	}
	public void setHeat_index(String heat_index) {
		this.heat_index = heat_index;
	}
	public Integer getArt_type_id() {
		return art_type_id;
	}
	public void setArt_type_id(Integer art_type_id) {
		this.art_type_id = art_type_id;
	}
	public String getArt_type_name() {
		return art_type_name;
	}
	public void setArt_type_name(String art_type_name) {
		this.art_type_name = art_type_name;
	}
	public String getFeedback_sum() {
		return feedback_sum;
	}
	public void setFeedback_sum(String feedback_sum) {
		this.feedback_sum = feedback_sum;
	}
	
}
