<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>已选题目</title>
<script type="text/javascript">
	$(function(){
			$('#dg').datagrid({    
			    url:'${proPath}/student/selectAllTest.action', 
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
			    	stuId:${sessionScope.student.stuId },
				}, 
				
				toolbar: [{
					iconCls: 'icon-add',
					text:'新增',
					handler: function(){
						parent.$('#win').window({    
							title :'添加试题',						
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/test/add.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'查看',
					handler: function(){
						parent.$('#win').window({    
							title :'已选题目',
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/test/selectAlltestTopic.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].testId;
							//alert(ids[i]);
						}
						parent.$.messager.confirm('添加对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
								  url: "${proPath}/test/deleteTest.action",
								  type:"POST",
								  traditional:true,
								  data:{pks:ids},
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
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].testId;
							//alert(ids[i]);
						}
						parent.$.messager.confirm('添加对话框', '您确认要完成试卷的试题添加么吗？', function(r) {
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
						}else{
							alert("请选择需要完成的试卷！");
						}
					}
				}],	
				
				columns : [ [{
					//如果为true，则显示复选框。该复选框列固定宽度
					checkbox:true,
				}, {
				field : 'testId',
				title : '试卷编号',
				hidden: true
			}, {
				field : 'testName',
				title : '试卷名称',
				width : 100,
			},{
				field : 'testNandu',
				title : '试卷难度',
				width : 100,
			}, {
				field : 'testScore',
				title : '试卷总分',
				width : 100
			}, {
				field : 'testTotal',
				title : '试题数量',
				width : 100,
			}, {
				field : 'testTime',
				title : '考试时间',
				width : 100
			}] ]
		});
	});
</script>
</head>
<body>
<a id="btn" href="#" class="easyui-linkbutton" >开始答题</a> 
<table id="dg"></table>
<form action="${proPath}/student/daTi.action" method="post" id="ff">
	<input id="testId" type="hidden" name="testId" value="">
	<input id="stuId" type="hidden" name="stuId" value="${sessionScope.student.stuId }">
</form>
<script type="text/javascript">
			$("#btn").click(function() {
				var array = $('#dg').datagrid("getSelections");
				if(array.length!=1){
					alert("请选择需要修改的记录，并且只能选中一条！");
					return false;							
				}
				var testId = array[0].testId;
				$('#testId').val(testId);
				$("#ff").submit();
			});
</script>
</body>
</html>
