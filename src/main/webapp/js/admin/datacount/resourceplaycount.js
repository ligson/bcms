/**
 * Created by ligson on 2015/8/11.
 */
$(function () {

    var colors = Highcharts.getOptions().colors,
        categories =[],
        name = '点播分布',
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


    var chart = $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '今日资源点播排行'
        },
        xAxis: {
            categories: categories
        },
        yAxis: {
            title: {
                text: '资源点播次数'
            }
        },
        plotOptions: {
            column: {
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: colors[0],
                    style: {
                        fontWeight: 'bold'
                    },
                    formatter: function() {
                        return this.y +'次';
                    }
                }
            }
        },
        series: [{
            name: name,
            data: data,
            color: 'white'
        }],
        exporting: {
            enabled: false
        }
    }).highcharts();
});