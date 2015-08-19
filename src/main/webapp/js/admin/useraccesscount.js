/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    $('#container').highcharts({
        title: {
            text: '用户访问次数统计',
            x: -20 //center
        },
        xAxis: {
            categories: ['用户1', '用户1', '用户1', '用户1', '用户1', '用户1', '用户1', '用户1', '用户1', '用户1']
        },
        yAxis: {
            title: {
                text: '访问次数'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '次'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '访问次数',
            data: [100, 200, 11, 44, 1411, 44, 11, 4774, 1414, 7474, 441, 7474, 88, 4488, 414, 36365, 525]
        }]
    });
});