<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统基本信息</title>
<style type="text/css">
	*{margin:0px;
	padding:0px;}
	body{
		color:#009900;
	}
	#top{
		width:100%;
		height:100px;
		line-height:100px;
		float:left;
		text-align:center;
	}
	#buttom{
		width:100%;
		height:300px;
		float:left;	
	}
	#buttom table{
		border-collapse:collapse;
		border-spacing:0px;
		border-color:orange;
		margin:0 auto;
	}
	#buttom table tr td{
		border-color:orange;
		text-align:center;
	}
</style>
<script type="text/javascript">
</script>
</head>
<body style="margin: 5px;">
	<div id="top">
		<h1>系统基本信息</h1>
	</div>
	<div id="buttom">
		<table width="80%;" border="1">
		  <tr>
		    <td colspan ="3" style="height:35px; line-height:35px;">在线阅读系统基本信息</td>
		  </tr>
		  <tr>
		    <td style="height:55px; line-height:55px;">硬件环境</td>
		    <td colspan = " 2 ">CPU：Pentium(R)4 CPU 2.8GHz；<br>内存：2GB的内存。</td>
		  </tr>
		    <tr>
		    <td style="height:55px; line-height:55px;">软件环境</td>
		    <td colspan = " 2 ">
				    运行平台：Windows7 以上 64位；<br>
					运行环境：JDK(Java Development Kit)；java EE；<br>
					系统开发语言：java；<br>
					数据库系统：MySQL；<br>
					浏览器：IE9.0或IE9.0以上；<br>
					分辨率：1366*768；<br>
					服务器：tomcat7.0[1] ；<br>
					主要开发工具：Eclipse、pl/sql、PowerDesigner15[14]；<br>
					辅助开发工具： Dreamweaver、Adobe Photoshop CS3、Fireworks CS5等工具。
		    </td>
		  </tr>
		  <tr>
		    <td style="height:55px; line-height:55px;">功能模块</td>
		    <td colspan = " 2 ">管理员管理，美文管理，综合分析，个人信息</td>
		  </tr>
		  <tr>
		    <td style="height:55px; line-height:55px;">系统版本信息</td>
		    <td colspan = " 2 ">当前版本：xxxxxxxxxxx</td>
		  </tr>
		</table>

	</div>
</body>
</html>