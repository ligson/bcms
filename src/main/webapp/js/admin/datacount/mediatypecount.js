/**
 * Created by ligson on 2015/8/11.
 */
$(function () {

    var data=[];
    $.post("/bcms/proxy", {method:"get",url: "query/resources_count_by_type",isStatsticalQuery:true}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success == false) {
            alert("加载数据失败!")
        }else{
            $.each(obj,function(i,value){
                var element={};
                element.y=obj[i].number;
                element.name=obj[i].mediaType;
                data.push(element);
            })
            console.log(data);
            $('#container').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '资源类型统计'
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