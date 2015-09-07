<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">存储配置</rapid:override>
<rapid:override name="head">
<script type="text/javascript">
    $(function () {
        $('#p').progressbar('setValue', 50);
    })

</script>
</rapid:override>
<rapid:override name="mainName">存储配置</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'存储配置'" iconCls="icon-drive_disk">

    <div style="padding:5px 0;">
        <div class="easyui-progressbar" data-options="value:50" style="width: 400px;"></div>
总容量：100T,已用容量：50T，可用容量：50T，使用百分比：50%
        </div>
<div class="easyui-panel" title="存储配置" style="width:400px">
    <div style="padding:10px 60px 20px 60px">
        <form method="post">
            <table cellpadding="5">
                <tr>
                    <td>存储协议:</td>
                    <td>
                        <select class="easyui-combobox" name="language">
                            <option value="hdfs">HDFS</option>
                            <option value="http">HTTP</option>
                            <option value="bdcloud">百度云</option>
                            <option value="local">File(本地文件)</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>端口:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>参数:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
    </div>
</div>
    </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>

