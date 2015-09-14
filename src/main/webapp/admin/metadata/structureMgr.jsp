<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">结构类型管理</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/structureMgr.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">结构类型管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
        <div id="tbr" style="height:30px;line-height:30px;">
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddItemDlg(true)">增加结构类型</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddItemDlg(false)">增加</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="delStructure();">删除</a>
            <select class="easyui-combobox" editable="false" id="searchCondition">
                <option>按名称</option>
                <option>按编码</option>
            </select>
            <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                          iconCls="icon-search">搜索</a>

        </div>
        <!--url:'./structure.json'-->
        <table toolbar="#tbr" id="metaGrid" class="easyui-treegrid"
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
    <div id="addMetaItemDlg" title="增加结构类型" class="easyui-dialog" closed="true"
         style="width:450px;height:650px;padding:10px;">
        <form>
            <input type="hidden" name="parent_id" value="">
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" name="zh_name" id="zh_name1" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" name="en_name" id="en_name1" required="true"></td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" class="easyui-textbox" name="description" id="description1" required="true">
                    </td>
                </tr>
                <tr>
                    <td><label>LOM编号</label></td>
                    <td><input type="text" class="easyui-textbox" name="lom_id" id="lom_id1"></td>
                </tr>
                    <%--<tr>
                        <td><label>编码:</label></td>
                        <td><input type="text" class="easyui-textbox"></td>
                    </tr>--%>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" name="val_num" id="val_num1" required="true"
                               validType="number"></td>
                </tr>
                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" name="example" id="example1" required="true"></td>
                </tr>
                <tr>
                    <td><label>是否排序:</label></td>
                    <td>
                        <select required="true" class="easyui-combobox" name="is_sorted" id="is_sorted1"
                                editable="false">
                            <option value="true">是</option>
                            <option value="false">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input required="true" type="text" class="easyui-textbox" name="domain" id="domain1"></td>
                </tr>
                <tr>
                    <td><label>数据类型:</label></td>
                    <td>
                        <select required="true" class="easyui-combobox" name="kind" id="kind1">
                            <option value="0">多语言字符串</option>
                            <option value="1">数值</option>
                            <option value="2">词汇表</option>
                            <option value="3">结构类型</option>
                            <option value="4">时间</option>
                        </select>
                    </td>
                </tr>
                <tr id="vocabulary_item" style="display:none;">
                    <td><label>词汇表列表</label></td>
                    <td>
                        <input id="vocabulary_id1" class="easyui-combobox" data-options="panelHeight:'auto'">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="structureItems">

                    </td>
                </tr>
                    <%--  <tr>
                          <td><label>约束:</label></td>
                          <td style="padding:10px;line-height:30px;">
                              <div>是否唯一:<input type="checkbox"></div>

                              <div>范围:<input type="text" class="easyui-textbox"></div>

                              <div>长度(start,end):<input type="text" class="easyui-textbox"></div>

                              <div>是否必备:<input type="checkbox"></div>
                          </td>
                      </tr>--%>
            </table>
            <a class="easyui-linkbutton" plain="false" onclick="submitStructureForm()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#addMetaItemDlg').dialog('close')">取消</a>
        </form>
    </div>
    <div id="editMetaItemDlg" title="编辑结构类型" class="easyui-dialog" closed="true"
         style="width:450px;height:450px;padding:10px;">
        <form>
            <input type="hidden" name="id" value="" id="id2">
            <table>
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" name="zh_name" id="zh_name2"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" name="en_name" id="en_name2"></td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" class="easyui-textbox" name="description" id="description2"></td>
                </tr>
                <tr>
                    <td><label>LOM编号</label></td>
                    <td><input type="text" class="easyui-textbox" name="lom_id" id="lom_id2"></td>
                </tr>
                    <%--<tr>
                        <td><label>编码:</label></td>
                        <td><input type="text" class="easyui-textbox"></td>
                    </tr>--%>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" name="val_num" id="val_num2"></td>
                </tr>
                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" name="example" id="example2"></td>
                </tr>
                <tr>
                    <td><label>是否排序:</label></td>
                    <td>
                        <select class="easyui-combobox" name="is_sorted" id="is_sorted2" editable="false">
                            <option value="true">是</option>
                            <option value="false">否</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" name="domain" id="domain2"></td>
                </tr>
                <tr>
                    <td><label>数据类型:</label></td>
                    <td>
                        <select class="easyui-combobox" name="kind" id="kind2">
                            <option value="0">多语言字符串</option>
                                <%--<option value="string">字符串</option>--%>
                            <option value="1">数值</option>
                            <option value="2">词汇表</option>
                            <option value="3">结构类型</option>
                            <option value="4">时间</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="structureItems2">

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
            <a class="easyui-linkbutton" plain="false" onclick="submitModifyStructureForm()">提交</a>
            <a class="easyui-linkbutton" plain="false" onclick="$('#editMetaItemDlg').dialog('close')">取消</a>
        </form>
    </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
