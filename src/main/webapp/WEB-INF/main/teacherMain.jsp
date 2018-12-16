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
	<div data-options="region:'north',title:'欢迎教师来到考试系统',split:true"
		style="height:130px;"><h1>欢迎您 ：${sessionScope.teacher.teaName }老师</h1></div>
	<!-- 左边导航 -->
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:150px;">

		<div id="aa" class="easyui-accordion">
			
			<div title="我的信息">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/teacher/myInfo.action" title="修改/完善个人信息"
						style="text-decoration: none;display: block;font-weight:bold;">修改/完善个人信息</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/teacher/repass.action" title="修改密码"
						style="text-decoration: none;display: block;font-weight:bold;">修改密码</a>
					</li>
				</ul>
			</div>
			
			<div title="试题信息">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/topic/add.action" title="添加试题"
						style="text-decoration: none;display: block;font-weight:bold;">添加试题</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/topic/selectAll.action" title="我的题库"
						style="text-decoration: none;display: block;font-weight:bold;">我的题库</a>
					</li>
				</ul>
			</div>
			
			<div title="试卷信息" data-options="selected:false">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/test/add.action" title="添加试卷"
						style="text-decoration: none;display: block;font-weight:bold;">添加试卷</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="我的试卷"
						style="text-decoration: none;display: block;font-weight:bold;">我的试卷</a>
					</li>
				</ul>
			</div>
			<div title="试卷分配" data-options="selected:false">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/tab/selectAllclass.action?teaId=${sessionScope.teacher.teaId }" title="分发试卷"
						style="text-decoration: none;display: block;font-weight:bold;">分发试卷</a>
					</li>
					<%-- <li style="padding: 6px;"><a href="${proPath}/base/goURL/tab/selectAlltest.action" title="试卷状态"
						style="text-decoration: none;display: block;font-weight:bold;">试卷状态</a>
					</li> --%>
					<li style="padding: 6px;"><a href="${proPath}/classTest/selectAllClassTest.action?teaId=${sessionScope.teacher.teaId }" title="试卷状态"
						style="text-decoration: none;display: block;font-weight:bold;">试卷状态</a>
					</li>
				</ul>
			</div>
			<div title="成绩管理" data-options="selected:true">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/classTest/selectAllClassTest2.action?teaId=${sessionScope.teacher.teaId }" title="通过班级选择试卷"
						style="text-decoration: none;display: block;font-weight:bold;">通过班级选择试卷</a>
					</li>
					<%-- <li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="通过试卷选择班级"
						style="text-decoration: none;display: block;font-weight:bold;">通过试卷选择班级</a>
					</li> --%>
				</ul>
			</div>
			<%-- <div title="数据报表" data-options="selected:true">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="某次考试得所有班级平均分"
						style="text-decoration: none;display: block;font-weight:bold;">某次考试得所有班级平均分</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="某个班级所有试卷得平均分"
						style="text-decoration: none;display: block;font-weight:bold;">某个班级所有试卷得平均分</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/test/selectAlltest.action" title="某班某试卷得个人分统计表"
						style="text-decoration: none;display: block;font-weight:bold;">某班某试卷得个人分统计表</a>
					</li>
				</ul>
			</div> --%>
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