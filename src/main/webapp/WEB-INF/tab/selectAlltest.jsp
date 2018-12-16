<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title>班级试卷</title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>

<script type="text/javascript">
	$(function(){
			$('#dg').datagrid({    
			    //url:'${proPath}/classTest/selectAlltest.action', 
			    url:'${proPath}/test/selectAllClassTest.action', 
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
			    //在请求远程数据的时候发送额外的参数。
			    queryParams: {
			    	teaId:${sessionScope.teacher.teaId },
				}, 
					       
				columns : [ [{
					//如果为true，则显示复选框。该复选框列固定宽度
					checkbox:true,
				}, {
				field : 'classTestId',
				title : '编号',
				hidden: true
			}, {
				field : 'classes',
				title : '班级',
				width : 100,
				formatter: function(value,row,index){
					if (row.classesList.test){
						return row.user.name;
					} else {
						return value;
					}
				}
			}, {
				field : 'testId',
				title : '试卷',
				width : 100
			}, {
				field : 'testName',
				title : '试卷名称',
				width : 100,
			}, {
				field : 'classes.className',
				title : '班级名称',
				width : 100,
			}, {
				field : 'classTestState',
				title : '状态',
				width : 100,
			}] ]
		});
		var info = $('#dg').datagrid("getData");
		alert(info.rows.length);
		for(var i=0;i<info.rows.length;i++){  
            alert(info.rows[i].testName);
        }  
	});
</script>
</head>

<body>
	<table id="dg"></table>
</body>
</html>