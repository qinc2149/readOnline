<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文章信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/ui-sunny/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src='../ckeditor/ckeditor.js'></script>
<script type="text/javascript">
	var url;
//删除	
	function deleteArticle(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].art_id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("delArtById.do",{delIds:ids.toString()},function(result){
					if(result){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','删除文章失败！');
					}
				},"json");
			}
		});
	}
//查询
	function searchArticle(){
		$('#dg').datagrid('load',{
			author:$('#author').val(),
			create_date:$('#create_date').datebox("getValue"),
			coluId:$('#coluId').combobox("getValue")
		});
	}
	
	
	function openArticleAddDialog(){
		resetValue();
		$("#dlg").dialog("open").dialog("setTitle","新增文章");
		url="addArticle.do";
	}
	
	function saveArticle(){	//做一个提交操作。
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if(result){
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败");
				}		
			}
		});
	}
	
	function resetValue(){
		$("#title").val("");
		$("#author").val("");
		$("#colu_id").combobox("setValue","");
		$("#content").val("");
	}
	
	function closeArticleDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function openArticleModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑文章");
		$("#fm").form("load",row);
		url="ArticleSave?art_id="+row.art_id;
	}
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="文章信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" url="findAllByPage.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="art_id" width="50" align="center">文章ID</th>
				<th field="title" width="130" align="center">文章标题</th>
				<th field="author" width="70" align="center">作者</th>
				<th field="create_date" width="100" align="center">发布时间</th>
				<th field="coluName" width="100" align="center">栏目名称</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openArticleAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openArticleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteArticle()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
		&nbsp;作者：&nbsp;<input type="text" name="author" id="author" size="10"/>
		&nbsp;发布日期：&nbsp;<input class="easyui-datebox" name="create_date" id="create_date" editable="false" size="10"/>
		&nbsp;所属栏目：&nbsp;<input class="easyui-combobox" id="coluId" name="coluId" size="10" data-options="panelHeight:'200',editable:false,valueField:'coluId',textField:'coluName',url:'../column/findAll.do'"/>
		    
		<a href="javascript:searchArticle()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 700px;height: 450px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			 <div>   
        		<label for="Title" >文章标题：</label>   
        		<input class="easyui-validatebox" type="text"  id="title" name="title" size='70' data-options="required:true" /> <br> <br>  
				<label for="Title" >作&nbsp;&nbsp;&nbsp;&nbsp;者：</label> 
				<input class="easyui-validatebox" id="author" name="author" id="author" required="true" editable="false" />
				&nbsp;&nbsp;&nbsp;&nbsp;<label for="Title" >	栏目名称：</label> 
				<input class="easyui-combobox" id="colu_id" name="colu_id"  data-options="panelHeight:'200',editable:false,valueField:'coluId',textField:'coluName',url:'../column/findAll.do'"/>
				<br><br>
				<textarea class='ckeditor' rows="12" cols="66" name="content" id="content"></textarea>
    		</div> 
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveArticle()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeArticleDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>