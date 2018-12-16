<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>Login page</title>
</head>
<body>
	<div id="loginDiv">
		<form id="ff" method="post" action="${proPath}/teacher/login.action">
			<div>
				<label for="teaId">账号:</label>
				<input type="text" name="teaId"  />
			</div>
			<div>
				<label for="teaPass">密码:</label>
				<input type="text" name="teaPass" />
			</div>
		</form>
		<div style="color:red">${requestScope.msg}</div>
	</div>
	<script type="text/javascript">
		$("[name='teaId']").validatebox({
			required : true,
			missingMessage : '请填写账号！'
		});
		$("[name='teaPass']").validatebox({
			required : true,
			missingMessage : '请填写密码！'
		});
		//禁用验证
		$("#ff").form("disableValidation");
		
		//把div的内容作为对话框方式弹出
		$('#loginDiv').dialog({
			title : '登陆入口',
			width : 250,
			height : 150,
			closed : false,
			cache : false,
			//设置关闭按钮可见
			closable : false,
			//模式化窗口.如果为true将锁屏
			modal : true,
			buttons:[{
				text:'登陆',
				handler:function(){
					//启用验证
					$("#ff").form("enableValidation");
					//进行验证，通过就提交
					if($("#ff").form("validate")){
						$("#ff").submit();
					}
				}
			},{
				text:'取消',
				handler:function(){
			}
			}]
		});
		
	</script>
</body>
</html>
