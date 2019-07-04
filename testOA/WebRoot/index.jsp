<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>衣物管理系统</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap-table.css">
<meta charset="utf-8">
<title>Bootstrap 实例 - 边框表格</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<style type="text/css">
	#spanDiv1 {
		position: absolute;
		left: 1100px;
		top: 55px;
	}
	
	#updateColourDiv{
		position: absolute;
		left:1270px;
		top: 40px;
	}
</style>

<script type="text/javascript">
	$(function() {
		query();//调用查询方法
		
		//添加点击事件
		$("#addButton").click(function(){
			window.location.href="inventory/goAdd";//跳转添加页
		})
	});	
	//就绪函数结束
	
	//删除库存
	function delInventory(tory_no){
		var inventoryTory_no=tory_no;
		if (confirm("是否确认删除?")) {
			//确认删除
			$.getJSON("inventory/doDel?tory_no="+inventoryTory_no,null,function(data){
				if(data>0){
					alert("删除成功");
					query();
				}else{
					alert("删除失败");
				}
			});
		}
	}
	
	
	//显示增加库存
	function addInventoryCount(tory_no){
		$("#tory_no").val(tory_no);
		$("#updateColourDiv").toggle();//显示/隐藏div
	}
	
	//查询
	function query(){
		$("#inventoryList tr:gt(0)").remove();
		$("#spanDiv1").html("");
		var str = "";
		var inventoryCount="";
		$.post("inventory/doList",$("#queryForm").serialize(),function(data){
			for (var i = 0; i < data.length; i++) {
				str+="<tr><td>"+data[i].tory_name+"</td><td>"+data[i].colour.c_name+"</td><td>"+data[i].tory_size+"</td><td>"+data[i].tory_price+"</td><td>"+data[i].tory_date+"</td><td>"+data[i].tory_count+"</td><td><button><a href='inventory/goUpdate?tory_no="+data[i].tory_no+"'>修改</a></button>&nbsp;&nbsp;&nbsp;<button onclick='addInventoryCount(\""+data[i].tory_no+"\")'>增加库存</button>&nbsp;&nbsp;&nbsp;<button onclick='delInventory(\""+data[i].tory_no+"\")'>删除</a></button></td>";
				inventoryCount=inventoryCount-0+data[i].tory_count-0;
			}
			$("#inventoryList").append(str);//追加表单
			$("#spanDiv1").append("当前库存："+inventoryCount);//追加库存
		});
	}
	
	//增加库存
	function updataColour(){
		$.getJSON("inventory/doUpdataCount",$("#updateColourForm").serialize(),function(data){
			if(data>0){
				query();//调用查询
				addInventoryCount();
				$("#tory_count").val("");
				alert("增库成功");
			}else{
				alert("增库失败");
			}
		});
	}
</script>
<body>
	<form method="post" id="queryForm">
		款式：<input type="text" name="tory_name" /> 
		尺码：<input type="text" name="tory_size" /> 
		<input type="hidden" name="tory_date" /> 
		<input type="hidden" name="emp_addr" />
		<input type="button" onclick="query()" class="btn btn-info" value="查询" />&nbsp;&nbsp;&nbsp;
	</form><h4><span id="spanDiv1"></span></h4>
	<button id="addButton" class="btn btn-info">添加库存</button>
	<table border="1" id="inventoryList" class="table table-bordered"
		style="table-layout: fixed">
		<tr>
			<th>款式</th>
			<th>颜色</th>
			<th>尺码</th>
			<th>单价</th>
			<th>上架日期</th>
			<th>库存</th>
			<th>操作</th>
		</tr>
	</table>
	
	<!-- 修改库存div -->
	<div id="updateColourDiv" style="display: none;">
		<form id="updateColourForm">
			<!-- id隐藏域 -->
			<input type="hidden" id="tory_no" name="tory_no" value="" />
			<input type="text" id="tory_count" name="tory_count" value="" placeholder="输入库存" maxlength="20" />&nbsp;
			<input type="button" class="btn btn-warning" onclick="updataColour()" value="保存" />
		</form>
	</div>
	
</body>
</html>