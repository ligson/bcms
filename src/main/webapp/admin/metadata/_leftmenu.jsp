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
        <div id="metatreebar">
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-application_add"
               onclick="addMetaCategory()">分类</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addMetaLib()">标准</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-20130408025545236_easyicon_net_30"
               onclick="addMetaLib()">删除</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit"
               onclick="addMetaLib()">编辑</a>
        </div>
        <ul id="metadata_tree" toolbar="#metatreebar">
        </ul>
    </div>
    <div title="结构类型">
        <ul class="easyui-tree" id="structure_tree">
            <li><span><a href="./structureMgr.jsp">列表</a></span></li>
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
<div id="addMetaLibDlg" class="easyui-dialog" title="添加元数据标准" style="width:300px;height:250px;" closed="true">
    <form>
        <table class="table">
            <tr>
                <td><label>标准名称:</label></td>
                <td><input type="text" required="true" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>标准描述:</label></td>
                <td><input type="text" required="true" class="easyui-textbox" multiline="true" style="height:60px"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton">提交</a>
                    <a class="easyui-linkbutton">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="addMetaCategoryDlg" class="easyui-dialog" title="添加元数据标准分类" style="width:350px;height:250px;" closed="true">
    <form>
        <table class="table">
            <tr>
                <td><label>元数据分类名称:</label></td>
                <td><input type="text" required="true" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>元数据分类描述:</label></td>
                <td><input type="text" required="true" class="easyui-textbox" multiline="true" style="height:60px"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton">提交</a>
                    <a class="easyui-linkbutton">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>
