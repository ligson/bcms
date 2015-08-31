$(function () {

    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'10%',align:'center',title:'权限名称'},
            {field:'department',width:'20%',align:'center',title:'目标部门'},
            {field:'resource_lib',width:'20%',align:'center',title:'目标资源库'},
            {field:'description',width:'30%',align:'center',title:'备注'},
            {field:'_operate',width:'12%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editAuth('+ index + ')">修改</a>';
                }
            }
        ]]
      /*  toolbar:[{
            text:'添加',iconCls:'icon-add',handler:function(){
                addAuth();
            }
        },
            {text:'删除',iconCls:'icon-cancel',handler:function(){
                delAuths();
            }
            }
        ]*/
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

function editAuth(index) {
    $('#auth_table').datagrid('selectRow', index);
    var row = $('#auth_table').datagrid('getSelected');
    if (row) {
        $("#modify_auth_dlg input[name=id]").val(row.id);
        $("#modify_auth_dlg input[name=name]").val(row.name);
        $("#modify_auth_dlg input[name=description]").val(row.description);
        initAddDepartmentTree();
        $("#modify_auth_dlg .resourcelib_tree").combotree('loadData', [{"id": 1, "text": "案例库",children:[{"id":11,"text":"分类1"}]}, {"id": 2, "text": "视频库",children:[{"id":21,"text":"电影"},{"id":22,"text":"电视剧"}]},{"id":3,"text":"课程中心库"},{"id":4,"text":"精品课程库"},{"id":5,"text":"虚拟仿真库"}]);
        $('#modify_auth_dlg').dialog('open');
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initAddDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#modify_auth_dlg .department_tree").combotree('loadData', formatTreeData(data));
        } else {
            alert(obj.msg);
        }
    });
}

function formatTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.children = formatTreeData(obj.children);
        }
        fin.push(obj);
    }
    return fin;
}

/*

function addAuth(){
    $('#add_auth_dlg').dialog('open');
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
*/
