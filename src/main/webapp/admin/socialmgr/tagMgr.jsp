<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">标签管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/social/tagmgr.js"></script>
</rapid:override>
<rapid:override name="mainName">标签管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div region="center">
      <div style="padding:5px;background:#fafafa;border:1px solid #ccc">
        <input id="search_tag" style="width: 300px;align-items: center; display: none;">
          <a href="#" onclick="clickAddTag();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加标签</a>
      </div>
      <div id="tag_tree_grid"></div>

</div>

<div id="add_tag_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_tag_dlg_buttons">
    <div class="ftitle">
        添加标签
    </div>
    <form id="add_tag_form" method="post">
        <div class="fitem">
            <label>
                标签名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
            <input name="parent_id" type="hidden"/>
        </div>

    </form>
</div>
<div id="add_tag_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveTag();" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_tag_dlg').dialog('close')" iconcls="icon-cancel">取消</a>
</div>

<div id="modify_tag_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_tag_dlg_buttons">
    <div class="ftitle">
        编辑标签
    </div>
    <form id="modify_tag_form" method="post">
        <div class="fitem">
            <label>
                标签名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
            <input name="id" type="hidden"/>
            <input name="parent_id" type="hidden"/>
        </div>
    </form>
</div>
<div id="modify_tag_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyTag();" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>
