<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>栏目管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/ui-sunny/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	//查询
	function searchColumn(){
		$('#dg').datagrid('load',{
			coluName:$('#s_coluName').val()
		});
	}
	//删除
	function deleteColumn(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].coluId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				//ajax请求
				$.post("delColumn.do",{delIds:ids},function(result){
					if(result){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+selectedRows.length+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','删除栏目失败！您所选中的栏目下有文章');
					}
				},"json");
			}
		});
	}
	
	//新增
	function openColumnAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加栏目信息");
		url="addColumn.do";
	}
	//修改
	function openColumnModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑栏目信息");
		$("#fm").form("load",row);
		url="updateColumn.do?coluId="+row.coluId;
	}
	
	function closeColumnDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#ColuName").val("");
		$("#ColuDesc").val("");
	}
	//做一个提交操作。
	function saveColumn(){
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
		

</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="栏目信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true"  url="findAllColumn.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="coluId" width="100">栏目ID</th>
				<th field="coluName" width="250">栏目名称</th>
				<th field="create_Date" width="250">创建时间</th>
				<th field="coluDesc" width="250">栏目描述</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openColumnAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openColumnModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteColumn()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;栏目名称：&nbsp;<input type="text" name="coluName" id="s_coluName"/>
			<a href="javascript:searchColumn()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>栏目名称：</td>
					<td><input type="text" name="coluName" id="coluName"  size="37" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td valign="top">栏目描述：</td>
					<td><textarea rows="7" cols="30" name="coluDesc" id="coluDesc"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveColumn()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeColumnDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>