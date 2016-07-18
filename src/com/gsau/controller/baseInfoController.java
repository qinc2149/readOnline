package com.gsau.controller;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/baseInfo")
public class baseInfoController implements Serializable {
	@RequestMapping("/toBaseInfo.do")
	public String toReport(){
		return "news/baseInfo";
	}
}
