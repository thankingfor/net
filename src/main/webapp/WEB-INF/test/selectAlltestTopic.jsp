<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>已选题目</title>
<script type="text/javascript">

	$(function(){
			var win = parent.$("iframe[title='我的试卷']").get(0).contentWindow;//返回ifram页面窗体对象（window)
			var row = win.$('#dg').datagrid("getSelected");
			$('#ff').form('load',{
				testId:row.testId,
			});
			$('#dg').datagrid({    
			    url:'${proPath}/test/selectAlltestTopic.action', 
			    //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
			    fitColumns:true,
			    //如果为true，则在同一行中显示数据。设置为true可以提高加载性能。
			    nowrapL:true,
			    //指明哪一个字段是标识字段。
			    //idField:'sg_id',
			    //如果为true，则显示一个行号列。
			    rownumbers:true,
			    //如果为true，则在DataGrid控件底部显示分页工具栏。
			    pagination:true,
			    //在设置分页属性的时候初始化页面大小。
			    pageSize:5,
			    //在设置分页属性的时候 初始化页面大小选择列表。
			    pageList:[2,5,10,20],
			    queryParams: {
			    	testId:$('#testId').val(),
				},  
				
				columns : [ [{
					//如果为true，则显示复选框。该复选框列固定宽度
					checkbox:true,
				}, {
				field : 'topId',
				title : '编号',
				hidden: true
			}, {
				field : 'topType',
				title : '类型',
				width : 100,
			},{
				field : 'topKnowledge',
				title : '知识点',
				width : 100,
			}, {
				field : 'topNandu',
				title : '难度',
				width : 100
			}, {
				field : 'topTimu',
				title : '题目',
				width : 100,
			}] ]
		});
	});
</script>
</head>
<body>
	<table id="dg"></table>
	<form id="ff"  method="post" action="${proPath}/test/selectAlltestTopic.action">
			<input type="hidden" name="testId" value="${test.testId }" id="testId"/>
	</form>
</body>
</html>
