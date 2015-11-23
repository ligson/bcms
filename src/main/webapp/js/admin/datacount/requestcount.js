/**
 * Created by ligson on 2015/8/11.
 */
$(function () {

    var categories=[];
    var data=[];
    var end_date=GetDateStr(0);
    var start_date=GetDateStr(-30);
    $.post("/bcms/proxy", {method:"post",url: "/log/web_request_count",isStatsticalQuery:true,begin_time:start_date,end_time:end_date,Internal:"day"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success == true) {
            $.each(obj.data, function (i, item) {
                console.log(i);
                categories.push(GetDateStr((i-30)));
                data.push(item);
            });
            var chart = $('#container').highcharts({
                title: {
                    text: '用户访问量统计',
                    x: -20 //center
                },
                xAxis: {
                    tickInterval: 3,
                    categories: categories
                },
                yAxis: {
                    title: {
                        text: '访问次数'
                    },
                    minPadding:0,
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
                    name: '请求次数',
                    data: data
                }]
            }).highcharts();
        }
    });
});

function GetDateStr(number)
{
    var dd = new Date();
    dd.setDate(dd.getDate()+number);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    return y+"-"+m+"-"+d;
}