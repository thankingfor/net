<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title>供货商提供的商品表</title>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>

<script type="text/javascript">
	$(function(){
			$('#dg').datagrid({    
			    url:'${proPath}/topic/select.action', 
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
					topType: '%%',
					topKnowledge:'%%',
					topNandu: '%%',
					topTimu:'%%'		
				}, 
				//顶部工具栏的DataGrid面板。可能的值：
			    toolbar: [{
					iconCls: 'icon-add',
					text:'添加',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						alert($('#testState').val());
						if($('#testState').val() == '完成'){
							alert($('testState').val());
							return ;
						}
						if(array.length>0){
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].topId;
						}
						var test = $('#testId').val();
						parent.$.messager.confirm('添加对话框', '您确认要添加吗？', function(r) {
							if (r) {
								$.ajax({
								  url: "${proPath}/test/addTi.action",
								  type:"POST",
								  traditional:true,
								  data:{pks:ids,
								  		testId:test},
								  success: function(html){
									 alert("添加成功");
								    $("#dg").datagrid("reload");
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function(html){
									 alert("添加成功");
								    $("#dg").datagrid("reload");
								    $("#dg").datagrid("clearSelections");
								  },
								  dataType:'json'
									});
								}
							});
						}else{
							alert("请选择需要添加的记录！");
						}
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].topId;
						}
						var test = $('#testId').val();
						parent.$.messager.confirm('添加对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
								  url: "${proPath}/test/deleteTestTopic.action",
								  type:"POST",
								  traditional:true,
								  data:{pks:ids,
								  		testId:test},
								  success: function(html){
									 alert("删除成功");
								    $("#dg").datagrid("reload");
								    $("#dg").datagrid("clearSelections");
								  },
								  dataType:'json'
									});
								}
							});
						}else{
							alert("请选择需要删除的记录！");
						}
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'完成',
					handler: function(){
						var test = $('#testId').val();
						alert("ids"+test);
						var ids = new Array();
						ids[0] = test;
						alert("ids"+ids);
						parent.$.messager.confirm('添加对话框', '您确认要完成吗？', function(r) {
							if (r) {
								$.ajax({
								  url: "${proPath}/test/testOk.action",
								  type:"POST",
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
									 alert("成功");
								    $("#dg").datagrid("reload");
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function(html){
									 alert("成功");
								    $("#dg").datagrid("reload");
								    $("#dg").datagrid("clearSelections");
								  },
								  dataType:'json'
									});
								}
							});
					}
				},'-',{
					text:"类型：<input type='text' id='topType' name='topType'/>",					
				}
				,'-',{
					text:"知识点：<input type='text' id='topKnowledge' name='topKnowledge'/>",			
				}
				,'-',{
					text:"难度：<input type='text' id='topNandu' name='topNandu'/>",				
				}
				,'-',{
					text:"题目：<input type='text' id='topTimu' name='topTimu'/>",					
				}],			       
			    

				columns : [ [{
					//如果为true，则显示复选框。该复选框列固定宽度
					checkbox:true,
				}, {
				field : 'topId',
				title : '题目编号',
				hidden: true
			}, {
				field : 'topType',
				title : '题目类型',
				width : 100,
			}, {
				field : 'topKnowledge',
				title : '知识点',
				width : 100
			}, {
				field : 'topNandu',
				title : '题目难度',
				width : 100,
			}, {
				field : 'topTimu',
				title : '题目',
				width : 200
			}] ]
		});
		
			$('#topTimu').searchbox({ 
			searcher:function(value,name){ 
				//alert("topTimu:"+value); 
				//alert("topType:"+$('#topType').val());
				//alert("topNandu:"+$('#topNandu').val());
				//alert("topKnowledge:"+$('#topKnowledge').val());
				$('#dg').datagrid('load',{
					teaId: ${sessionScope.teacher.teaId },
					topType: '%'+$('#topType').val()+'%',
					topNandu: '%'+$('#topNandu').val()+'%',
					topKnowledge: '%'+$('#topKnowledge').val()+'%',
					topTimu:'%'+value+'%'		
				});					
			}, 
			prompt:'' 
		});
	});
</script>
</head>

<body>
	<table id="dg"></table>
	<input type="text" value="${test.testId}" id="testId" />
	<input type="text" value="${test.testState}" id="testState" />
	<%-- <h1>当前试卷的名字为:${requestScope.test.testName }</h1> --%>
</body>
</html>