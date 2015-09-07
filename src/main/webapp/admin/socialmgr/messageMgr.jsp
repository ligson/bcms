<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">站内消息管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/social/messagemgr.js"></script>
  <script type="text/javascript" src="../../js/ckeditor/ckeditor.js"></script>
</rapid:override>
<rapid:override name="mainName">站内消息管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'站内消息管理'">
  <div id="container">
    <table id="dg" class="easyui-datagrid"
           pagination="true" toolbar="#toolbar"
           rownumbers="true" fitColumns="true" singleSelect="true">
      <thead>
      <tr>
        <th field="firstname" width="10%">名称</th>
        <th field="lastname" width="50%">内容</th>
        <th field="email" width="10%">发送时间</th>
        <th field="playDate" width="5%">接收对象</th>
        <th field="statu" width="5%">发送人</th>
        <th field="messageId" width="5%">回复消息</th>
        <th field="_opear" width="10%">操作</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>关于五一放假的通知</td>
        <td>2015年五一劳动节放假安排已经出台，具体安排如下</td>
        <td>2015-08-28</td>
        <td>张三</td>
        <td>李四</td>
        <td>-</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      </tbody>
    </table>
    <div id="toolbar">
      <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#add_message_dlg').dialog('open')">添加</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    </div>
  </div>
  </div>
</div>

<div id="add_message_dlg" class="easyui-dialog" style="width:700px;height:630px;padding:10px 20px"
     closed="true" buttons="#add_message_dlg-buttons">
  <div class="ftitle">添加站内消息</div>
  <form id="fm" method="post" novalidate>
    <div class="fitem">
      <label>标题</label>
      <input name="firstname" class="easyui-textbox" required="true">
    </div>
    <div class="fitem">
      <label>接收对象</label>
      <div id="cc"  class="easyui-layout" style="width:630px;height:300px;">
        <div data-options="region:'west',title:'部门',split:true" style="width:210px;">
          <div id="department_tree"></div>
        </div>
        <div data-options="region:'center',title:'待选用户'" style="padding:5px;">
          <ul id="user_list" class="easyui-datalist">
          </ul>
        </div>
        <div data-options="region:'east',title:'已选用户',split:true" style="width:210px;">
          <ul id="select_user_list" class="easyui-datalist">

          </ul>
        </div>
      </div>
    </div>
    <div class="fitem">
      <label>内容</label>
      <input name="content" class="easyui-validatebox" required="true" type="text" />
      <script type="text/javascript">CKEDITOR.replace('content');</script>
    </div>
  </form>
</div>
<div id="add_message_dlg-buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="javascript:$('#add_message_dlg').dialog('close')" style="width:90px">发送</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add_message_dlg').dialog('close')" style="width:90px">取消</a>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>