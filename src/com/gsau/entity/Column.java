package com.gsau.entity;

import java.io.Serializable;
import java.sql.Date;

/***
 * 
 * 实体类：栏目
 *
 */
public class Column implements Serializable{
	private Integer coluId;
	private String coluName;
	private Date create_Date;
	private String coluDesc;
	
	public Column() {
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coluId == null) ? 0 : coluId.hashCode());
		result = prime * result
				+ ((create_Date == null) ? 0 : create_Date.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Column other = (Column) obj;
		if (coluId == null) {
			if (other.coluId != null)
				return false;
		} else if (!coluId.equals(other.coluId))
			return false;
		if (create_Date == null) {
			if (other.create_Date != null)
				return false;
		} else if (!create_Date.equals(other.create_Date))
			return false;
		return true;
	}

	public Integer getColuId() {
		return coluId;
	}
	public void setColuId(Integer coluId) {
		this.coluId = coluId;
	}
	public String getColuName() {
		return coluName;
	}
	public void setColuName(String coluName) {
		this.coluName = coluName;
	}
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public String getColuDesc() {
		return coluDesc;
	}
	public void setColuDesc(String coluDesc) {
		this.coluDesc = coluDesc;
	}
	
}
