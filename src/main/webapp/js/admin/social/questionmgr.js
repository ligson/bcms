$(function () {

    $('#question_table').datagrid({
        singleSelect:true,
        fitColumns:true,
        pagination:true,
        view: detailview,
        detailFormatter:function(index,row){
            return '<div style="padding:2px"><table id="ddv_'+row.id+'"></table></div>';
        },
        onExpandRow: function(index,row){
            $("#ddv_"+row.id).datagrid({
                fitColumns:true,
                singleSelect:true,
                rownumbers:true,
                loadMsg:'',
                height:'auto',
                data:row.answers,
                columns:[[
                    {field:'content',title:'回答内容',width:'60%',align:'center'},
                    {field:'user_id',title:'回答者',width:'10%',align:'center'},
                    {field:'is_adoptted',title:'是否采纳',width:'10%',align:'center'},
                    {field:'_operate',width:'14%',align:'center',title:'操作',
                        formatter: function (value, row,index) {
                            return '<a class="tablelink" href="#" onclick="delAnswer('+row.question_id+',' + index + ')">删除</a>';
                        }
                    }
                ]],
                onResize:function(){
                    $('#question_table').datagrid('fixDetailRowHeight',index);
                },
                onLoadSuccess:function(){
                    setTimeout(function(){
                        $('#question_table').datagrid('fixDetailRowHeight',index);
                    },0);
                }
            });
            $('#question_table').datagrid('fixDetailRowHeight',index);
        },
        url: "/bcms/proxy?url=question&method=GET",
        toolbar:"#tb",
        columns:[[
            {field:'user_id',width:'25%',align:'center',title:'提交者'},
            {field:'content',width:'25%',align:'center',title:'内容'},
            {field:'target_id',width:'30%',align:'center',title:'关联资源'},
            {field:'_operate',width:'14%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="delQuestion(' + index + ')">删除</a>';
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
    var queryParams = $('#question_table').datagrid('options').queryParams;
    getQueryParams(queryParams);
    $('#question_table').datagrid('options').queryParams = queryParams;
    $("#question_table").datagrid('reload');
}

function delQuestion(index){
    $('#question_table').datagrid('selectRow',index);
    var row = $('#question_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "question/" + row.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#question_table").datagrid("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function delAnswer(id,index) {
    $('#ddv_' + id).datagrid('selectRow', index);
    var row = $('#ddv_' + id).datagrid('getSelected');
    if (row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/bcms/proxy", {method: "delete", url: "answer/" + row.id}, function (result) {
                    var obj = $.parseJSON(result);
                    if (obj.success == false) {
                        alert("删除失败!");
                    } else {
                        $("#ddv_"+id).datagrid('deleteRow',index);
                    }
                });
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}