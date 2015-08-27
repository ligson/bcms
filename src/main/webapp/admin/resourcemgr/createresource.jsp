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
    <link type="text/css" rel="stylesheet" href="../../js/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <script type="text/javascript" src="../../js/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'创建资源'" iconCls="icon-page_world">
    <div id="container" style="padding:10px;">
        <form>
            <table class="table">
                <tr>
                    <td class="col-md-2"><label>资源名:</label></td>
                    <td class="col-md-10"><input type="text" class="easyui-textbox" required="true"/></td>
                </tr>
                <tr>
                    <td><label>类型:</label></td>
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
                    <td><label>资源库</label></td>
                    <td><input class="easyui-combotree" data-options="url:'./lefttree.json',method:'get',required:true"
                               style="width:200px;"/></td>
                </tr>
                <tr>
                    <td><label>父资源:</label></td>
                    <td><input class="easyui-combotree" data-options="url:'./lefttree.json',method:'get',required:true"
                               style="width:200px;"/></td>
                </tr>

                <tr>
                    <td><label>资源标签:</label></td>
                    <td><input data-role="tagsinput" style="width:200px;" placeholder="回车输入" title="输入后点击回车键添加"/></td>
                </tr>
                <tr>
                    <td><label>转码策略:</label></td>
                    <td>
                        <select id="cc" class="easyui-combobox" name="dept" style="width:200px;" editable="editable">
                            <option>默认</option>
                            <option>策略1</option>
                            <option>策略2</option>
                            <option>策略3</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>描述:</label></td>
                    <td>
                        <input type="text" class="easyui-textbox" multiline="true" style="height:50px;"/>
                    </td>
                </tr>
                <tr>
                    <td><label>文件:</label></td>
                    <td><input type="file" style="width:300px" multiple="multiple" id="fileIpt"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <ul class="list-group" id="fileList">
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;padding:10px;">
                        <a class="easyui-linkbutton" href="./editmeta.jsp">提交</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
