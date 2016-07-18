package com.gsau.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.gsau.dao.PictureMapper;
import com.gsau.entity.Picture;

@Controller
@RequestMapping("/upload")
public class UploadController {
	@Resource 
	private PictureMapper pictureMapper;
	// 显示上载界面
	@RequestMapping("/toUpload.do")
	public String uploadForm() {
		return "picShow/upload";
	}

	// 处理图片上载请求
	@RequestMapping("/uploadPic.do")
	public String uploadAction(MultipartFile image,String picDescr ,String picTitle,HttpServletRequest req) throws Exception {
		Picture pic = new Picture();
		/*
		 * 了解一下MultipartFile 的API方法
		 * 
		 * image.getOriginalFilename();//获取原有文件名
		 * image.getName();//获取上载空间name属性值(image)
		 * image.getContentType();//上载文件类型 如:png jpeg
		 * image.getBytes();//获取全部上载的数据 image.getInputStream();//获得上载文件的流
		 * image.getSize();//文件大小
		 */
		//1 如果不是png图片 返回upload重新上载
		/*
		 * 2 将图片保存在/WEB-INF/image 文件夹
		 *   A 如果文件夹不存在，就创建文件夹
		 *   B 将文件保存为：文件名+时间纳秒数
		 */ 
		//3 转发到upload页，显示上载成功
		if(image==null || !image.getContentType().equals("image/jpeg")){
			req.setAttribute("error", "不是jpg图片");
			return "picShow/upload";
		}
		//保存文件
		/*
		 * 思考: 在文件系统上是否有/WEB-INF 文件夹?
		 * 		/WEB-INF 称为Web路径
		 * 		如下是实际路径(RealPath)
		 * 		D:\...\...
		 * 		也就是说 保存文件的位置 /WEB-INF
		 * 		的实际位置是:  D:\...\...
		 */
		String path = "D:\\javaWeb\\readOnline\\WebContent\\pics";
		//path = req.getSession().getServletContext().getRealPath(path);
		System.out.println(path);//实际图片保存路径
		File dir = new File(path);
		if(! dir.exists()){
			dir.mkdir();
		}
		String filename = image.getOriginalFilename();
		filename = filename.substring(0,filename.lastIndexOf("."));
		filename+=System.nanoTime()+".jpg";
		File file = new File(dir,filename);
		FileOutputStream out = new FileOutputStream(file);
		out.write(image.getBytes());
		out.close();
		pic.setPicName(filename.substring(0, filename.lastIndexOf(".")));
		pic.setPicDescr(picDescr);
		pic.setPicTitle(picTitle);
		pictureMapper.addPic(pic);
		req.setAttribute("error"," 图片上传至: "+file.getCanonicalPath());
		return "picShow/upload";
	}

	// 处理上载期间出现的异常
	@ExceptionHandler
	public String execute(HttpServletRequest req, Exception e) throws Exception {
		//处理异常
		if(e instanceof IOException){
			e.printStackTrace();
			req.setAttribute("error", "文件保存失败");
			return "picShow/upload";
		}
		//文件超过上载限制异常
		if(e instanceof MaxUploadSizeExceededException){
			e.printStackTrace();
			req.setAttribute("error", "文件太大");
			return "picShow/upload";
		}
		throw e;
	}
}
