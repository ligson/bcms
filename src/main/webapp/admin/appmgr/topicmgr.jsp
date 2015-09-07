<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">专题管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/topicmgr.js"></script>
</rapid:override>
<rapid:override name="mainName">专题管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div id="rGridTbr" style="height:30px;line-height:30px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addTopic()" plain="true"
       iconCls="icon-add"
       title="添加">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-ok"
       title="修改">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-remove"
       title="删除">删除</a>|<label>名称:<input type="text" class="easyui-textbox" name="name"/></label>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-search"
       title="搜索"></a>
</div>
<div data-options="region:'center',title:'专题管理'" iconCls="icon-page_world">
    <div id="container">
        <table id="rGrid" class="easyui-datagrid"
               data-options="rownumbers:true,singleSelect:true,url:'./caseliblist.json',method:'post'" pagination="true"
               toolbar="#rGridTbr">
            <thead>
            </thead>
        </table>
    </div>
</div>

<div id="add_topic_dlg" class="easyui-dialog" style="width: 700px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_topic_dlg_buttons">
    <div class="ftitle">
        添加专题
    </div>
    <form id="add_tag_form" method="post">
        <div class="fitem">
            <label>
                专题名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                状态
            </label>
            <select class="easyui-combobox" name="dept">
                <option>启用</option>
                <option>禁用</option>
            </select>
        </div>
        <div class="fitem">
            <label>
                专题海报
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="file" value="" />
        </div>
        <div class="fitem">
            <label>
                资源检索
            </label>
            <div class="easyui-layout" style="width:630px;height:300px;">
                <div data-options="region:'west',title:'资源库',split:true" style="width:210px;">
                    <div class="easyui-datalist">
                        <li value="AL">案例库</li>
                        <li value="AK">视频库</li>
                        <li value="AZ">课程中心</li>
                        <li value="AR">精品课程库</li>
                        <li value="CA">虚拟仿真库</li>
                    </div>
                </div>
                <div data-options="region:'center',title:'待选资源'" style="padding:5px;">
                    <ul class="easyui-datalist">
                        <li value="AL"><input type="checkbox">好声音.mp4</li>
                        <li value="AK"><input type="checkbox">music.mp3</li>
                        <li value="AZ"><input type="checkbox">image.png</li>
                        <li value="AR"><input type="checkbox">document.doc</li>
                    </ul>
                </div>
                <div data-options="region:'east',title:'已选资源',split:true" style="width:210px;">
                    <ul class="easyui-datalist">
                        <li value="AL">好声音.mp4</li>
                        <li value="AK">music.mp3</li>
                        <li value="AZ">image.png</li>
                        <li value="AR">document.doc</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="fitem">
            <label>
                描述
            </label>
            <input class="easyui-textbox" data-options="multiline:true" style="width:630px;height: 100px;">
        </div>
    </form>
</div>

<div id="add_topic_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_topic_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_topic_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_topic_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_topic_dlg_buttons">
    <div class="ftitle">
        编辑标签
    </div>
    <form id="modify_topic_form" method="post">
        <div class="fitem">
            <label>
                专题名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                描述
            </label>
            <input class="easyui-textbox" data-options="multiline:true" style="width:300px;height:100px">
        </div>
        <div class="fitem">
            <label>
                状态
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                专题海报
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                资源检索
            </label>
            <div id="cc"  class="easyui-layout" style="width:630px;height:300px;">
                <div data-options="region:'west',title:'资源库',split:true" style="width:210px;">
                    <div class="easyui-datalist">
                        <li value="AL">Alabama</li>
                        <li value="AK">Alaska</li>
                        <li value="AZ">Arizona</li>
                        <li value="AR">Arkansas</li>
                        <li value="CA">California</li>
                        <li value="CO">Colorado</li>
                        <li value="CT">Connecticut</li>
                        <li value="DE">Delaware</li>
                        <li value="FL">Florida</li>
                    </div>
                </div>
                <div data-options="region:'center',title:'待选用户'" style="padding:5px;">
                    <ul class="easyui-datalist">
                    </ul>
                </div>
                <div data-options="region:'east',title:'已选用户',split:true" style="width:210px;">
                    <ul id="select_user_list" class="easyui-datalist">

                    </ul>
                </div>
        </div>
            </div>
    </form>
</div>

<div id="modify_topic_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/appmgr-base.jsp" %>
