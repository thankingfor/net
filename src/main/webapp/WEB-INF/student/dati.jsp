<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>学生答题</title>
</head>
<body class="mybody">
	<form id="ff" method="post">
		<h1>开始答题${grade.gradeId }</h1>
		<input type="hidden" name="stuId" value="${sessionScope.student.stuId }"/>
		<h2>填空题</h2>
		<table align="center" border="1">
		 	<tr align="center">
		 		<td width="100">题目</td>
		 		<td width="300">答案</td>
		 	</tr>
		 	<c:forEach items="${tiankonglist }" var="s">
			 	<tr align="center">
			 		<td>${s.topTimu }</td>
			 		<td>
			 		<input type="text" name="${s.topId }" />
			 		</td>
			 	</tr>
		 	</c:forEach>
		</table>
		<h2>选择题</h2>
		<table align="center" border="1">
		 	<tr align="center">
		 		<td width="100">题目</td>
		 		<td width="300">答案</td>
		 	</tr>
		 	<c:forEach items="${danxuanlist }" var="s">
			 	<tr align="center">
			 		<td>${s.topTimu }</td>
			 		<td>
			 		<input type="radio" name="${s.topId }" value="${s.topA }"/>${s.topA }<br/>
			 		<input type="radio" name="${s.topId }" value="${s.topB }"/>${s.topB }<br/>
			 		<input type="radio" name="${s.topId }" value="${s.topC }"/>${s.topC }<br/>
			 		<input type="radio" name="${s.topId }" value="${s.topD }"/>${s.topD }<br/>
			 		</td>
			 	</tr>
		 	</c:forEach>
		</table>
		<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
	</form>

	<script type="text/javascript">
		$("#btn").click(function() {
			alert("进来乐");
			var arr = [];
			for (i=0;i<$("input").length;i++) {
				arr[i] = $("input")[i].val();   
				alert("arr["+i+"]"+arr[i]);
			}
		});
	</script>
</body>
</html>
