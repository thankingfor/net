<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>给学生分配试卷</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post" action="${proPath}/classTest/add.action">
		<div class="myftitle">
			学生分配试卷
		</div>
		<div class="myfitem">
			<label for="testId">选择试卷:</label> 
			<select name="testId">
				<c:forEach items="${testList }" var="t">
					<option value="${t.testId }">${t.testName }</option>
				</c:forEach>
			</select>
		</div>
		<div class="myfitem">
			<label for="classId">选择班级:</label> 
			<select name="classId">
				<c:forEach items="${classList }" var="c">
					<option value="${c.classId }">${c.className }</option>
				</c:forEach>
			</select>
		</div>
		<div class="myfitem">
			<label for="classTestState">状态:</label> <input type="hidden" name="classTestState" value="未完成"/>
		</div>
		<div class="myfitem">
			<input type="submit" name="tijiao"  value="提交"/>
		</div>
	</form>
</body>
</html>
