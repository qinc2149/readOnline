package com.gsau.controller;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/clear")
public class ClearSessionController {
	//跳转到登陆页面，并清空session
	@RequestMapping("/clearSession.do")
	public String clearSession(HttpServletRequest request){
		 Enumeration em = request.getSession().getAttributeNames();
		  while(em.hasMoreElements()){
		   request.getSession().removeAttribute(em.nextElement().toString());
		  }
		return "admin/login";

	}
}
