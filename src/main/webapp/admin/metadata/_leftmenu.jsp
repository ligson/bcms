<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="easyui-accordion" data-options="region:'west',split:true" title="元数据管理" style="width:240px;">
    <div title="元数据">
        <div style="padding:5px;background:#fafafa;width:220px;border:1px solid #ccc">
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addMetaLib()">添加</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        </div>
        <ul id="metadata_tree"></ul>
    </div>
    <div title="结构类型">
        <ul class="easyui-tree" id="structure_tree">
            <li><span><a href="./structureMgr.jsp">标识</a></span></li>
            <li><span><a>贡献</a></span></li>
            <li><span><a>分类路径</a></span></li>
            <li><span><a>分类单元</a></span></li>
            <li><span><a>技术要求</a></span></li>
            <li><span><a>或组合</a></span></li>
            <li><span><a>关系</a></span></li>
        </ul>
    </div>
    <div title="词汇表">
        <ul id="vocabularydata_tree" class="easyui-tree">
            <li><span><a href="./dicmgr.jsp?type=1">列表</a></span></li>
        </ul>
    </div>
    <div title="编码表">
        <ul id="encodedata_tree" class="easyui-tree">
            <li><span><a href="./codemgr.jsp?type=1">列表</a></span></li>
        </ul>
    </div>
</div>
<div id="addMetaLibDlg" class="easyui-dialog" title="添加元数据标准" style="width:300px;height:150px;" closed="true">
    <form>
        <table>
            <tr>
                <td><label>标准名称:</label></td>
                <td><input type="text" required="true" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>标准描述:</label></td>
                <td><input type="text" required="true" class="easyui-textbox" multiline="true" style="height:60px"/>
                </td>
            </tr>
        </table>
        <input type="button" class="easyui-linkbutton" value="提交"/>
        <input type="button" class="easyui-linkbutton" value="取消"/>
    </form>
</div>
