/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    var start_date = GetDateStr(-365);
    var end_date = GetDateStr(0);
    var categories = [];
    var all_data = [];
    var month_data = [];
    $.post("/bcms/proxy", {
        method: "get",
        url: "query/resources_count_by_month",
        isStatsticalQuery: true,
        start_at: start_date,
        end_at: end_date
    }, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success == false) {
            alert("加载数据失败!")
        } else {
            $.each(obj, function (i, value) {
                categories.push(value.month);
                all_data.push(value.count);
                month_data.push(value.month_count);
            });
            $('#container').highcharts({
                title: {
                    text: '资源量统计'
                },
                xAxis: {
                    categories: categories
                },
                yAxis: {
                    title: {
                        text: '资源数量'
                    },
                    minPadding: 0,
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
                    data: all_data
                }, {
                    name: '资源月增量',
                    data: month_data
                }]
            });
        }
    });

});


function GetDateStr(number) {
    var dd = new Date();
    dd.setDate(dd.getDate() + number);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1;//获取当前月份的日期
    var d = dd.getDate();
    return y + "-" + m + "-" + d;
}