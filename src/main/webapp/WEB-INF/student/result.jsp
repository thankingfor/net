<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>查询成绩</title>
</head>
<body>
	<table align="center" border="1">
	 	<tr align="center">
	 		<td width="100">试卷名字</td>
	 		<td width="100">成绩</td>
	 		<td width="100">状态</td>
	 	</tr>
	 	<c:forEach items="${list }" var="g">
		 	<tr align="center">
		 		<td>${g.test.testName }</td>
		 		<td>${g.stuScore }</td>
		 		<td>${g.testState }</td>
		 	</tr>
	 	</c:forEach>
	</table>
</body>
</html>
