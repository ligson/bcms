<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">元数据管理</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/metadataMgr.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">元数据管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div data-options="region:'center',title:'字段列表'" iconCls="icon-page_world">
        <div id="tbr" style="height:30px;line-height:30px;">
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddStructureItemDlg()">选择结构类型</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddDicItemDlg()">选择词汇表类型</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="showAddItemDlg()">增加普通类型</a>
            <a class="easyui-linkbutton" plain="true" iconCls="icon-remove" onclick="deleteMetaItem()">删除</a>
            <select class="easyui-combobox" editable="false">
                <option>必须元素</option>
                <option>可选元素</option>
                <option>分类元素</option>
            </select>
            <select class="easyui-combobox" editable="false" id="searchCondition">
                <option>按名称</option>
                <option>按编码</option>
            </select>
            <input type="text" class="easyui-textbox"/><a class="easyui-linkbutton" plain="true"
                                                          iconCls="icon-search">搜索</a>

        </div>
        <table toolbar="#tbr" id="metaGrid" class="easyui-treegrid"
               data-options="singleSelect:true,collapsible:true,url:'./metalist.json',method:'post'" rownumbers="true"
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
    <div id="addMetaItemDlg" title="增加字段" class="easyui-dialog" closed="true"
         style="width:450px;">
        <form>
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name11" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name11" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id11"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num11" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example11" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted11" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>数据类型:</label></td>
                    <td>
                        <select class="easyui-combobox" name="kind" id="kind11" required="true">
                            <option value="0">多语言字符串</option>
                            <option value="1">数值</option>
                            <option value="4">时间</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection11" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description11" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain11"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="addStructureItemDlg" class="easyui-dialog" title="选择结构类型" closed="true"
         style="width:400px;height:600px;padding:10px;">
        <form>
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name14" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name14" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id14"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num14" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example14" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted14" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>结构类型:</label></td>
                    <td>
                        <select style="width:150px;" class="easyui-combobox" name="kind" id="structure_type_id14"
                                required="true" editable="false">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection14" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description14" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain14"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="addDicItemDlg" class="easyui-dialog" title="添加词汇表类型" closed="true"
         style="width:400px;height:600px;padding:10px;">
        <form>
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name12" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name12" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id12"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num12" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example12" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted12" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>词汇表类型:</label></td>
                    <td>
                        <select style="width:150px;" class="easyui-combobox" name="kind" id="vocabulary_type_id12"
                                required="true">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection12" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description12" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain12"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="editMetaItemDlg" title="编辑字段" class="easyui-dialog" closed="true"
         style="width:450px;">
        <form>
            <input type="hidden" name="metaTypeId" value=""/>
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name21" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name21" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id21"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num21" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example21" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted21" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>数据类型:</label></td>
                    <td>
                        <select class="easyui-combobox" name="kind" id="kind21" required="true">
                            <option value="0">多语言字符串</option>
                            <option value="1">数值</option>
                            <option value="4">时间</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection21" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description21" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain21"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="editDicItemDlg" class="easyui-dialog" title="编辑词汇表类型" closed="true"
         style="width:400px;height:600px;padding:10px;">
        <form>
            <input type="hidden" name="metaTypeId" value="">
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name22" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name22" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id22"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num22" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example22" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted22" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>词汇表类型:</label></td>
                    <td>
                        <select style="width:150px;" class="easyui-combobox" name="kind" id="vocabulary_type_id22"
                                required="true">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection22" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description22" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain22"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editStructureItemDlg" class="easyui-dialog" title="编辑结构类型" closed="true"
         style="width:400px;height:600px;padding:10px;">
        <form>
            <input type="hidden" name="metaTypeId" value="">
            <table class="table">
                <tr>
                    <td><label>中文名称:</label></td>
                    <td><input type="text" class="easyui-textbox" id="zh_name24" required="true"></td>
                </tr>
                <tr>
                    <td><label>英文名称</label></td>
                    <td><input type="text" class="easyui-textbox" id="en_name24" required="true"></td>
                </tr>
                <tr>
                    <td><label>LOM编号:</label></td>
                    <td><input type="text" class="easyui-textbox" id="lom_id24"></td>
                </tr>
                <tr>
                    <td><label>取值数:</label></td>
                    <td><input type="text" class="easyui-textbox" id="val_num24" required="true" validType="number">
                    </td>
                </tr>


                <tr>
                    <td><label>举例:</label></td>
                    <td><input type="text" class="easyui-textbox" id="example24" required="true"></td>
                </tr>
                <tr>
                    <td><label>顺序:</label></td>
                    <td>
                        <select class="easyui-combobox" id="is_sorted24" required="true">
                            <option value="true">true</option>
                            <option value="false">false</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>结构类型:</label></td>
                    <td>
                        <select style="width:150px;" class="easyui-combobox" name="kind" id="structure_type_id24"
                                required="true" editable="false">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>类别:</label></td>
                    <td>
                        <select class="easyui-combobox" id="collection24" required="true">
                            <option value="0">必选数据</option>
                            <option value="1">通用可选数据</option>
                            <option value="2">分类数据</option>
                            <option value="3">结构类型</option>
                            <option value="4">自定义类型</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label>解释:</label></td>
                    <td><input type="text" multiple="true" style="height:50px;" class="easyui-textbox"
                               id="description24" required="true"></td>
                </tr>
                <tr>
                    <td><label>值域:</label></td>
                    <td><input type="text" class="easyui-textbox" style="height:50px;" multiple="true" id="domain24"
                               required="true"></td>
                </tr>
            </table>
        </form>
    </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
