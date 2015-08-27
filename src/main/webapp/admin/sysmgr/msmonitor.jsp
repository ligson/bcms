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
    <title>流媒体配置</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
    <script type="text/javascript">
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
                    text: 'cpu使用动态曲线图'
                },
                xAxis: {
                    title: {
                        text: '时间'
                    },
                    //linear" or "datetime"
                    type: 'datetime',
                    //坐标间隔
                    tickPixelInterval: 150
                },
                yAxis: {
                    title: {
                        text: 'cpu使用(单位:%)'
                    },
                    //指定y=3直线的样式
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
                                Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                                Highcharts.numberFormat(this.y, 2);
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
                        name: 'cpu使用',
                        data: (function () {
                            // 初始化数据
                            var data = [],
                                    time = (new Date()).getTime(),
                                    i;
                            for (i = -19; i <= 0; i++) {
                                data.push({
                                    x: time + i * 1000,
                                    y: Math.random() * 100
                                });
                            }
                            return data;
                        })()
                    }
                ]
            });
            getCpuInfo();
        });

        function getCpuInfo() {
            var x = (new Date()).getTime();
            var y = parseInt(Math.random() * 100);
            var series = chart.series[0];
            series.addPoint([x, y], true, true);
        }
        setInterval(getCpuInfo, 1000);
    </script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'流媒体配置'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
    <div id="container">

    </div>
</div>
</body>
</html>
