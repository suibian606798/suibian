<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入库</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/bootstrap-table.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap-table.css">
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		queryColour();//查询颜色
		
		//点击返回
		$("#tpButton").click(function() {
			window.location.href = "../index.jsp";//返回主页
		});
	});
	
	//添加员工
	function addInentory() {
		$.getJSON("../inventory/doAdd",$("#addInventory").serialize(),function(data) {
			if (data > 0) {
				alert("添加成功");
				window.location.href="../index.jsp";//修改完成自动跳回主页
			}if(data==0){
				alert("保存失败(检查您的格式是否正确，无法输入空值)");
			}if(data==-1) {
				alert("商品已存在，已默认增加库存");
				window.location.href="../index.jsp";//修改完成自动跳回主页
			}
		});	
	}
	
	//添加色彩
	function addColour(){
		$.getJSON("../colour/doAdd", $("#addColourForm").serialize(),function(data) {
			if (data > 0) {
				alert("添加成功");
				queryColour();//调用查询
				$("#addColourDiv").hide();//添加员工完成后隐藏添加部门div
			} else {
				alert("保存失败(检查您的格式是否正确，无法输入空值)");
			}
		});
	}
	
	//显示添加部门隐藏显示div
	function addDeptShow() {
		//点击则隐藏
		$("#addColourDiv").toggle(800);//显示/隐藏div
	}
	
	//查询颜色
	function queryColour() {
		$("#colourSelect option").remove();
		var str = "";
		$.getJSON("../colour/List", null, function(data) {
			for (var i = 0; i < data.length; i++) {
				str += "<option value="+data[i].c_no+">" + data[i].c_name+ "</option>"
			}
			$("#colourSelect").append(str);//添加的部门查询追加
		});
	}
</script>
</head>
<style type="text/css">
#addEmpDiv {
	/* border:3px solid #000; */
	width: 800px;
	height: 600px;
	margin: 0 auto;
	position: absolute;
	left: 600px;
	top: 80px;
}

#addColourDiv {
	position: absolute;
	left: 820px;
	top: 283px;
}

#laBei {
	position: absolute;
	left: 130px;
	top: -75px;
}
</style>

<body>
	<!-- 添加div -->
	<div id="addEmpDiv">
		<h1 id="laBei">入库添加</h1>
		<form id="addInventory" class="form-horizontal">
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;款式:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_name" name="tory_name" placeholder="请输入款式" maxlength="30" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;尺码:</label>
				<div class="col-sm-10">
					<input type="email" id="tory_size" name="tory_size" placeholder="输入尺码" maxlength="30" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;单价:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_price" name="tory_price" placeholder="输入单价" maxlength="20" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;库存:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_count" name="tory_count" placeholder="输入库存" maxlength="80" />
					<br />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;备注:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_remark" name="tory_remark" placeholder="输入备注" maxlength="80" />
					<br />
				</div>
			</div>
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">颜色：</label>
				<div class="col-sm-10">&nbsp;&nbsp;
					<select id="colourSelect" name="colour.c_no">
						
					</select><br />
				</div>
			</div>
			
		</form>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button" class="btn btn-warning" onclick="addInentory()" value="保存" />&nbsp;&nbsp;&nbsp;
		<button id="tpButton" class="btn btn-secondary">返回</button>
		&nbsp;&nbsp;&nbsp;
		<button onclick="addDeptShow()" class="btn btn-success">添加颜色</button>
	</div>
	
	<!-- 添加色彩div -->
	<div id="addColourDiv" style="display: none;">
		<form id="addColourForm">
			<font color="red">*</font>&nbsp;
			<input type="text" id="c_name" name="c_name" placeholder="输入颜色" maxlength="20" />&nbsp;
			<input type="button" class="btn btn-warning" onclick="addColour()" value="保存" />
		</form>
	</div>
</body>
</html>