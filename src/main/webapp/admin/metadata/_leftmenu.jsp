<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-options="region:'west',split:true" title="元数据管理" style="width:240px;">
    <div style="padding:5px;background:#fafafa;width:220px;border:1px solid #ccc">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addMetaLib()">添加</a>
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
    </div>
    <ul id="metadata_tree"></ul>
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
