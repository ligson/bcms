<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-元数据管理</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script src="../../js/admin/metadata/left_tree.js" type="text/javascript"></script>
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
    </style>
    <rapid:block name="head"/>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<div class="easyui-accordion" data-options="region:'west',split:true" title="元数据管理" style="width:240px;">
    <div title="元数据">
        <div id="metatreebar">
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-application_add"
               onclick="addMetaCategory()">分类</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="addMetaLib()">标准</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-20130408025545236_easyicon_net_30"
               onclick="delMeta();">删除</a>
            <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-edit"
               onclick="editMeta();">编辑</a>
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
<div id="addMetaLibDlg" class="easyui-dialog" title="添加元数据标准" style="width:300px;height:280px;" closed="true">
    <form>
        <input type="hidden" name="category_id" value="" id="categoryId10">
        <table class="table">
            <tr>
                <td><label>标准名称:</label></td>
                <td><input type="text" required="true" class="easyui-textbox" id="name10"/></td>
            </tr>
            <tr>
                <td><label>标准描述:</label></td>
                <td><input type="text" class="easyui-textbox" multiline="true" style="height:60px"
                           id="desc10"/>
                </td>
            </tr>
            <tr>
                <td><label>版本:</label></td>
                <td><input type="text" required="true" class="easyui-textbox"
                           id="version10" validType="number"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton" onclick="submitAddMetaLib()">提交</a>
                    <a class="easyui-linkbutton" onclick="$('#addMetaLibDlg').dialog('close')">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="editMetaLibDlg" class="easyui-dialog" title="编辑元数据标准" style="width:300px;height:350px;" closed="true">
    <form>
        <input type="hidden" name="category_id" value="" id="categoryId11">
        <input type="hidden" name="id11" id="id11">
        <table class="table">
            <tr>
                <td><label>标准名称:</label></td>
                <td><input type="text" required="true" class="easyui-textbox" id="name11"/></td>
            </tr>
            <tr>
                <td><label>标准描述:</label></td>
                <td><input type="text" class="easyui-textbox" multiline="true" style="height:60px"
                           id="desc11"/>
                </td>
            </tr>
            <tr>
                <td><label>版本:</label></td>
                <td><input type="text" required="true" class="easyui-textbox"
                           id="version11" validType="number"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton" onclick="submitModifyMetaLib()">提交</a>
                    <a class="easyui-linkbutton" onclick="$('#editMetaLibDlg').dialog('close')">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="addMetaCategoryDlg" class="easyui-dialog" title="添加元数据标准分类" style="width:350px;height:250px;" closed="true">
    <form>
        <input type="hidden" name="parent_id" value="">
        <table class="table">
            <tr>
                <td><label>元数据分类名称:</label></td>
                <td><input type="text" required="true" id="categoryName1" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>元数据分类描述:</label></td>
                <td><input type="text" required="true" id="categoryDesc1" class="easyui-textbox" multiline="true"
                           style="height:60px"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton" onclick="submitAddMetaCategory()">提交</a>
                    <a class="easyui-linkbutton" onclick="$('#addMetaCategoryDlg').dialog('close')">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="editMetaCategoryDlg" class="easyui-dialog" title="编辑元数据标准分类" style="width:350px;height:auto;" closed="true">
    <form>
        <input type="hidden" id="parent_id2" value="">
        <input type="hidden" id="id2" value="">
        <table class="table">
            <tr>
                <td><label>元数据分类名称:</label></td>
                <td><input type="text" required="true" id="categoryName2" class="easyui-textbox"/></td>
            </tr>
            <tr>
                <td><label>元数据分类描述:</label></td>
                <td><input type="text" required="true" id="categoryDesc2" class="easyui-textbox" multiline="true"
                           style="height:60px"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <a class="easyui-linkbutton" onclick="submitModifyMetaCategory()">提交</a>
                    <a class="easyui-linkbutton" onclick="$('#editMetaCategoryDlg').dialog('close')">取消</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>

</body>
</html>
