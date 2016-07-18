<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在线阅读平台后台管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/ui-sunny/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
			// 数据
		var systemData=[{
		text:"系统基本信息",
		children:[{
			text:"系统基本信息",
			attributes:{
				url:"baseInfo/toBaseInfo.do"
			}
		},{
			text:"管理员信息管理",
			attributes:{
				url:"admin/toUser.do"
			}
		}]
	}];
	
	var newsData=[{
		text:"新闻管理",
		children:[{
			text:"栏目管理",
			attributes:{
				url:"column/toColumn.do"
			}
		},{
			text:"文章管理",
			attributes:{
				url:"article/toArticle.do"
			}
		},{
			text:"图片管理",
			attributes:{
				url:"upload/toUpload.do"
			}
		}]
	}];
var ReportData=[{
		text:"综合统计分析",
		children:[{
			text:"美文热度分析",
			attributes:{
				url:"report/toReport.do"
			}
		}]
	}];
	
	// 实例化树菜单
	$("#systemSet").tree({
		data:systemData,
		lines:true,
		onClick:function(node){
			if(node.attributes){
				openTab(node.text,node.attributes.url);
			}
		}
	});
	$("#news").tree({
		data:newsData,
		lines:true,
		onClick:function(node){
			if(node.attributes){
				openTab(node.text,node.attributes.url);
			}
		}
	});
	$("#report").tree({
		data:ReportData,
		lines:true,
		onClick:function(node){
			if(node.attributes){
				openTab(node.text,node.attributes.url);
			}
		}
	});
	
		// 新增Tab
		function openTab(text,url){
			if($("#tabs").tabs('exists',text)){
				$("#tabs").tabs('select',text);
			}else{
				var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
				$("#tabs").tabs('add',{
					title:text,
					closable:true,
					content:content
				});
			}
		}
	});
//安全退出
function res(){
	location.href="clear/clearSession.do"
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:95px;background:#817866;">
		<img src="images/title.jpg">
		<div style="float:right;padding-right:60px;height:30px;padding-top:55px; color:#Feeebd;">当前用户:${user.name}  &nbsp; &nbsp; <input class="easyui-menubutton" style="color:#Feeebd;" type="reset" value="安全退出"  onClick="res()"></div>
	</div>
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:200px;">
	  <div class="easyui-accordion" style="width:193px;height:423px; border:none;">
        <div title="系统设置" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			<ul id="systemSet">
            </ul>
        </div>
        <div title="美文管理" data-options="iconCls:'icon-search'" style="padding:10px;">
           	 <ul id="news">
	    	</ul>
        </div>
        <div title="综合分析" data-options="iconCls:'icon-help'" style="padding:10px;">
             <ul id="report">
	    	</ul>
        </div>
    </div>
	
	</div>
	<div data-options="region:'center'">
		<div class="easyui-tabs" fit="true" border="false"  id="tabs">
			<div title="首页">
				<div><img src="images/welcome.jpg"/></div>
			</div>
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:30px; background:#E0EDFF;">
		<p align="center" style="margin-top:3px;">版权所有@ ADC.2015-0428</p>
	</div>

</body>
</html>