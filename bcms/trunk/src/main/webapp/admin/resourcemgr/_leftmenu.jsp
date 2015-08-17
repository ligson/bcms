<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #treeMenu .tree-title a {
        text-decoration: none;
        color: #000;
    }

    #treeMenu .tree-title a:hover {
        color: yellow;
        font-weight: bold;
    }
</style>
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;" iconCls="icon-application_side_boxes">
    <div class="easyui-accordion" style="width:100%;" id="treeMenu">
        <div title="资源管理" style="overflow:auto;padding:5px;padding-top:0px;" iconCls="icon-cd_magnify">
            <div style="height:30px;line-height:30px;border-bottom:1px solid #95B8E7;">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" title="增加资源库" plain="true"
                   onclick="addCategory()"></a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" title="删除资源库" plain="true"></a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-folder_up" title="上传" plain="true"></a>
            </div>
            <div style="margin-top:5px;">
                <ul class="easyui-tree" url="./lefttree.json" id="categoryTree">
                </ul>
            </div>
        </div>

    </div>
</div>
<div id="addCategoryDlg" class="easyui-dialog" title="添加类库" data-options="iconCls:'icon-save'"
     style="width:300px;height:250px;padding:10px" closed="true">
    <form>
        <table>
            <tr>
                <td>类库名称:</td>
                <td><input class="easyui-textbox" required="true" type="text" name="name"/></td>
            </tr>
            <tr>
                <td>类库元数据标准:</td>
                <td>
                    <select class="easyui-combobox" name="language">
                        <option value="celts">celts标准</option>
                        <option value="china">国家标准</option>
                        <option value="school">学校标准</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>描述</td>
                <td>
                    <input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"/>
                </td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取消</a>
    </div>
</div>

<div id="editCategoryDlg" class="easyui-dialog" title="编辑类库" data-options="iconCls:'icon-save'"
     style="width:300px;height:250px;padding:10px" closed="true">
    <form>
        <table>
            <tr>
                <td>名称</td>
                <td><input class="easyui-textbox" required="true" type="text" name="name"></td>
            </tr>
            <tr>
                <td>
                    标准
                </td>
                <td>
                    <select class="easyui-combobox" name="language">
                        <option value="celts">celts标准</option>
                        <option value="china">国家标准</option>
                        <option value="school">学校标准</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>描述</td>
                <td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"/>
                </td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">取消</a>
    </div>
</div>
<div id="treeContextMenu" class="easyui-menu" style="width:120px;">
    <div onclick="append()" data-options="iconCls:'icon-add'">添加</div>
    <div onclick="removeit()" data-options="iconCls:'icon-remove'">删除</div>
    <div onclick="editCategory()" data-options="iconCls:'icon-edit'">编辑</div>
</div>