<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-资源管理</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script type="text/javascript" src="../../js/admin/rmgrbase.js"></script>
    <style type="text/css">
        .ftitle {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .fitem {
            margin-bottom: 5px;
        }

        .fitem label {
            display: inline-block;
            width: 80px;
        }
        #treeMenu .tree-title a {
            text-decoration: none;
            color: #000;
        }

        #treeMenu .tree-title a:hover {
            color: yellow;
            font-weight: bold;
        }
    </style>
    <rapid:block name="head"/>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<div class="easyui-accordion" data-options="region:'west',split:true" title="系统管理" style="width:240px;">
    <div title="资源管理" id="treeMenu" iconCls="icon-cd_magnify">
            <div id="categoryTreeTbr">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" title="增加资源库" plain="true"
                   onclick="addCategory()">增加</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" title="删除资源库" plain="true" onclick="removeCategory()">删除</a>
                <a href="./createresource.jsp" class="easyui-linkbutton" iconCls="icon-folder_up" title="上传"
                   plain="true">上传</a>
            </div>

            <ul class="easyui-tree" url="/bcms/proxy?url=resourcelibrary/&method=GET" id="categoryTree" toolbar="#categoryTreeTbr">
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
<div id="addCategoryDlg" class="easyui-dialog" title="添加类库" data-options="iconCls:'icon-save'"
     style="width:400px;height:250px" closed="true">
    <form>
        <input type="hidden" id="parentCategoryId" value="">
        <table class="table">
            <tr>
                <td>类库名称:</td>
                <td><input class="easyui-textbox" required="true" type="text" name="name" id="name13"/></td>
            </tr>
            <tr>
                <td>类库元数据标准:</td>
                <td>
                    <input url="/bcms/proxy?method=GET&url=metalibrary/page/1" class="easyui-combobox"
                            data-options="method:'get',required:true" id="metatypetree"/>
                </td>
            </tr>
            <tr>
                <td>描述</td>
                <td>
                    <input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"
                           id="description13"/>
                </td>
            </tr>
        </table>
    </form>
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
                           data-options="url:'/bcms/categoryTree',method:'get',required:true"
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

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>
</body>
</html>
