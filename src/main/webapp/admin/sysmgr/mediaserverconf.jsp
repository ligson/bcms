<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">流媒体配置</rapid:override>
<rapid:override name="head">
    <script type="text/javascript">
        $(function () {
            $("#rebootDlg").dialog({
                width: 400,
                height: 200,
                modal: true,
                buttons: [
                    {
                        text: "关闭",
                        handler: function () {
                            $("#rebootDlg").dialog("close");
                            $('#p').progressbar('setValue', 0);
                        }
                    }
                ]
            });
        });
        function reboot() {
            //alert("正在重启...");
            $("#rebootDlg").dialog("open");

            var value = $('#p').progressbar('getValue');
            if (value < 100) {
                value += Math.floor(Math.random() * 10);
                $('#p').progressbar('setValue', value);
                setTimeout(arguments.callee, 200);
            }
        }
        function testService() {
            alert("连接ok......");
        }
    </script>
</rapid:override>
<rapid:override name="mainName">流媒体配置</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'流媒体配置'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
    <div id="container">
        <form id="ff" method="post">
            <table class="table">
                <tr>
                    <td class="col-md-2">转码服务器IP:</td>
                    <td class="col-md-10"><input class="easyui-textbox" type="text" name="name"
                                                 data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>端口:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true,validType:'email'"/></td>
                </tr>
                <tr>
                    <td>服务状态:</td>
                    <td><img src="../../images/red.gif" style="width:25px;height:25px;"></td>
                    <td><a class="easyui-linkbutton" href="./mediaservermonitor.jsp">查看详情</a></td>

                </tr>
                <tr>
                    <td>服务重启</td>
                    <td><a iconCls="icon-control_repeat_blue" class="easyui-linkbutton" onclick="reboot()">重启</a></td>
                    <td></td>
                </tr>
                <tr>
                    <td>测试链接</td>
                    <td><a iconCls="icon-control_equalizer_blue" class="easyui-linkbutton"
                           onclick="testService()">测试</a>
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:left;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
<div class="easyui-dialog" closed="true" title="重启服务" id="rebootDlg">
    <div style="width:100%;height:100px;margin:0 auto">
        <div id="p" class="easyui-progressbar" style="width:300px;margin-left:50px;margin-top:20px;"></div>
    </div>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
