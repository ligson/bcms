<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web服务器状态监测</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
    <%--<script type="text/javascript">
        /**
         * Created with IntelliJ IDEA.
         * User: ligson
         * Date: 13-5-25
         * Time: 下午4:48
         * To change this template use File | Settings | File Templates.
         */
        $(function () {

            Highcharts.setOptions({
                global: {
                    useUTC: false
                }
            });

            //声明报表对象

            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    defaultSeriesType: 'spline',
                    marginRight: 10
                },
                title: {
                    text: '用户访问量统计'
                },
                xAxis: {
                    categories: ['8月18','8月19','8月20','8月21','8月22','8月23','8月24','8月25','8月26','8月27','8月28','8月29']
                },
                yAxis: {
                    title: {
                        text: '访问用户(单位:人)'
                    },
                    plotLines: [
                        {
                            value: 0,
                            width: 10,
                            color: '#808080'
                        }
                    ]
                },
                //鼠标放在某个点上时的提示信息
                //dateFormat,numberFormat是highCharts的工具类
                tooltip: {
                    formatter: function () {
                        return '<b>' + this.series.name + '</b><br/>' +
                                this.x + '<br/>' +
                                Highcharts.numberFormat(this.y, 0)+"人";
                    }
                },
                //曲线的示例说明，像地图上得图标说明一样
                legend: {
                    enabled: true
                },
                //把曲线图导出成图片等格式
                exporting: {
                    enabled: true
                },
                //放入数据
                series: [
                    {
                        name: '用户',
                        data: [1232,140,3452,1287,3587,7867,9357,5142,3214,1452,1475]
                    }
                ]
            });

        });
    </script>--%>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'Web服务状态监测'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
           <%-- <div id="container">
            </div>--%>
<iframe style="width:100%;height: 100%" src="http://42.62.52.40:8001/#/accounts"></iframe>

</div>
</body>
</html>
