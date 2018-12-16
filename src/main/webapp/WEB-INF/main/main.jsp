<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>


<title>scm主页</title>

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
		style="height:130px;"><h1>欢迎您 ：${sessionScope.teacher.teaName }</h1></div>
	<!-- 左边导航 -->
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:150px;">

		<div id="aa" class="easyui-accordion">
			
			<div title="我的信息">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="我的信息"
						style="text-decoration: none;display: block;font-weight:bold;">我的信息</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="完善信息"
						style="text-decoration: none;display: block;font-weight:bold;">完善信息</a>
					</li>
				</ul>
			</div>
			
			<div title="系统管理与维护">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="公司信息设置"
						style="text-decoration: none;display: block;font-weight:bold;">公司信息设置</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="用户与授权设置"
						style="text-decoration: none;display: block;font-weight:bold;">用户与授权设置</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="年终结算"
						style="text-decoration: none;display: block;font-weight:bold;">年终结算</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="查看日志"
						style="text-decoration: none;display: block;font-weight:bold;">查看日志</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="备份/恢复数据库"
						style="text-decoration: none;display: block;font-weight:bold;">备份/恢复数据库</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="登录与退出"
						style="text-decoration: none;display: block;font-weight:bold;">登录与退出</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="软件帮助"
						style="text-decoration: none;display: block;font-weight:bold;">软件帮助</a>
					</li>
				</ul>
			</div>
			
			<div title="基础数据管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="修改数据字典"
						style="text-decoration: none;display: block;font-weight:bold;">修改数据字典</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="商品信息"
						style="text-decoration: none;display: block;font-weight:bold;">商品信息</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="供货商"
						style="text-decoration: none;display: block;font-weight:bold;">供货商</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="销售人员"
						style="text-decoration: none;display: block;font-weight:bold;">销售人员</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="操作员"
						style="text-decoration: none;display: block;font-weight:bold;">操作员</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="仓库"
						style="text-decoration: none;display: block;font-weight:bold;">仓库</a>
					</li>
				</ul>
			</div>
			
			<div title="进货管理" data-options="selected:true">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/sup_goods/sup_goodslist.action" title="商品列表"
						style="text-decoration: none;display: block;font-weight:bold;">商品列表</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="采购进货"
						style="text-decoration: none;display: block;font-weight:bold;">采购进货</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="采购退货"
						style="text-decoration: none;display: block;font-weight:bold;">采购退货</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="单据查询"
						style="text-decoration: none;display: block;font-weight:bold;">单据查询</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="账务查询"
						style="text-decoration: none;display: block;font-weight:bold;">账务查询</a>
					</li>
				</ul>
			</div>
			
			<div title="销售管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="商品销售"
						style="text-decoration: none;display: block;font-weight:bold;">商品销售</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="退货"
						style="text-decoration: none;display: block;font-weight:bold;">退货</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="维修"
						style="text-decoration: none;display: block;font-weight:bold;">维修</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="单据查询"
						style="text-decoration: none;display: block;font-weight:bold;">单据查询</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="账务查询"
						style="text-decoration: none;display: block;font-weight:bold;">账务查询</a>
					</li>
				</ul>
			</div>
			
			<div title="库存管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="库存调度"
						style="text-decoration: none;display: block;font-weight:bold;">库存调度</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="报损报溢"
						style="text-decoration: none;display: block;font-weight:bold;">报损报溢</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="库存盘点"
						style="text-decoration: none;display: block;font-weight:bold;">库存盘点</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="库存报警查询"
						style="text-decoration: none;display: block;font-weight:bold;">库存报警查询</a>
					</li>
				</ul>
			</div>
			
			<div title="统计报表">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="采购统计"
						style="text-decoration: none;display: block;font-weight:bold;">采购统计</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="业务员采购统计"
						style="text-decoration: none;display: block;font-weight:bold;">业务员采购统计</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="库存成本统计"
						style="text-decoration: none;display: block;font-weight:bold;">库存成本统计</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="商品销售统计"
						style="text-decoration: none;display: block;font-weight:bold;">商品销售统计</a>
					</li>
				</ul>
			</div>
			
			<div title="日常管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="提供对供应商供货情况及合同等信息"
						style="text-decoration: none;display: block;font-weight:bold;">合同信息</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="客户的消费及合同等"
						style="text-decoration: none;display: block;font-weight:bold;">客户的消费及合同</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="营业费用"
						style="text-decoration: none;display: block;font-weight:bold;">营业费用</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/msg/norealize.action" title="换班等进行管理"
						style="text-decoration: none;display: block;font-weight:bold;">换班管理</a>
					</li>
				</ul>
			</div>
			
			<div title="基础数据录入">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/supplier/supplierlist.action" title="供应商管理"
						style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/goods/goodslist.action" title="商品管理"
						style="text-decoration: none;display: block;font-weight:bold;">商品管理</a>
					</li>
				</ul>
			</div>
			


			
			<div title="采购管理" >
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/buyorder/insert.action" title="商品采购"
						style="text-decoration: none;display: block;font-weight:bold;">商品采购</a>
					</li>
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/goods/goodslist.action" title="商品退货"
						style="text-decoration: none;display: block;font-weight:bold;">商品退货</a>
					</li>
				</ul>
			</div>
			
			<div title="报表查询">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/datareport/selectsupplier.action" title="供应商采购额统计"
						style="text-decoration: none;display: block;font-weight:bold;">供应商采购额统计</a>
					</li>
				</ul>
			</div>
			
		</div>
		

		



	</div>

	<!-- 主体内容 -->
	<div data-options="region:'center',title:'主要信息'"
		style="padding:5px;background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="系统介绍" style="padding:20px;">这里可以写系统或公司的相关介绍等等 </div>
		</div>
	</div>
	<div id="win" ></div>

</body>

</html>