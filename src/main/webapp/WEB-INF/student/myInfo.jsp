<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改/完善个人信息</title>
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post">
		<div class="myftitle">
			个人信息
		</div>
		<div class="myfitem">
			<input type="hidden" name="stuId" value="${sessionScope.student.stuId }"/>
		</div>
	    <div class="myfitem">
			<label for="stuName">名字:</label> <input type="text" name="stuName" value="${sessionScope.student.stuName }"/>
		</div>
		<div class="myfitem">
			<label for="stuSex">性别:</label>
			<input type="radio" name="stuSex" value="男" checked="true"/>男
			<input type="radio" name="stuSex" value="女"/>女
		</div>
		<div class="myfitem">
			<label for="stuPhone">电话:</label> <input type="text" name="stuPhone" value="${sessionScope.student.stuPhone }"/>
		</div>
		<div class="myfitem">
			<label for="stuComedata">日期:</label> <input type="date" name="stuComedata" value="${sessionScope.student.stuComedata }"/>
		</div>
		<div class="myfitem">
			<label for="stuFavorable">个人爱好:</label> <input type="text" name="stuFavorable" value="${sessionScope.student.stuFavorable }"/>
		</div>
		<div class="myfitem">
			<label for="stuWords">励志名言:</label> <input type="text" name="stuWords" value="${sessionScope.student.stuWords }"/>
		</div>
		<div class="myfitem">
			<label for="stuRemark">备注:</label> <input type="text" name="stuRemark" value="${sessionScope.student.stuRemark }"/>
		</div>
		<div class="myfitem">
			<a id="btn" href="#" class="easyui-linkbutton" >提交</a>  
			<a id="btn2" href="#" class="easyui-linkbutton" onclick="javascript:parent.$('#win').window('close');" >关闭</a>  
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='修改/完善个人信息']").get(0).contentWindow;//返回ifram页面窗体对象（window)
		
			$("[name='stuName']").validatebox({
				required : true,
				missingMessage : '请填写名称！'
			});
			//禁用验证
			$("#ff").form("disableValidation");
			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/student/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
							//可以定义为对应消息框
							if(count>0){
								alert("完善失败！");									
							}else{
								alert("完善成功！");
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
