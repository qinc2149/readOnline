package com.gsau.controller;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsau.dao.ColumnMapper;
import com.gsau.dao.UserMapper;
import com.gsau.entity.User;
import com.gsau.entity.page.UserPage;
@Controller
@RequestMapping("/admin")
public class AdminController implements Serializable {
	@Resource
	private UserMapper userMapper;
	@RequestMapping("/toAdmin.do")
	public String toAdmin(){
		return "admin/main";
	}
	@RequestMapping("/toUser.do")
	public String toReport(){
		return "news/user_list";
	}
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		return "admin/login";
	}
	//分页查询
	@ResponseBody
	@RequestMapping("/findAllByPage.do")
	public Map<String,Object> findAll(UserPage page){
		Map<String, Object> result= new HashMap<String, Object>();
		List<User> users=userMapper.findAllByPage(page);
		Integer total = userMapper.totalRows(page);
		result.put("rows", users);
		result.put("total", total);
		return result;
	}
	//登陆验证
	@RequestMapping("/login.do")
    public String login(String admin_code, String password, HttpSession session, Model model) {
        Map<String, Object> result = new HashMap<String, Object>();
        User user = userMapper.findByCode(admin_code);
        if (user == null) {
        	model.addAttribute("flag", "用户名不存在！");
            return  "admin/login"; 
        } else if (!user.getPassword().equals(password)) {
        	model.addAttribute("flag", "密码错误！");
            return "admin/login"; 
        } else {
            session.setAttribute("user", user);//登陆成功，保存用户信息
            return "admin/main"; 
        }
    }
}
