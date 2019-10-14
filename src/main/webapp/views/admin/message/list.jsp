<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>留言列表</title>
   <!--easyui js与cess导入  -->
    <%@include file="/views/admin/common/easyui.jsp" %>
    <script type="text/javascript" src="/js/date.js"></script>
    
    <script type="text/javascript">
        
        $(function(){
        
	        $('#dg').datagrid({
			    url:'${pageContext.request.contextPath}/admin/message/list.do', 
			    pagination:true,
			    pagePosition:'bottom',
			    rownumbers:true,
			    pageSize:10,
			    fitColumns:true,
			   /*  fit:true,   */
			    columns:[[
			        {field:'userName',title:'姓名',width:100},
			        {field:'mobile',title:'手机号码',width:100},
			        {field:'demands',title:'咨询项目',width:100},
			        {field:'createDate',title:'创建日期',width:100,
			        formatter :Common.DateFormatter},
			        {field:'updateDate',title:'更新日期',width:100,
			        formatter :Common.DateFormatter}
			    ]],
			    onLoadError: function(){
	            $.messager.alert('提示','没有符合条件的搜索结果！');
	        }
		});
		
		 $('#ss').searchbox({
		    searcher:function(value,name){
	            $('#dg').datagrid('load', {
	                searchName: name,    
	                searchValue: value
	            });
		    },
		    menu:'#mm',
		    prompt:'请输入要查找的内容'
		});
		
        });
        
        
       
    </script>
</head>
<body>


<!-- 搜索 -->
<div style="padding-top: 10px;padding-bottom: 10px">

<input id="ss"></input>
<div id="mm" style="width:120px">
    <div data-options="name:'all',iconCls:'icon-ok'">全部</div>
    <div data-options="name:'userName'">姓名</div>
    <div data-options="name:'mobile'">手机号码</div>
    <div data-options="name:'demands'">咨询项目</div>
</div>
</div>

 <table id="dg" style="overflow:hidden;"></table>


</body>
</html>