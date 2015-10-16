/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#comment_table').datagrid({
        rownumbers: true,
        singleSelect: true,
        pagination: true,
        toolbar:"#tb",
        url: "/bcms/proxy?url=comment&method=GET",
        columns: [[
            {field: 'user_id', width: '20%', align: 'center', title: '提交者'},
            {field: 'content', width: '45%', align: 'center', title: '内容'},
            {field: 'target_id', width: '10%', align: 'center', title: '关联资源'},
            {
                field: 'is_blocked', width: '10%', align: 'center', title: '是否屏蔽',
                formatter: function (value, row, index) {
                    if(value==true){
                        return "是";
                    }else{
                        return "否";
                    }
                }
            },
            {
                field: '_operate', width: '10%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="editUser(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delComment(' + index + ')">删除</a>';
                }
            }
        ]]
    });
});

function getQueryParams(queryParams){
    var username=$("#username").val();
    var is_blocked=$("#is_blocked").combobox('getValue');
    queryParams.username=username;
    queryParams.is_blocked=is_blocked;
    return queryParams;
}

function reloadgrid() {
    var queryParams = $('#comment_table').datagrid('options').queryParams;
    getQueryParams(queryParams);
    $('#comment_table').datagrid('options').queryParams = queryParams;
    $("#comment_table").datagrid('reload');
}

function delComment(index){
    $('#comment_table').datagrid('selectRow',index);
    var row = $('#comment_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "comment/" + row.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#comment_table").datagrid("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}