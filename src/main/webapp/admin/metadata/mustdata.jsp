<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">必选字段</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/mustdata.js" type="text/javascript"></script>
    <style type="text/css">
        #add_must_form #modify_must_form {
            margin: 0;
            padding: 10px 30px;
        }

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
</rapid:override>
<rapid:override name="mainName">必选字段</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center'" title="必选数据">
    <div id="container">
        <div id="mustdata_table"></div>
    </div>
</div>

<div id="add_must_dlg" class="easyui-dialog" style="width: 400px; height: 420px; padding: 10px 20px;"
     closed="true" buttons="#add_must_dlg_buttons">
    <div class="ftitle">
        添加必选数据
    </div>
    <form id="add_must_form" method="post">
        <div class="fitem">
            <label>
                编号
            </label>
            <input name="name" class="easyui-validatebox" type="text"/>
        </div>
        <div class="fitem">
            <label>
                中文名称</label>
            <input class="easyui-validatebox" name="roles" type="text"/>
        </div>
        <div class="fitem">
            <label>
                英文名称</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                解释</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                数据类型</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                值域</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                取值数</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                顺序</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                举例</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                LOM编号</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                备注</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
    </form>
</div>
<div id="add_must_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_must_dlg').dialog('close');"
       iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_must_dlg').dialog('close');"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_must_dlg" class="easyui-dialog" style="width: 400px; height: 420px; padding: 10px 20px;"
     closed="true" buttons="#modify_must_dlg_buttons">
    <div class="ftitle">
        修改必选数据
    </div>
    <form id="modify_must_form" method="post">
        <div class="fitem">
            <label>
                编号
            </label>
            <input name="name" class="easyui-validatebox" type="text"/>
        </div>
        <div class="fitem">
            <label>
                中文名称</label>
            <input class="easyui-validatebox" name="roles" type="text" value="通用"/>
        </div>
        <div class="fitem">
            <label>
                英文名称</label>
            <input class="easyui-validatebox" name="par" type="text" value="General"/>
        </div>
        <div class="fitem">
            <label>
                解释</label>
            <input class="easyui-validatebox" name="par" type="text" value="该类别描述了教育资源的一些通用信息"/>
        </div>
        <div class="fitem">
            <label>
                数据类型：</label>
            <select class="easyui-combobox">
                <option value="langstring">多语言字符串</option>
                <option value="language">语种</option>
                <option value="string">字符串</option>
                <option value="number">数值</option>
                <option value="vocabulary">词汇表</option>
                <option value="source">来源</option>
                <option value="value">值</option>
                <option value="structure">结构类型</option>
                <option value="date">时间</option>
            </select>
        </div>
        <div class="fitem">
            <label>
                值域</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                取值数</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                顺序</label>
            <input class="easyui-validatebox" name="par" type="text" value="否"/>
        </div>
        <div class="fitem">
            <label>
                举例</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
        <div class="fitem">
            <label>
                LOM编号</label>
            <input class="easyui-validatebox" name="par" type="text" value="1"/>
        </div>
        <div class="fitem">
            <label>
                备注</label>
            <input class="easyui-validatebox" name="par" type="text"/>
        </div>
    </form>
</div>
<div id="modify_must_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_must_dlg').dialog('close');"
       iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_must_dlg').dialog('close');"
       iconcls="icon-cancel">取消</a>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
