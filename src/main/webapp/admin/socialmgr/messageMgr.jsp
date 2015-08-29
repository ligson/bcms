<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>站内消息管理</title>
  <jsp:include page="_header.jsp"/>
  <style type="text/css">
    .ftitle
    {
      font-size: 14px;
      font-weight: bold;
      padding: 5px 0;
      margin-bottom: 10px;
      border-bottom: 1px solid #ccc;
    }
    .fitem
    {
      margin-bottom: 5px;
    }
    .fitem label
    {
      display: inline-block;
      width: 80px;
    }
  </style>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'站内消息管理'">
  <div id="container">
    <table id="dg" class="easyui-datagrid"
           pagination="true" toolbar="#toolbar"
           rownumbers="true" fitColumns="true" singleSelect="true">
      <thead>
      <tr>
        <th field="firstname" width="10%">名称</th>
        <th field="lastname" width="40%">内容</th>
        <th field="phone" width="10%">创建时间</th>
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
      <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="$('#add_message_dlg').dialog('open')">修改</a>
      <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    </div>
  </div>
  </div>
</div>

<div id="add_message_dlg" class="easyui-dialog" style="width:400px;height:auto;padding:10px 20px"
     closed="true" buttons="#add_message_dlg-buttons">
  <div class="ftitle">添加站内消息</div>
  <form id="fm" method="post" novalidate>
    <div class="fitem">
      <label>名称</label>
      <input name="firstname" class="easyui-textbox" required="true">
    </div>
    <div class="fitem">
      <label>接收对象</label>
      <input name="phone" class="easyui-textbox" required="true">
    </div>
    <div class="fitem">
      <label>内容</label>
      <input name="lastname" class="easyui-textbox" required="true">
    </div>
  </form>
</div>
<div id="add_message_dlg-buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="javascript:$('#add_message_dlg').dialog('close')" style="width:90px">保存</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add_message_dlg').dialog('close')" style="width:90px">取消</a>
</div>
</body>
</html>