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
			    url:'${proPath}/topic/selectAll.action', 
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
					text:'新增',
					handler: function(){
						parent.$('#win').window({    
							title :'添加试题',						
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/topic/add.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'修改',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length!=1){
							alert("请选择需要修改的记录，并且只能选中一条！");
							return false;							
						}
						
						//打开修改窗口
						parent.$('#win').window({    
							title :'修改题目',
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/topic/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
						
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						//alert('删除按钮');
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){
							//alert("选中"+array.length);
							//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].topId;
							//alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
								  url: "${proPath}/topic/deleteList.action",
								  type:"POST",
								  //设置为传统方式传送参数
								  traditional:true,
								  data:{pks:ids},
								  success: function(html){
									  if(html>0){
									  	//alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
									  }else{
									  	alert("对不超 ，删除失败");
									  }
								  //重新刷新页面
								    $("#dg").datagrid("reload");
								    //请除所有勾选的行
								    $("#dg").datagrid("clearSelections");
								  },
								  error: function (XMLHttpRequest, textStatus, errorThrown) {
									    $.messager.alert('删除错误','请联系管理员！','error');
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
				alert("topTimu:"+value); 
				alert("topType:"+$('#topType').val());
				alert("topNandu:"+$('#topNandu').val());
				alert("topKnowledge:"+$('#topKnowledge').val());
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
</body>
</html>