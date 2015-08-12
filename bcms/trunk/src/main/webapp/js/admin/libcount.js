/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    var colors = Highcharts.getOptions().colors,
        categories = ['教学资源库', '精品实验室', '电子图书', '课堂', '图书'],
        name = '资源分布',
        data = [{
            y: 1000,
            color: colors[0]

        }, {
            y: 2000,
            color: colors[1]

        }, {
            y: 125,
            color: colors[2]
        }, {
            y: 962,
            color: colors[3]
        }, {
            y: 788,
            color: colors[4]
        }];

    function setChart(name, categories, data, color) {
        chart.xAxis[0].setCategories(categories, false);
        chart.series[0].remove(false);
        chart.addSeries({
            name: name,
            data: data,
            color: color || 'white'
        }, false);
        chart.redraw();
    }

    var chart = $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '资源库资源分布'
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            title: {
                text: '资源库资源数量'
            }
        },
        plotOptions: {
            column: {
                cursor: 'pointer',
                point: {
                    events: {
                        click: function() {
                            var drilldown = this.drilldown;
                            if (drilldown) { // drill down
                                setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                            } else { // restore
                                setChart(name, categories, data);
                            }
                        }
                    }
                },
                dataLabels: {
                    enabled: true,
                    color: colors[0],
                    style: {
                        fontWeight: 'bold'
                    },
                    formatter: function() {
                        return this.y +'个';
                    }
                }
            }
        },/*
        tooltip: {
            formatter: function() {
                var point = this.point;
                return "";
            }
        },*/
        series: [{
            name: name,
            data: data,
            color: 'white'
        }],
        exporting: {
            enabled: false
        }
    })
        .highcharts(); // return chart
});