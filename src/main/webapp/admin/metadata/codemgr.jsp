<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">编码管理</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/codemgr.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">编码管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
        <div id="tbr" style="height:30px;line-height:30px;">
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddEncodeTypeDlg()">增加编码分类</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddEncodeItemDlg()">增加编码项</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="delEncode();">删除</a>
            <select class="easyui-combobox" editable="false" id="searchCondition">
                <option>按名称</option>
                <option>按编码</option>
            </select>
            <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                          iconCls="icon-search">搜索</a>

        </div>
        <table toolbar="#tbr" id="metaGrid" class="easyui-treegrid"
               data-options="singleSelect:true,collapsible:true,url:'/bcms/proxy?url=encode&method=GET&parent_id=0',method:'post'"
               rownumbers="true"
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
    <div id="addEncodeTypeDlg" title="增加编码分类" class="easyui-dialog" closed="true"
         style="width:300px;height:200px;padding:10px;">
        <form id="addEncodeTypeForm">
            <table class="table">
                <tr>
                    <td><label>名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="name1" required="true"></td>
                </tr>
                <tr>
                    <td><label>编码</label></td>
                    <td><input type="text" class="easyui-textbox" id="code1" required="true"></td>
                </tr>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="submitAddEncodeType()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#addEncodeTypeDlg').dialog('close');">取消</a>
        </form>
    </div>


    <div id="addEncodeItemDlg" title="增加编码项" class="easyui-dialog" closed="true"
         style="width:300px;height:150px;padding:10px;">
        <form>
            <table>
                <tr>
                    <td><label>属性值:</label></td>
                    <td><input type="text" id="name2" required="true" class="easyui-textbox"></td>
                </tr>
                <tr>
                    <td><label>编码</label></td>
                    <td><input type="text" id="code2" required="true" class="easyui-textbox"></td>
                </tr>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="submitAddEncodeItem()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#addEncodeItemDlg').dialog('close');">取消</a>
        </form>
    </div>

    <div id="editEncodeDlg" title="编辑" class="easyui-dialog" closed="true"
         style="width:300px;height:auto;padding:10px;">
        <form>
            <table>
                <tr>
                    <td><label>属性值:</label></td>
                    <td>
                        <input type="hidden" id="id3">
                        <input type="hidden" id="parent_id3">
                        <input type="text" id="name3" required="true" class="easyui-textbox"></td>
                </tr>
                <tr>
                    <td><label>编码</label></td>
                    <td><input type="text" id="code3" required="true" class="easyui-textbox"></td>
                </tr>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="submitModifyEncodeItem();">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#addEncodeItemDlg').dialog('close');">取消</a>
        </form>
    </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
