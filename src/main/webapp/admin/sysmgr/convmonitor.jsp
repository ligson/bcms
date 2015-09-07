<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/27
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">转码状态</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
  <script type="text/javascript">
    $(function () {

      $('#container1').highcharts({
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false
        },
        title: {
          text: '媒体类型统计'
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: true,
              color: '#FFFFFF',
              connectorColor: '#000000',
              format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            },
            showInLegend: true
          }
        },
        series: [
          {
            type: 'pie',
            name: '文件数量',
            data: [['转码成功',6854],['转码失败',596],['不需要转码',1953]]
          }
        ]
      });
      $('#container2').highcharts({
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false
        },
        title: {
          text: '转码数量'
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: true,
              color: '#FFFFFF',
              connectorColor: '#000000',
              format: '<b>{point.name}</b>: {point.percentage:.1f} %'
            },
            showInLegend: true
          }
        },
        series: [
          {
            type: 'pie',
            name: '文件数量',
            data: [['视频',5612],['音频',1582],['文档',523],['图片',440],['字幕',365],['SWF',156],['其他',175]]
          }
        ]
      });


      $('#container3').highcharts({
        title: {
          text: '文件数量',
          x: -20 //center
        },
        subtitle: {
          text: '统计文件数量',
          x: -20
        },
        plotOptions: {
          line: {
            dataLabels: {
              enabled: true
            },
            enableMouseTracking: false
          }
        },
        xAxis: {
          title: {
            text: '月份'
          },
          categories: ['2015年1月','2015年2月','2015年3月','2015年4月','2015年5月','2015年6月','2015年7月','2015年8月']
        },
        yAxis: {
          title: {
            text: '个数'
          },
          plotLines: [
            {
              value: 0,
              width: 1,
              color: '#808080'
            }
          ]
        },
        tooltip: {
          valueSuffix: '个'
        },
        legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
        },
        series: [
          {
            name: '每个月文件数量',
            data: [1232,140,3452,1287,3587,7867,9357]
          },
          {
            name: "文件总量",
            data: [1560,1700,5152,6485,11201,18121,27151]
          }
        ]
      });


    });
  </script>
</rapid:override>
<rapid:override name="mainName">转码状态</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'转码状态'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
  <div id="container1" style="width:50%;height:400px;float:left;"></div>

  <div id="container2" style="width:50%;height:400px;float:left;"></div>

  <div id="container3" style="width:100%;height:400px;float:left;" ></div>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
