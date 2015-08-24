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
    <title>词汇表管理</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/metadata/dicmgr.js" type="text/javascript"></script>
    <style type="text/css">
        #addDicForm tr td{
            padding:5px;
        }
    </style>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
    <div id="tbr" style="height:30px;line-height:30px;">
        <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicTypeDlg()">增加词汇表</a>
        <%--<a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicItemDlg()">增加词汇</a>--%>
        <a class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a>
        <select class="easyui-combobox" editable="false" id="searchCondition">
            <option>按名称</option>
            <option>按编码</option>
        </select>
        <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                      iconCls="icon-search">搜索</a>

    </div>
    <table toolbar="#tbr" id="metaGrid" class="easyui-datagrid"
           data-options="singleSelect:true,collapsible:true,url:'./dicmgr.json',method:'post'" rownumbers="true"
           pagination="true">

    </table>
</div>
<div id="ttbr">
    <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addItemToDlg()">提交</a>
    <a class="easyui-linkbutton" plain="true" iconCls="icon-remove">取消</a>

    <p></p>
</div>
<div toolbar="#ttbr" id="selectItemDlg" title="选择字段" class="easyui-dialog" closed="true"
     style="width:450px;height:400px;padding:10px;">
    <ul id="metadata_tree1" class="easyui-tree" url="./lefttree.json" checkbox="true"></ul>
</div>

<div id="addDicTypeDlg" title="增加词汇" class="easyui-dialog" closed="true"
     style="width:300px;height:250px;padding:10px;">
    <form id="addDicForm">
        <table>
            <tr>
                <td><label>中文名称:</label></td>
                <td><input type="text" class="easyui-textbox" name="zh_name"></td>
            </tr>
            <tr>
                <td><label>英文名称:</label></td>
                <td><input type="text" class="easyui-textbox" name="en_name"></td>
            </tr>
            <tr>
                <td><label>LOM编码</label></td>
                <td><input type="text" class="easyui-textbox" name="lom_id"></td>
            </tr>
            <tr>
                <td><label>来源</label></td>
                <td><input type="text" class="easyui-textbox" name="source"></td>
            </tr>
            <tr>
                <td><label>词汇</label></td>
                <td><input type="text" class="easyui-textbox" name="words"></td>
            </tr>
        </table>
        <a class="easyui-linkbutton" plain="false" onclick="submitDicForm()">提交</a>
        <a class="easyui-linkbutton" plain="false">取消</a>
    </form>
</div>


<div id="addDicItemDlg" title="增加词汇" class="easyui-dialog" closed="true"
     style="width:300px;height:150px;padding:10px;">
    <form>
        <table>
            <tr>
                <td><label>名称:</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
        </table>
        <a class="easyui-linkbutton" plain="false" onclick="showAddItemDlg()">提交</a>
        <a class="easyui-linkbutton" plain="false">取消</a>
    </form>
</div>
</body>
</html>
