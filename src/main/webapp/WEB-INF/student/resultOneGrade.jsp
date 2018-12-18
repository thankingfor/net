<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>显示成绩</title>
</head>
<body>
	<c:choose>
		<c:when test="${grade.testState eq '完成'}">
			<h1>恭喜恭喜</h1>
			<h3>您的分数为${grade.stuScore}</h3>
		</c:when>
		<c:otherwise>
			<h1>啊！！！！</h1>
			<h3>您还没有完成考试，请尽快完成考试</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>
