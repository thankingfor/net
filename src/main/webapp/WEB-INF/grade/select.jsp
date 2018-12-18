<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>班级试卷</title>
</head>
<body>
	<table align="center" border="1">
	 	<tr align="center">
	 		<td width="100">班级</td>
	 		<td width="100">试卷</td>
	 		<td width="100">查看学生成绩</td>
	 		<td width="100">检验全班同学完成后点我</td>
	 	</tr>
	 	<c:forEach items="${list }" var="s">
		 	<tr align="center">
		 		<td>${s.classes.className }</td>
		 		<td>${s.test.testName }</td>
		 		<td>
		 		<a href="${proPath}/classTest/result.action?testId=${s.test.testId }&classId=${s.classes.classId }">查看</a>
		 		</td>
		 		<td>
		 		<a href="${proPath}/classTest/finish.action?classTestId=${s.classTestId }">完成</a>
		 		</td>
		 	</tr>
	 	</c:forEach>
	</table>
</body>
</html>
