package com.gsau.dao;

import java.util.List;
import java.util.Map;

import com.gsau.annotation.MyBatisRepository;
import com.gsau.entity.Column;
import com.gsau.entity.page.ColumnPage;
@MyBatisRepository
public interface ColumnMapper {
	
	List<Column> findAllByPage(ColumnPage page);
	
	List<Column> findAll();
	
	int totalRows(ColumnPage page);
	
	void addColu(Column column);
	
	void updateColu(Column column);
	
	void deleteColu(Map<String, Object> param);
	
}
