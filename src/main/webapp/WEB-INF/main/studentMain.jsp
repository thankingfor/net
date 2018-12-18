<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title>考试系统</title>

<script type="text/javascript">
	$(function() {
		$("a[title]").click(function() {
			var text = this.href;
			//判断是否存在
			if($('#tt').tabs("exists",this.title)){
				//存在则选中
				$('#tt').tabs("select",this.title);			
			}else{
				$('#tt').tabs('add', {
					title:this.title,
					//面板有关闭按键
				    closable:true, 
				    //href对远程页面js的支持不好 
					//href: text			
					//可以加载内容填充到选项卡，页面有Js时，也可加载
					content:"<iframe src='"+text+"' title='"+this.title+"' height='100%' width='100%' frameborder='0px' ></iframe>"
				});
			}
			return false;
		});
	});
</script>

</head>


<body class="easyui-layout">
	<!-- 头部 -->
	<div data-options="region:'north',title:'欢迎学生来到考试系统',split:true"
		style="height:130px;"><h1>欢迎您 ：${sessionScope.student.stuName }同学</h1></div>
	<!-- 左边导航 -->
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:150px;">

		<div id="aa" class="easyui-accordion">
			
			<div title="我的信息" data-options="selected:false">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/student/myInfo.action" title="修改/完善个人信息"
						style="text-decoration: none;display: block;font-weight:bold;">修改/完善个人信息</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/student/repass.action" title="修改密码"
						style="text-decoration: none;display: block;font-weight:bold;">修改密码</a>
					</li>
				</ul>
			</div>
			
			<div title="模拟考试" data-options="selected:false">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<%-- <li style="padding: 6px;"><a href="${proPath}/base/goURL/student/selectAlltest.action" title="添加试卷"
						style="text-decoration: none;display: block;font-weight:bold;">添加试卷</a>
					</li> --%>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/student/selectAlltest.action" title="我的试卷"
						style="text-decoration: none;display: block;font-weight:bold;">我的试卷</a>
					</li>
				</ul>
			</div>
			
			<div title="查看成绩" data-options="selected:true">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/student/result.action?stuId=${sessionScope.student.stuId }" title="查看成绩"
						style="text-decoration: none;display: block;font-weight:bold;">查看成绩</a>
					</li>
					<%-- <li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="我的试卷"
						style="text-decoration: none;display: block;font-weight:bold;">我的试卷</a>
					</li> --%>
				</ul>
			</div>
		</div>
	</div>

	<!-- 主体内容 -->
	<div data-options="region:'center',title:'主要信息'"
		style="padding:5px;background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="系统介绍" style="padding:20px;">考试管理系统</div>
		</div>
	</div>
	<div id="win" ></div>

</body>

</html>