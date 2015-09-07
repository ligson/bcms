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
            $("#mediaTabs").tabs({
                fit:true,
                plain:true
            })
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
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'container1',
                    defaultSeriesType: 'spline',
                    marginRight: 10
                },
                title: {
                    text: '用户并发数'
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
                        text: '用户并发数(单位:人)'
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
                        name: '用户数',
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
            var series1 = chart1.series[0];
            series.addPoint([x, y], true, true);
            series1.addPoint([x, y], true, true);
        }
        setInterval(getCpuInfo, 1000);
    </script>
</rapid:override>
<rapid:override name="mainName">流媒体配置</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div id="mediaTabs">
        <div title="CPU" style="padding:10px;">
            <div id="container">
            </div>
        </div>
        <div title="用户并发" style="padding:10px;">
            <div id="container1" style="width: 100%;">
            </div>
        </div>
        <div title="连接用户详情" style="padding:10px;">
            <table class="easyui-datagrid" title="转码策略"
                   data-options="rownumbers:true,singleSelect:true,pagination:true">
                <thead>
                <tr>
                    <th data-options="field:'itemid',width:'20%'">用户名</th>
                    <th data-options="field:'productid',width:'25%'">开始时间</th>
                    <th data-options="field:'productid',width:'25%'">结束时间</th>
                    <th data-options="field:'listprice',width:'25%',align:'center'">点播文件名</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>superadmin</td>
                        <td>2015年8月28日16:41:32</td>
                        <td>2015年8月28日17:41:32</td>
                        <td>我是歌手第三季第二期.mp4</td>
                    </tr>
                    <tr>
                        <td>superadmin</td>
                        <td>2015年8月28日16:41:32</td>
                        <td>2015年8月28日17:41:32</td>
                        <td>我是歌手第三季第二期.mp4</td>
                    </tr>
                    <tr>
                        <td>superadmin</td>
                        <td>2015年8月28日16:41:32</td>
                        <td>2015年8月28日17:41:32</td>
                        <td>我是歌手第三季第二期.mp4</td>
                    </tr>
                    <tr>
                        <td>superadmin</td>
                        <td>2015年8月28日16:41:32</td>
                        <td>2015年8月28日17:41:32</td>
                        <td>我是歌手第三季第二期.mp4</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
