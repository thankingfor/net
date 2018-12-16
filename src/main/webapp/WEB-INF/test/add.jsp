<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>添加试卷</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post" action="${proPath}/test/add.action">
		<div class="myftitle">
			添加试卷
		</div>
		<div class="myfitem">
			<input type="hidden" name="testId" value=""/>
		</div>
		<div class="myfitem">
			<input type="hidden" name="teaId" value="${sessionScope.teacher.teaId }"/>
		</div>
		<div class="myfitem">
			<input type="hidden" name="testState" value="未完成"/>
		</div>
		<div class="myfitem">
			<label for="testName">名字:</label> <input type="text" name="testName" />
		</div>
		<div class="myfitem">
			<label for="testNandu">难度:</label> 
			<select id="cc" class="easyui-combobox" name="testNandu" style="width:200px;">   
				   <option value="简单" selected="selected">简单</option>  
				   <option value="一般">一般</option> 
				   <option value="困难">困难</option>  
			</select>
		</div>
		<div class="myfitem">
			<label for="testScore">分数:</label> <input type="text" name="testScore" value="100"/>
		</div>
		<div class="myfitem">
			<label for="testTime">时间:</label> <input type="text" name="testTime" value="120"/>
		</div>
		<div class="myfitem">
			<input type="submit" name="tijiao"  value="创建"/>
		</div>
	</form>
</body>
</html>
