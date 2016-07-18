package com.gsau.utils;

import java.util.ArrayList;
import java.util.List;

public class StringToList {
	//字符串转换为list
		public static List<Integer> buildIdList(String ids) {
			if(ids == null || ids.length() == 0)
				return null;
			List<Integer> list = new ArrayList<Integer>();
			String[] idsArray = ids.split(",");
			for(String id : idsArray) {
				list.add(Integer.valueOf(id));
			}
			return list;
		}
}
