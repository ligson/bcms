$(function () {

    $('#score_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        toolbar:"#tb",
        url: "/bcms/proxy?url=score&method=GET",
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'user_id',width:'25%',align:'center',title:'提交者'},
            {field:'score',width:'25%',align:'center',title:'分值'},
            {field:'target_id',width:'30%',align:'center',title:'关联资源'},
            {field:'_operate',width:'14%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="delScore(' + index + ')">删除</a>';
                }
            }
        ]]
    });
});

function getQueryParams(queryParams){
    var username=$("#username").val();
    queryParams.username=username;
    return queryParams;
}

function reloadgrid() {
    var queryParams = $('#score_table').datagrid('options').queryParams;
    getQueryParams(queryParams);
    $('#score_table').datagrid('options').queryParams = queryParams;
    $("#score_table").datagrid('reload');
}

function delScore(index){
    $('#score_table').datagrid('selectRow',index);
    var row = $('#score_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "score/" + row.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#score_table").datagrid("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}