<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">词汇表管理</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/dicmgr.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">词汇表管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
        <div id="tbr" style="height:30px;line-height:30px;">
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicTypeDlg()">增加词汇表</a>
                <%--<a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicItemDlg()">增加词汇</a>--%>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="deleteDic()">删除</a>
            <select class="easyui-combobox" editable="false" id="searchCondition">
                <option>按名称</option>
                <option>按编码</option>
            </select>
            <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                          iconCls="icon-search">搜索</a>

        </div>
        <table toolbar="#tbr" id="metaGrid" class="easyui-datagrid"
               data-options="singleSelect:true,collapsible:true,method:'post'" rownumbers="true"
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
         style="width:400px;height:auto;padding:10px;">
        <form id="addDicForm">
            <table class="table">
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
                    <td><input type="text" class="easyui-textbox" name="words">(英文逗号(,)分隔)</td>
                </tr>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="submitDicForm()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#addDicTypeDlg').dialog('close');">取消</a>
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
            <a class="easyui-linkbutton" plain="false" onclick="$('#addDicItemDlg').dialog('close')">取消</a>
        </form>
    </div>

    <div id="editDicItemDlg" title="编辑词汇" class="easyui-dialog" closed="true"
         style="width:450px;height:350px;padding:10px;">
        <form>
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <input type="hidden" name="id">
                    <td><input type="text" class="easyui-textbox" name="zh_name" id="zh_name1"></td>
                </tr>
                <tr>
                    <td><label>英文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" name="en_name" id="en_name1"></td>
                </tr>
                <tr>
                    <td><label>LOM编码</label></td>
                    <td><input type="text" class="easyui-textbox" name="lom_id" id="lom_id1"></td>
                </tr>
                <tr>
                    <td><label>来源</label></td>
                    <td><input type="text" class="easyui-textbox" name="source" id="source1"></td>
                </tr>
                <tr>
                    <td><label>词汇</label></td>
                    <td><input type="text" class="easyui-textbox" name="words" id="words1">(英文逗号(,)分隔)</td>
                </tr>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="editDicItemForm()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#editDicItemDlg').dialog('close')">取消</a>
        </form>
    </div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
