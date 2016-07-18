package com.gsau.entity.page;

public class Page {
	private int page;//当前页
	private int rows;//每页条数
	private int start;//计算出的分页开始
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getStart() {
		start=(page-1)*rows;
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
}	
