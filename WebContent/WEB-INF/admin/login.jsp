<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
     <meta charset="utf-8">
     <base href="<%=basePath%>">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta name="description" content="">
     <meta name="author" content="">
	<!-- CSS -->
     <link rel="stylesheet" href="styles/reset.css">
     <link rel="stylesheet" href="styles/supersized.css">
     <link rel="stylesheet" href="styles/style.css">
	 <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
     <!--[if lt IE 9]>
     	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
     <![endif]-->
</head>
<body>
        <div class="page-container">
            <h1 style=" font-size:40px; font-family:'宋体'; text-shadow: 5px 5px 5px orange;">欢迎登录在线阅读管理系统</h1>
            <form action="admin/login.do" method="post">
                <input type="text" name="admin_code" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <button type="submit">提交</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect" style="color:#FF7256;">
            	${flag }
            </div>
        </div>	
        <!-- Javascript -->
        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>


