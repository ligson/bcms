/**
 * Created by ligson on 2015/8/11.
 */
$(function () {
    var colors = Highcharts.getOptions().colors,
        categories =[],
        name = '点播分布',
        data = [];
    var start_date=GetDateStr(0);
    var end_date=GetDateStr(-1);
    $.post("/bcms/proxy", {method:"post",url: "log/hot_request_resource/",isStatsticalQuery:true,begin_time:start_date,end_time:end_date}, function (result) {
        var obj = jQuery.parseJSON(result);
        if(obj.success==true){
            $.each(obj.data,function(i,item){
                categories.push(item.file_name);
                var comment={};
                comment.y=item.play_number;
                comment.color=colors[i];
                data.push(comment);
            });

            var chart = $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '今日热门资源统计'
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