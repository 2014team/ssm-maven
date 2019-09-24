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
    
        var url;
        function searchUser() {
            $("#dg").datagrid('load', 
            {
                "userName": $("#s_userName").val(),
                "mobile": $("#s_mobile").val(),
                "demands": $("#s_demands").val()
            });
        }

        function deleteUser() {
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
                    $.post("${pageContext.request.contextPath}/user/delete.do", {
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

        function openUserAddDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
            url = "${pageContext.request.contextPath}/user/save.do";
        }

        function saveUser() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    $.messager.alert("系统提示", "保存成功");
                    resetValue();
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                }
            });
        }

        function openUserModifyDialog() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length != 1) {
                $.messager.alert("系统提示", "请选择一条要编辑的数据！");
                return;
            }
            var row = selectedRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
            $('#fm').form('load', row);
            $("#password").val("******");
            url = "${pageContext.request.contextPath}/user/save.do?id=" + row.id;
        }

        function resetValue() {
            $("#userName").val("");
            $("#mobile").val("");
        }

        function closeUserDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }
    </script>
</head>
<body style="margin:1px;">
<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"
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
        <th field="createDate" width="100" formatter="Common.DateFormatter">创建时间</th>
        <th field="updateDate" width="100" align="center" formatter="Common.DateFormatter">更新时间</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        &nbsp;姓名：&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/> 
        &nbsp;手机号码：&nbsp;<input type="text" id="s_mobile" size="20" onkeydown="if(event.keyCode==13) searchUser()"/> 
        &nbsp;咨询项目：&nbsp;<input type="text" id="s_demands" size="20" onkeydown="if(event.keyCode==13) searchUser()"/> 
        <a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
    </div>
    
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 620px;height:250px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>姓名：</td>
                <td><input type="text" id="userName" name="userName"
                           class="easyui-validatebox" required="true"/>&nbsp;
                           <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>咨询项目：</td>
                <td><input type="text" id="demands" name="demands"
                           class="easyui-validatebox" required="true"/>&nbsp;<font
                        color="red">*</font>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>