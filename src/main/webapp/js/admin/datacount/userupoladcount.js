/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    var start_date = GetDateStr(-1);
    var end_date = GetDateStr(0);
    var data = [];
    $.post("/bcms/proxy", {
        method: "get",
        url: "query/user_uploaded_file_count",
        isStatsticalQuery: true,
        start_at: start_date,
        end_at: end_date
    }, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success == false) {
            alert("加载数据失败!")
        } else {
            $.each(obj, function (i, value) {
                console.log(value);
                /*var element={};
                 element.y=obj[i].number;
                 element.name=obj[i].mediaType;
                 data.push(element);*/
            })
            $('#container').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '用户上传资源量统计'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Browser share',
                    data: data
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