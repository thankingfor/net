<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改密码</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post">
		<div class="myftitle">
			修改密码|忘记密码请联系管理员
		</div>
		<div class="myfitem">
			<input type="hidden" name="stuId" value="${sessionScope.student.stuId }"/>
		</div>
		<!-- 这里用js写一个判断teaPass与session中的密码进行比较,如果不一样,就提交 -->
	    <div class="myfitem">
			<label for="oddPass">请输入之前密码:</label> <input type="text" name="oddPass"/>
		</div>
		<div class="myfitem">
			<label for="stuPass">请输入新密码:</label> <input type="text" name="stuPass"/>
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>  
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='修改密码']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/student/repass.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
							//可以定义为对应消息框
							if(count>0){
								alert("修改失败！");									
							}else{
								alert("修改成功！");
							}
							parent.$("#win").window("close");
							win.$("#dg").datagrid("reload");							
						}
					});
				}
			});

		});
	</script>
</body>
</html>
