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
        <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddStructureItemDlg()">选择结构类型</a>
        <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicItemDlg()">选择词汇表类型</a>
        <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddItemDlg()">增加普通类型</a>
        <a class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a>
        <select class="easyui-combobox" editable="false">
            <option>必须元素</option>
            <option>可选元素</option>
            <option>分类元素</option>
        </select>
        <select class="easyui-combobox" editable="false" id="searchCondition">
            <option>按名称</option>
            <option>按编码</option>
        </select>
        <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                      iconCls="icon-search">搜索</a>

    </div>
    <table toolbar="#tbr" id="metaGrid" class="easyui-treegrid"
           data-options="singleSelect:true,collapsible:true,url:'./metalist.json',method:'post'" rownumbers="true"
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
<div id="addMetaItemDlg" title="增加字段" class="easyui-dialog" closed="true"
     style="width:450px;">
    <form>
        <table class="table">
            <tr>
                <td><label>中文名称:</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>英文名称</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>解释:</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>LOM编号</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>编码:</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>取值数:</label></td>
                <td><input type="text" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td><label>数据类型:</label></td>
                <td>
                    <select class="easyui-combobox" id="kind1" name="kind">
                        <option value="0">多语言字符串</option>
                        <option value="1">数值</option>
                        <%--<option value="2">词汇表</option>
                        <option value="3">结构类型</option>--%>
                        <option value="4">时间</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>约束:</label></td>
                <td style="padding:10px;line-height:30px;">
                    <div>是否唯一:<input type="checkbox"></div>

                    <div>范围:<input type="text" class="easyui-textbox"></div>

                    <div>长度(start,end):<input type="text" class="easyui-textbox"></div>

                    <div>是否必备:<input type="checkbox"></div>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="addStructureItemDlg" class="easyui-dialog" title="选择结构类型" closed="true"
     style="width:250px;height:150px;padding:10px;">
    <select class="easyui-combobox" name="state" data-options="multiple:true,multiline:true"
            style="width:200px;height:50px" editable="true">
        <option>标识</option>
        <option>贡献</option>
        <option>分类路径</option>
        <option>分类单元</option>
        <option>技术要求</option>
        <option>或组合</option>
        <option>关系</option>
        <option>资源</option>
    </select>
</div>
<div id="addDicItemDlg" class="easyui-dialog" title="选择词汇表类型" closed="true"
     style="width:250px;height:150px;padding:10px;">
    <select class="easyui-combobox" name="state" data-options="multiple:true,multiline:true"
            style="width:200px;height:50px" editable="true">
        <option>学习资源类型</option>
        <option>目的</option>
        <option>环境</option>
        <option>贡献-角色</option>
        <option>技术要求-名称</option>
        <option>关系-类型</option>
    </select>
</div>
</body>
</html>
