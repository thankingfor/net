<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>添加试题</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post" action="${proPath}/topic/add.action">
		<div class="myftitle">
			添加试题
		</div>
		<div class="myfitem">
			<input type="hidden" name="topId" value=""/>
		</div>
		<div class="myfitem">
			<input type="hidden" name="teaId" value="${sessionScope.teacher.teaId }"/>
		</div>
		<div class="myfitem">
			<label for="topType">类型：</label> 									
			<select id="cc" class="easyui-combobox" name="topType" style="width:200px;">   
				   <option value="填空" selected="selected">填空</option>  
				   <option value="单选">单选</option> 
				   <option value="多选">多选</option>  
			</select>  
		</div>
		<div class="myfitem">
			<label for="topNandu">难度:</label> 
			<select id="cc" class="easyui-combobox" name="topNandu" style="width:200px;">   
				   <option value="简单" selected="selected">简单</option>  
				   <option value="一般">一般</option> 
				   <option value="困难">困难</option>  
			</select>
		</div>
		<div class="myfitem">
			<label for="topKnowledge">知识点:</label> <input type="text" name="topKnowledge" />
		</div>
		<div class="myfitem">
			<label for="topTimu">题目:</label> <input type="text" name="topTimu" />
		</div>
		<div class="myfitem">
			<label for="topDaan">答案:</label> <input type="text" name="topDaan" />
		</div>
		<div class="myfitem">
			<label for="topB">选择之一:</label> <input type="text" name="topB" />
		</div>
		<div class="myfitem">
			<label for="topC">选择之二:</label> <input type="text" name="topC" />
		</div>
		<div class="myfitem">
			<label for="topD">选择之三:</label> <input type="text" name="topD" />
		</div>
		<div class="myfitem">
			<input type="submit" name="tijiao"  value="提交"/>
		</div>
	</form>
</body>
</html>
