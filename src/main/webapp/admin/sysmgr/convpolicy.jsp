<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">转码策略管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
</rapid:override>
<rapid:override name="mainName">转码策略管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'转码策略管理'" iconCls="icon-cdr_go">
  <div id="container">
    <table class="easyui-datagrid" title="转码策略"
           data-options="rownumbers:true,singleSelect:true,toolbar:'#tb'">
      <thead>
      <tr>
        <th data-options="field:'itemid',width:'20%'">策略名称</th>
        <th data-options="field:'productid',width:'20%'">类型</th>
        <th data-options="field:'listprice',width:'10%',align:'right'">分辨率</th>
        <th data-options="field:'unitcost',width:'10%',align:'right'">视频码率</th>
        <th data-options="field:'attr1',width:'10%'">音频码率</th>
        <th data-options="field:'status',width:'10%',align:'center'">状态</th>
        <th data-options="field:'oper',width:'15%',align:'center'">操作</th>
      </tr>
      </thead>
      <tbody>
         <tr>
           <td>高清</td>
           <td>视频策略</td>
           <td>1280x720</td>
           <td>5Mbs</td>
           <td>128k</td>
           <td>启用</td>
           <td><a>禁用</a>&nbsp;&nbsp;<a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
         </tr>
         <tr>
           <td>超清</td>
           <td>视频策略</td>
           <td>1920x1080</td>
           <td>10Mbs</td>
           <td>320k</td>
           <td>启用</td>
           <td><a>禁用</a>&nbsp;&nbsp;<a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
         </tr>
         <tr>
           <td>标清</td>
           <td>视频策略</td>
           <td>720x560</td>
           <td>3Mbs</td>
           <td>64k</td>
           <td>禁用</td>
           <td><a>启用</a>&nbsp;&nbsp;<a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
         </tr>
         <tr>
           <td>通用音频</td>
           <td>音频策略</td>
           <td>-</td>
           <td>-</td>
           <td>64k</td>
           <td>启用</td>
           <td><a>禁用</a>&nbsp;&nbsp;<a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
         </tr>
      </tbody>
    </table>
    <div id="tb" style="height:auto">
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="$('#add_media_policy_dlg').dialog('open')">添加视频策略</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="$('#add_audio_policy_dlg').dialog('open')">添加音频策略</a>
    </div>
  </div>
</div>


<div id="add_media_policy_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_media_policy_dlg_buttons">
  <div class="ftitle">
    添加策略
  </div>
  <form id="add_user_form" method="post">
    <div class="fitem">
      <label>
        策略名称
      </label>
      <input class="easyui-textbox" >
    </div>
    <div class="fitem">
      <label>
        分辨率
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">320x240</option>
        <option value="AK">400x240</option>
        <option value="AZ">480x320</option>
        <option value="AR">480x272</option>
        <option value="CA">480x360</option>
        <option value="CO">720x480</option>
        <option value="CT">720x576</option>
        <option value="DE">1280x720</option>
        <option value="FL">1920x1080</option>
      </select>
    </div>
    <div class="fitem">
      <label>
        视频码率
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">256kb/s</option>
        <option value="AK">384kb/s</option>
        <option value="AZ">512kb/s</option>
        <option value="AR">768kb/s</option>
        <option value="CA">1024kb/s</option>
        <option value="CO">1200kb/s</option>
        <option value="CT">1600kb/s</option>
        <option value="2400">2400kb/s</option>
        <option value="5000">5000kb/s</option>
        <option value="10000">10000kb/s</option>
        <option value="16000">16000kb/s</option>
      </select>
    </div>
    <div class="fitem">
      <label>
        音频码率
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">24kb/s</option>
        <option value="AK">32kb/s</option>
        <option value="AZ">64kb/s</option>
        <option value="AR">96kb/s</option>
        <option value="CA">128kb/s</option>
        <option value="CO">192kb/s</option>
        <option value="CT">224kb/s</option>
        <option value="DE">256kb/s</option>
        <option value="FL">320kb/s</option>
      </select>
    </div>
    <div class="fitem">
      <label>
        状态
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">启用</option>
        <option value="AK">禁用</option>
      </select>
    </div>

    <div id="add_media_policy_dlg_buttons">
      <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_media_policy_dlg').dialog('close')" iconcls="icon-save">保存</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_media_policy_dlg').dialog('close')"
         iconcls="icon-cancel">取消</a>
    </div>
  </form>
</div>

<div id="add_audio_policy_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_audio_policy_dlg_buttons">
  <div class="ftitle">
    添加策略
  </div>
  <form id="add_audio_policy_form" method="post">
    <div class="fitem">
      <label>
        策略名称
      </label>
      <input class="easyui-textbox" >
    </div>
    <div class="fitem">
      <label>
        音频码率
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">24kb/s</option>
        <option value="AK">32kb/s</option>
        <option value="AZ">64kb/s</option>
        <option value="AR">96kb/s</option>
        <option value="CA">128kb/s</option>
        <option value="CO">192kb/s</option>
        <option value="CT">224kb/s</option>
        <option value="DE">256kb/s</option>
        <option value="FL">320kb/s</option>
      </select>
    </div>
    <div class="fitem">
      <label>
        状态
      </label>
      <select class="easyui-combobox" name="state" style="width:200px;">
        <option value="AL">启用</option>
        <option value="AK">禁用</option>
      </select>
    </div>

    <div id="add_audio_policy_dlg_buttons">
      <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_audio_policy_dlg').dialog('close')" iconcls="icon-save">保存</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_audio_policy_dlg').dialog('close')"
         iconcls="icon-cancel">取消</a>
    </div>
  </form>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>