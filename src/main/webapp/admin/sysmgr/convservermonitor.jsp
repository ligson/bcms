<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/27
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>转码状态</title>
  <jsp:include page="../../layout/admin/adminheader.jsp"/>
  <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
  <script type="text/javascript">

      $(function() {
        $("#convTabs").tabs({
          fit:true,
          plain:true
        })
          Highcharts.setOptions({
            global: {
              useUTC: false
            }
          });
          var chart;
        var chart1;
          chart = new Highcharts.Chart({
            chart: {
              renderTo: 'memory_cpu',
              type: 'spline',
              animation: Highcharts.svg,
              marginRight: 10,
              events: {
                load: function() {}
              }
            },
            title: {
              text: '转码服务器内存&CPU状态监控'
            },
            xAxis: {
              type: 'datetime',
              tickPixelInterval: 150
            },
            yAxis: [{
              title: {
                text: '占用率(%)'
              },
              plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
              }]
            }],
            tooltip: {
              formatter: function() {
                return '<b>' + this.series.name + '</b><br/>' + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' + Highcharts.numberFormat(this.y, 2)+"%";
              }
            },
            legend: {
              enabled: false
            },
            exporting: {
              enabled: false
            },
            series: [{
              name: 'CPU',
              data: (function() { // generate an array of random data
                var data = [],
                        time = (new Date()).getTime(),
                        i;
                for (i = -19; i <= 0; i++) {
                  data.push({
                    x: time + i * 1000,
                    y: Math.random()*100
                  });
                }
                return data;
              })()
            },
              {
                name: '内存',
                data: (function() { // generate an array of random data
                  var data = [],
                          time = (new Date()).getTime(),
                          i;
                  for (i = -19; i <= 0; i++) {
                    data.push({
                      x: time + i * 1000,
                      y: Math.random()*100
                    });
                  }
                  return data;
                })()
              }]
          });
          chart1 = new Highcharts.Chart({
            chart: {
              renderTo: 'conv_count',
              type: 'spline',
              animation: Highcharts.svg,
              marginRight: 10,
              events: {
                load: function() {}
              }
            },
            title: {
              text: '当前转码文件监控'
            },
            xAxis: {
              type: 'datetime',
              tickPixelInterval: 150
            },
            yAxis: [{
              title: {
                text: '文件数量(个)'
              },
              plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
              }]
            }],
            tooltip: {
              formatter: function() {
                return '<b>' + this.series.name + '</b><br/>' + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' + Highcharts.numberFormat(this.y, 2);
              }
            },
            legend: {
              enabled: false
            },
            exporting: {
              enabled: false
            },
            series: [
              {
                name: '转码文件数量',
                data: (function() { // generate an array of random data
                  var data = [],
                          time = (new Date()).getTime(),
                          i;
                  for (i = -19; i <= 0; i++) {
                    data.push({
                      x: time + i * 1000,
                      y: Math.random()*100
                    });
                  }
                  return data;
                })()
              }]
          });
          var series2 = chart1.series[0];
          var series = chart.series[0];
          var series1 = chart.series[1];
          setInterval(function() {
                    var x = (new Date()).getTime(),
                    y = Math.random(),
                    y1 = Math.random();
                    series.addPoint([x, y], true, true);
                    series1.addPoint([x, y1], true, true);
                    series2.addPoint([x,y*1000],true,true);
                  },
                  1000);


      });


  </script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'转码状态'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
  <div>服务器状态</div>
  <div id="convTabs">
    <div title="内存&CPU状态监控" style="padding:10px;">
      <div id="memory_cpu">

      </div>
    </div>
    <div title="转码数量监控" style="padding:10px;">
      <div id="conv_count">

      </div>
    </div>
  </div>
</div>
</body>
</html>
