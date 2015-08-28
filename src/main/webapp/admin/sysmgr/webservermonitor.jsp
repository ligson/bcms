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
                    text: '用户访问量统计'
                },
                xAxis: {
                    title: {
                        text: '时间'
                    },
                    categories: ['15年8月18','15年8月19','15年8月20','15年8月21','15年8月22','15年8月23','15年8月24','15年8月25']
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
                        name: '每个月文件数量',
                        data: [1232,140,3452,1287,3587,7867,9357]
                    }
                ]
            });

        });
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
