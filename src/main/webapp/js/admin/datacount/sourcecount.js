
$(function () {

    $('#source_table').datagrid({
        rownumbers: true,
        singleSelect: false,
        url: "/bcms/proxy?url=log/ip_request_count&method=post&isStatsticalQuery=true",
        pagination: true,
        columns: [[
            {field: 'ip', width: '49%', align: 'center', title: 'IP'},
            {field: 'number', width: '50%', align: 'center', title: '请求次数'},
        ]]
    });



});

