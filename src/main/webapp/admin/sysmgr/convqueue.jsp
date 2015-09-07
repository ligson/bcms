<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">转码队列</rapid:override>
<rapid:override name="head">
</rapid:override>
<rapid:override name="mainName">转码队列</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'转码队列'" iconCls="icon-cdr_go">
  <div id="container">
    <table class="easyui-datagrid" title="转码队列"
           data-options="rownumbers:true,singleSelect:true">
      <thead>
      <tr>
        <th data-options="field:'itemid',width:'25%'">文件HASH</th>
        <th data-options="field:'productid',width:'40%'">文件名</th>
        <th data-options="field:'listprice',width:'5%',align:'right'">媒体类型</th>
        <th data-options="field:'unitcost',width:'5%',align:'right'">视频高度</th>
        <th data-options="field:'attr1',width:'5%'">视频宽度</th>
        <th data-options="field:'status',width:'10%',align:'center'">进度</th>
        <th data-options="field:'oper',width:'8%',align:'center'">操作</th>
      </tr>
      </thead>
      <tbody>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>
        <tr>
          <td>0086F5BF809BBAAC1987213E9EFCBE6D</td>
          <td>e-Learning发展的必然趋势(吕森林).avi	</td>
          <td>avi</td>
          <td>1280</td>
          <td>720</td>
          <td><div class="easyui-progressbar"></div> </td>
          <td>移除</td>
        </tr>

      </tbody>
    </table>

    </div>
  </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
