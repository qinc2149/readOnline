<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>文件上载</title>
		<base href="<%=basePath%>">
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
		<script src="bootstrap/js/jquery-1.11.2.js"></script>
		<script src="bootstrap/js/bootstrap.js"></script>
		<script type="text/javascript" src='ckeditor/ckeditor.js'></script>
		<style type="text/css">
			*{
				padding:0px;
				margin:0px;
			}
			body{
			width:600px;
			text-align:center;
			margin:0 auto;
			border:4px solid  #8B864E ;
			border-radius: 6px;
			margin-top:30px;	
			background:	#FEEEBD;
			}
			h1{
				color: #006400 ;
				padding:10px 0px;
				background: #CDC9A5 ;
				font-family:Arial, Helvetica, sans-serif;
				font-weight:bold;
				margin-top:0px;
				border-bottom:3px solid  #8B864E ;
			}
			h1 input{float:right;}
		</style>
	</head>
	<body>
		<c:url var="url" value="/upload/uploadPic.do"/>
		<form action="${url}" method="post" enctype="multipart/form-data">
			<h1>上载图片
			<input type="file" name="image"  style="margin-bottom:8px;" value="niaiai "/></h1>
			 <input class="input-xlarge" type="text" name="picTitle" placeholder="图片主题">
			<textarea class='ckeditor'  name="picDescr"></textarea>
			<input class=" btn btn-large btn-block  btn btn-warning" type="submit" value="上传至服务器"></input>
		</form>
		<h5 style="color:#EE9A00;">${error}</h5>
	</body>
</html>