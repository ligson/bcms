/**
 * Created by ligson on 2015/8/11.
 */
$(function () {

    var categories=['2010-2-3','2010-2-4'];
    var data=[3,4];

    var chart = $('#container').highcharts({
        title: {
            text: '用户访问量统计',
            x: -20 //center
        },
        xAxis: {
            categories: categories
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
            data:data
        }]
    }).highcharts();
});