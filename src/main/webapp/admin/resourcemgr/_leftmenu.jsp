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
<div data-options="region:'west',split:true" title="系统菜单" style="width:200px;" iconCls="icon-application_side_boxes">
    <div class="easyui-accordion" style="width:100%;" id="treeMenu">
        <div title="资源管理" style="overflow:auto;padding:5px;padding-top:0px;" iconCls="icon-cd_magnify">
            <div id="categoryTreeTbr">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" title="增加资源库" plain="true"
                   onclick="addCategory()">增加</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" title="删除资源库" plain="true">删除</a>
                <a href="./createresource.jsp" class="easyui-linkbutton" iconCls="icon-folder_up" title="上传"
                   plain="true">上传</a>
            </div>

            <ul class="easyui-tree" url="./lefttree.json" id="categoryTree" toolbar="#categoryTreeTbr">
            </ul>

        </div>
        <div iconCls="icon-script" title="资源日志">
            <ul class="easyui-tree">
                <li><span><a href="roplog.jsp">操作日志</a></span></li>
            </ul>
        </div>
       <%-- <div iconCls="icon-folder" title="文件管理">
            <ul class="easyui-tree">
                <li iconCls="icon-databases"><span><a href="filelist.jsp">所有文件</a></span></li>
                <li iconCls="icon-star"><span><a href="myfilelist.jsp">我的文件</a></span></li>
            </ul>
        </div>--%>
    </div>
</div>
<div id="addCategoryDlg" class="easyui-dialog" title="添加类库" data-options="iconCls:'icon-save'"
     style="width:400px;height:300px;padding:10px" closed="true">
    <form>
        <table class="table">
            <tr>
                <td>类库名称:</td>
                <td><input class="easyui-textbox" required="true" type="text" name="name"/></td>
            </tr>
            <tr>
                <td>类库元数据标准:</td>
                <td>
                    <input class="easyui-combotree"
                           data-options="url:'../metadata/lefttree.json',method:'get',required:true"
                           style="width:200px;"/>
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
                    <input class="easyui-combotree"
                           data-options="url:'../metadata/lefttree.json',method:'get',required:true"
                           style="width:200px;"/>
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