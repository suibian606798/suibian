<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		//点击返回
		$("#tpButton").click(function() {
			window.location.href = "../index.jsp";//返回主页
		});
	});
	
	//修改
	function updateInventory() {
		//验证是否通过
			$.getJSON("../inventory/doUpdate", $("#updateInventory").serialize(), function(data) {
				if (data > 0) {
					alert("修改成功");
					window.location.href="../index.jsp";//修改完成自动跳回主页
				} else {
					alert("修改失败(遇到异常!)");
				}
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

#addDeptDiv {
	position: absolute;
	left: 820px;
	top: 326px;
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
		<h1 id="laBei">修改商品</h1>
		<form id="updateInventory" class="form-horizontal">
			<!-- id隐藏域 -->
			<input type="hidden" id="tory_no" name="tory_no" value="${inventory.tory_no}" />
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;款式:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_name" name="tory_name" value="${inventory.tory_name}" placeholder="请输入款式" maxlength="30" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;尺码:</label>
				<div class="col-sm-10">
					<input type="email" id="tory_size" name="tory_size" value="${inventory.tory_size}" placeholder="输入尺码" maxlength="30" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;单价:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_price" name="tory_price" value="${inventory.tory_price}" placeholder="输入单价" maxlength="20" />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;库存:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_count" name="tory_count" value="${inventory.tory_count}" placeholder="输入库存" maxlength="80" />
					<br />
				</div>
			</div>

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;备注:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_remark" name="tory_remark" value="${inventory.tory_remark}" placeholder="输入备注" maxlength="80" />
					<br />
				</div>
			</div><fmt:formatDate value="${employee.emp_c_date}" pattern="yyyy-MM-dd" />
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"><font color="red">*</font>&nbsp;上架时间:</label>
				<div class="col-sm-10">
					<input type="text" id="tory_date" name="tory_date" value="<fmt:formatDate value="${inventory.tory_date}" pattern="yyyy-MM-dd" />" maxlength="80" />
					<br />
				</div>
			</div>
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">颜色：</label>
				<div class="col-sm-10">&nbsp;&nbsp;
					<select name="colour.c_no">
						<c:forEach items="${colourList}" var="colourList">
							<option value="${colourList.c_no }">${colourList.c_name }</option>
						</c:forEach>
					</select><br />
				</div>
			</div>
			
		</form>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button" class="btn btn-warning" onclick="updateInventory()" value="保存" />&nbsp;&nbsp;&nbsp;
		<button id="tpButton" class="btn btn-secondary">返回</button>
		&nbsp;&nbsp;&nbsp;
		<!-- <button onclick="addDeptShow()" class="btn btn-success">添加部门</button> -->
	</div>
	
	<!-- 添加部门div -->
	<div id="addDeptDiv" style="display: none;">
		<form id="addDeptForm">
			<font color="red">*</font>&nbsp;<input type="text" id="dept_nameS"
				name="dept_name" placeholder="输入您的部门名称" maxlength="20" />&nbsp;
				<input type="button" class="btn btn-warning" onclick="addDept()" value="保存" />
				<font id="addDeptIf" style="display: none;" color="red">部门名称不能为空！</font>
				<font id="addDeptIfThereare" style="display: none;" color="red">部门已存在，请选择该部门</font>
		</form>
	</div>
</body>
</html>