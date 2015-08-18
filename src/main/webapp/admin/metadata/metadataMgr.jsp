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
    <title>元数据管理</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/metadata/metadataMgr.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
    <div id="tbr" style="height:30px;line-height:30px;">
        <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddItemDlg()">增加</a>
        <a class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a>
    </div>
    <table toolbar="#tbr" id="metaGrid" class="easyui-treegrid"
           data-options="singleSelect:true,collapsible:true,url:'./metalist.json',method:'post'" rownumbers="true"
           pagination="true">
    </table>
</div>
<div id="selectItemDlg" title="选择字段" class="easyui-dialog" closed="true"
     style="width:450px;height:400px;padding:10px;">
    <ul id="metadata_tree" class="easyui-tree" url="./lefttree.json"></ul>
</div>
<div id="addMetaItemDlg" title="增加字段" class="easyui-dialog" closed="true"
     style="width:450px;height:400px;padding:10px;">
    <form>
        <table>
            <tr>
                <td>中文名称</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>英文名称</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>解释</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>LOM编号</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>编码</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>取值数</td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>字段类型</td>
                <td>
                    <select class="easyui-combobox" id="itemDateTypeSlt">
                        <option value="langstring">多语言字符串</option>
                        <option value="string">字符串</option>
                        <option value="number">数值</option>
                        <option value="vocabulary">词汇表</option>
                        <option value="structure">结构类型</option>
                        <option value="date">时间</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>约束</td>
                <td style="padding:10px;line-height:30px;">
                    <div>是否唯一:<input type="checkbox"></div>

                    <div>范围:<input type="text" class="easyui-textbox"></div>

                    <div>长度(start,end):<input type="text" class="easyui-textbox"></div>

                    <div>是否必备:<input type="checkbox"></div>
                </td>
            </tr>
        </table>
        <a class="easyui-linkbutton" plain="false" onclick="showAddItemDlg()">提交</a>
        <a class="easyui-linkbutton" plain="false">取消</a>
    </form>
</div>
</body>
</html>
