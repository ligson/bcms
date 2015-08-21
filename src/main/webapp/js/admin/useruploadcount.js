/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    $('#container').highcharts({
        title: {
            text: '用户上传次数统计',
            x: -20 //center
        },
        xAxis: {
            categories: ['一月份', '二月份', '三月份', '四月份', '五月份', '六月份', '七月份', '八月份', '九月份', '十月份']
        },
        yAxis: {
            title: {
                text: '上传次数'
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
            name: '上传次数',
            data: [100, 200, 11, 44, 1411, 44, 11, 4774, 1414, 7474]
        }]
    });
});