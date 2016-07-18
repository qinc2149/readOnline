<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美文热度分析</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/ui-sunny/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="style/global.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="echarts/echarts.js"></script>
<script type="text/javascript" src="js/report.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
	#left{
		width:39%;
		height:300px;
		border:1px solid #ccc;
		float:left;
	}
	#right{
		width:59%;
		border:1px solid #ccc;
		height:300px;
		float:right;
	}
	#buttom{
		width:100%;
		height:300px;
		border:1px solid #ccc;
		margin-top:10px;
		float:left;	
	}
#buttom table{
    border-collapse: collapse;
    border-spacing: 0px;
    width:100%;
    border: 0px;
    text-align: center;
}
#buttom table td
{
    border: #CCC solid 1px;
    height:26px;
}
table tr:hover
{
    background-color:#f7f9fd;
}
#buttom table th
{
    background:#FFD39B;
    border: #CCC solid 1px;
    height:35px;
}
	
</style>
</head>
<body style="margin: 5px;">
	<div id="left"></div>
	<div id="right"></div>
	<div id="buttom">
          <table>
          	<tr><th>文章类型ID</th><th>文章类型名</th><th>文章热度指数</th><th>读者反馈统计</th><th>统计时间</th></tr>
          	<c:forEach items="${reports}" var="report">
	        <tr>
	             <td>${report.art_type_id }</td>
	             <td>${report.art_type_name }</td>
	             <td>${report.heat_index }星</td>
	             <td>${report.feedback_sum }</td>
	             <td><fmt:formatDate value="${report.submission_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	        <tr>                 
          	</c:forEach>
          </table>  
	</div>
</body>
</html>