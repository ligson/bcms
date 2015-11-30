
$(function () {

    var start_date=GetDateStr(-30);
    var end_date=GetDateStr(0);
    $('#source_table').datagrid({
        rownumbers: true,
        singleSelect: false,
        url: "/bcms/proxy?url=query/ip_request_count&method=get&isStatsticalQuery=true&start_at="+start_date+"&end_at="+end_date,
        pagination: true,
        columns: [[
            {field: 'remote_ip', width: '49%', align: 'center', title: 'IP'},
            {field: 'count', width: '50%', align: 'center', title: '请求次数'},
        ]]
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
