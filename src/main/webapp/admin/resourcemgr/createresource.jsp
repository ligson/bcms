<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">创建资源</rapid:override>
<rapid:override name="head">
    <link type="text/css" rel="stylesheet" href="../../js/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <script type="text/javascript" src="../../js/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
    <script type="text/javascript" src="../../js/spark-md5.js"></script>
    <script type="text/javascript" src="../../js/common/fileutils.js"></script>
    <script type="text/javascript" src="http://42.62.52.40:8000/static/flow.js"></script>
    <script type="text/javascript" src="../../js/admin/resourcemgr/createresource.js"></script>
</rapid:override>
<rapid:override name="mainName">操作日志</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <form id="createResourceForm">
        <table class="table">
            <tr>
                <td class="col-md-2"><label>资源名:</label></td>
                <td class="col-md-10"><input id="name10" type="text" class="easyui-textbox" required="true"/></td>
            </tr>
            <tr>
                <td><label>类型:</label></td>
                <td>
                    <select id="kind10" class="easyui-combobox" editable="false">
                        <option value="0">普通</option>
                        <option value="1">课程</option>
                        <option value="2">课时</option>
                        <option value="3">素材</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>资源库</label></td>
                <td><select id="resourceTree" url="/bcms/proxy?url=resourcelibrary/&method=GET" class="easyui-combotree"
                            data-options="method:'POST',required:true"
                            style="width:200px;"></select></td>
            </tr>
                <%-- <tr id="parentResource">
                     <td><label>父资源:</label></td>
                     <td><input class="easyui-combotree" data-options="url:'./lefttree.json',method:'get',required:true"
                                style="width:200px;"/></td>
                 </tr>--%>


                <%--<tr>
                    <td><label>资源标签:</label></td>
                    <td><input data-role="tagsinput" style="width:200px;" placeholder="回车输入" title="输入后点击回车键添加"/></td>
                </tr>--%>
            <%--<tr>
                <td><label>转码策略:</label></td>
                <td>
                    <select id="cc" class="easyui-combobox" name="dept" style="width:200px;" editable="editable">
                        <option>默认</option>
                        <option>策略1</option>
                        <option>策略2</option>
                        <option>策略3</option>
                    </select>
                </td>
            </tr>--%>
            <tr>
                <td><label>文件:</label></td>
                <td><input type="text" class="easyui-filebox" buttonText="选择文件" id="fileIpt">&nbsp;&nbsp;<a class="easyui-linkbutton" onclick="startUpload()">上传</a></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <ul class="list-group" id="fileList">
                    </ul>
                </td>
            </tr>
           <%-- <tr>
                <td><label>横版海报:</label></td>
                <td><input type="text" class="easyui-filebox" buttonText="选择文件">(建议尺寸:120x90)</td>
            </tr>
            <tr>
                <td><label>竖版海报:</label></td>
                <td><input type="text" class="easyui-filebox" buttonText="选择文件">(建议尺寸:121x161)</td>
            </tr>--%>
            <tr>
                <td colspan="2" style="text-align: center;padding:10px;">
                    <a class="easyui-linkbutton" onclick="submitForm()">提交</a>
                </td>
            </tr>
        </table>
    </form>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/rmgr-base.jsp" %>

