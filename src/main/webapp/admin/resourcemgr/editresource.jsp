<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">创建资源</rapid:override>
<rapid:override name="head">
    <link type="text/css" rel="stylesheet" href="../../js/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <script type="text/javascript" src="../../js/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
    <script>
        var resourceId = <%=request.getParameter("id")%>;
        alert(resourceId);
    </script>
    <script type="text/javascript" src="../../js/admin/resourcemgr/editresource.js"></script>
</rapid:override>
<rapid:override name="mainName">操作日志</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <form id="createResourceForm">
        <table class="table">
            <tr>
                <td class="col-md-2"><label>资源名:</label></td>
                <td class="col-md-10"><input id="name10" type="text" class="easyui-textbox" required="true"/></td>
            </tr>
            <tr>
                <td><label>类型:</label></td>
                <td>
                    <select id="kind10" class="easyui-combobox" editable="false">
                        <option value="0">普通</option>
                        <option value="1">课程</option>
                        <option value="2">课时</option>
                        <option value="3">素材</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>资源库</label></td>
                <td><select id="resourceTree" url="/bcms/proxy?url=resourcelibrary/&method=GET" class="easyui-combotree"
                            data-options="method:'POST',required:true"
                            style="width:200px;"></select></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center;padding:10px;">
                    <a class="easyui-linkbutton" onclick="submitForm()">提交</a>
                </td>
            </tr>
        </table>
    </form>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/rmgr-base.jsp" %>

