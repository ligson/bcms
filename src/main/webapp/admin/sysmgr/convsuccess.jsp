<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">已转码文件</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
</rapid:override>
<rapid:override name="mainName">已转码文件</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'已转码文件列表'" iconCls="icon-cdr_go">
  <div id="container">
    <table class="easyui-datagrid" data-options="pagination:'true',toolbar:'#tb'">
      <thead>
      <tr>
        <th data-options="field:'image',width:'12%'">资源截图</th>
        <th data-options="field:'name',width:'55%'">资源名称</th>
        <th data-options="field:'hash',width:'25%'">HASH</th>
        <th data-options="field:'_oper',width:'8%'">操作</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td>
        <td>确然数字资源管理共享系统RMS.ppt</td>
        <td>3A89658983B464874C3C118C3E753DA9</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>
      <tr>
        <td><img style="width:150px;height: 80px;" src="../../images/file.png" ></td><td>福建省图自动播发平台宣传片9-21.mp4</td><td>51CE3AB8D65D131953011323A84188AC</td>
        <td><span><a class="btn btn-success" href="#">点播</a>
                </span></td>
      </tr>

      </tbody>
    </table>
    <div id="tb" style="padding:2px 5px;">
      <select class="easyui-combobox" panelHeight="auto" style="width:100px">
        <option value="java">所有</option>
        <option value="c">视频</option>
        <option value="basic">音频</option>
        <option value="perl">文档</option>
      </select>
      <select class="easyui-combobox" panelHeight="auto" style="width:100px">
        <option value="java">文件名</option>
        <option value="c">HASH</option>
      </select>
      <input class="easyui-textbox">
      <a href="#" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
    </div>
  </div>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
