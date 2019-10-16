<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>留言列表</title>
   <!--easyui js与cess导入  -->
    <%@include file="/views/admin/common/easyui.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/dateUtil.js"></script>
   
    <script type="text/javascript">
        $(function(){
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
        
        
        function delMessage() {
	            var selectedRows = $("#dg").datagrid('getSelections');
	            if (selectedRows.length == 0) {
	                $.messager.alert("系统提示", "请选择要删除的数据！");
	                return;
	            }
	            var strIds = [];
	            for (var i = 0; i < selectedRows.length; i++) {
	                strIds.push(selectedRows[i].id);
	            }
	            var ids = strIds.join(",");
	            $.messager.confirm("系统提示", "您确认要删除这<font color=red>"
	                    + selectedRows.length + "</font>条数据吗？", function (r) {
	                if (r) {
	                    $.post("${pageContext.request.contextPath}/admin/message/del.do", {
	                        ids: ids
	                    }, function (result) {
	                        if (result.success) {
	                            $.messager.alert("系统提示", "数据已成功删除！");
	                            $("#dg").datagrid("reload");
	                        } else {
	                            $.messager.alert("系统提示", "数据删除失败！");
	                        }
	                    }, "json");
	                }
	            });

        }
        
    </script>

</head>
<body>


<!-- 搜索 -->
<div id="tb" style="padding-top: 10px;padding-bottom: 10px;">
	<div style="float: left;"> 
			<a
            href="javascript:delMessage()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
	<div>
		<input id="ss"></input>
		<div id="mm" style="width:120px">
		    <div data-options="name:'all',iconCls:'icon-ok'">全部</div>
		    <div data-options="name:'userName'">姓名</div>
		    <div data-options="name:'mobile'">手机号码</div>
		    <div data-options="name:'demands'">咨询项目</div>
		</div>
		
	</div>
	

	
	
</div>

<table id="dg" title="留言列表" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/admin/message/list.do" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="50" align="center">编号</th>
        <th field="userName" width="100" align="center">姓名</th>
        <th field="mobile" width="100" align="center">手机号码</th>
        <th field="demands" width="100" align="center">咨询项目</th>
        <th field="createDate" width="100" align="center"  formatter=Common.DateFormatter>创建日期</th>
        <th field="updateDate" width="100" align="center" formatter=Common.DateFormatter>更新日期</th>
    </tr>
    </thead>
</table>

</body>
</html>