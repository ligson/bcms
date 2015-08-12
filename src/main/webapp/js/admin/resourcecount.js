/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    $('#container').highcharts({
        title: {
            text: '资源量统计'
            //x: -20 //center
        },
        xAxis: {
            categories: ['201401', '201402', '201403', '201404', '201405', '201406', '201407', '201408', '201409', '201410', '201411', '201412', '201501']
        },
        yAxis: {
            title: {
                text: '资源数量'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
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
        series: [{
            name: '资源总量',
            data: [100, 200, 11, 44, 1411, 44, 11, 4774, 1414, 7474, 441, 7474, 88]
        }, {
            name: '资源月增量',
            data: [10, 20, 1011, 404, 411, 4, 1, 474, 144, 774, 41, 474, 88]
        }]
    });
});