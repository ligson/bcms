$(function () {

    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'30%',align:'center',title:'权限名称'},
            {field:'description',width:'30%',align:'center',title:'备注'},
            {field:'_operate',width:'32%',align:'center',title:'操作',formatter:formatOper}
        ]],
        toolbar:[{
            text:'添加',iconCls:'icon-add',handler:function(){
                addAuth();
            }
        },
            {text:'删除',iconCls:'icon-cancel',handler:function(){
                delAuths();
            }
            }
        ]
    });

    initAuthGrid();
});


function initAuthGrid() {
    $.post("/bcms/proxy", {method:"get",url: "permission/"}, function (result) {
        var obj=jQuery.parseJSON(result);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            var json = {total: data.length, rows: data};
            $("#auth_table").datagrid('loadData', json);
        } else {
            alert(obj.msg);
        }
    });
}

function addAuth(){
    $('#add_auth_dlg').dialog('open');
}



function editAuth(index) {
    $('#auth_table').datagrid('selectRow', index);
    var row = $('#auth_table').datagrid('getSelected');
    if (row) {
        $("#modify_auth_dlg input[name=id]").val(row.id);
        $("#modify_auth_dlg input[name=name]").val(row.name);
        $("#modify_auth_dlg input[name=description]").val(row.description);
        $('#modify_auth_dlg').dialog('open');
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyAuth(){
    var id= $("#modify_auth_dlg input[name=id]").val();
    var name = $("#modify_auth_dlg input[name=name]").val();
    var description = $('#modify_auth_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"put",url: "permission/"+id, name: name, description:description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#modify_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#modify_auth_dlg').dialog('close');
            $.messager.alert("提示",obj.msg,"info");
        }
    });
}


function formatOper(val, row, index) {
    return '<a class="tablelink" href="#" onclick="editAuth(' + index + ');">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delAuth(' + index + ');">删除</a>';
}

function delAuths() {
    var rows = $('#auth_table').datagrid("getSelections");
    if (rows.length > 0) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                for (var i = 0; i < rows.length; i++) {
                    $.post("/bcms/proxy", {method: "delete", url: "permission/" + rows[i].id + "/"}, function (result) {
                        var obj = jQuery.parseJSON(result);
                        if (obj.success) {
                            initAuthGrid();
                        } else {
                            $.message.alert("提示",obj.msg,"info");
                        }
                    });
                }
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function delAuth(index) {
    var row= $('#auth_table').datagrid("getData").rows[index];
    if (row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/bcms/proxy", {method:"delete",url: "permission/" + row.id + "/"}, function (result) {
                    var obj = jQuery.parseJSON(result);
                    if (obj.success) {
                        initAuthGrid();
                    } else {
                        $.messager.alert("提示",obj.msg,"error");
                    }
                });
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function saveAuth() {
    var name = $("#name").val();
    var description = $("#description").val();
    $.post("/bcms/proxy", {method:"post",url: "permission/", name: name, description: description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#add_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#add_auth_dlg').dialog('close');
            alert(obj.msg);
        }
    });

}
