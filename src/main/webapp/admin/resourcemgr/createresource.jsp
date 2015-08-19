<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建资源</title>
    <jsp:include page="_header.jsp"/>
    <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'创建资源'" iconCls="icon-page_world">
    <div id="container" style="padding:10px;">
        <form>
            <table>
                <tr>
                    <td>资源名:</td>
                    <td><input type="text" class="easyui-textbox" required="true"/></td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td>
                        <select class="easyui-combobox" editable="false">
                            <option value="0">普通</option>
                            <option value="1">课程</option>
                            <option value="2">课时</option>
                            <option value="3">素材</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>资源库</td>
                    <td><input class="easyui-combotree" data-options="url:'./lefttree.json',method:'get',required:true"
                               style="width:200px;"/></td>
                </tr>
                <tr>
                    <td>父资源</td>
                    <td><input class="easyui-combotree" data-options="url:'./lefttree.json',method:'get',required:true"
                               style="width:200px;"/></td>
                </tr>

                <tr>
                    <td>资源标签</td>
                    <td><input class="easyui-textbox" style="width:200px;"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;padding:10px;">
                        <a class="easyui-linkbutton">提交</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
