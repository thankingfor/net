<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改试题</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post" action="${proPath}/topic/update.action">
		<div class="myftitle">
			修改试题
		</div>
		<div class="myfitem">
			<input type="hidden" name="topId" value=""/>
		</div>
		<div class="myfitem">
			<label for="topType">类型：</label> 									
			<select id="cc" class="easyui-combobox" name="topType" style="width:200px;" >   
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
			<label for="topKnowledge">知识点:</label> <input type="text" name="topKnowledge" value="${sessionScope.topic.topKnowledge }"/>
		</div>
		<div class="myfitem">
			<label for="topTimu">题目:</label> <input type="text" name="topTimu" value="${sessionScope.topic.topTimu }"/>
		</div>
		<div class="myfitem">
			<label for="topDaan">答案:</label> <input type="text" name="topDaan" value="${sessionScope.topic.topDaan }"/>
		</div>
		<div class="myfitem">
			<label for="topB">选择之一:</label> <input type="text" name="topB" value="${sessionScope.topic.topB }"/>
		</div>
		<div class="myfitem">
			<label for="topC">选择之二:</label> <input type="text" name="topC" value="${sessionScope.topic.topC }"/>
		</div>
		<div class="myfitem">
			<label for="topD">选择之三:</label> <input type="text" name="topD" value="${sessionScope.topic.topD }"/>
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='我的题库']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			var row = win.$('#dg').datagrid("getSelected");
			$('#ff').form('load',{
				topId:row.topId,
				topKnowledge:row.topKnowledge,
				topTimu:row.topTimu,
				topDaan:row.topDaan,
				topNandu:row.topNandu,
				topType:row.topType,
				topB:row.topB,
				topC:row.topC,
				topD:row.topD,
			});
			$("#btn").click(function() {
				$('#ff').form('submit', {
					url : '${proPath}/topic/update.action',
					onSubmit : function() {
						return true;
					},
					success : function(count) {							
						parent.$("#win").window("close");
						win.$("#dg").datagrid("reload");							
					}
				});
			});
		});
	</script>
</body>
</html>
