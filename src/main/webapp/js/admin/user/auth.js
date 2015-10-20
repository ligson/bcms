$(function () {

    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url: "/bcms/proxy?url=permission&method=GET",
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'10%',align:'center',title:'权限名称'},
            {field:'department',width:'25%',align:'center',title:'目标部门'},
            {field:'resource_lib',width:'25%',align:'center',title:'目标资源库'},
            {field:'description',width:'25%',align:'center',title:'备注'},
            {field:'_operate',width:'7%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editAuth('+ index + ')">修改</a>';
                }
            }
        ]],
        toolbar:[{
            text:'添加权限',iconCls:'icon-add',handler:function(){
                addAuth();
            }
        }]
    });

});

function editAuth(index) {
    $('#auth_table').datagrid('selectRow', index);
    var row = $('#auth_table').datagrid('getSelected');
    if (row) {
        $("#modify_auth_dlg input[name=id]").val(row.id);
        $("#modify_auth_dlg input[name=name]").val(row.name);
        $("#modify_auth_dlg input[name=description]").val(row.description);
        initModifyDepartmentTree();
        initModifyResourcelibraryTree();
        $('#modify_auth_dlg').dialog('open').dialog("setTitle","添加权限");
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModifyResourcelibraryTree() {
    $( '#modify_auth_dlg .resourcelib_tree' ).combotree ({
        url: "/bcms/proxy?url=resourcelibrary&method=GET",
        lines: true,
        formatter: function (node) {
            return node.name;
        },
        loadFilter: function (data) {
            return data.rows;
        }
    });
}

function initAddResourcelibraryTree() {
    $( '#add_auth_dlg .resourcelib_tree' ).combotree ({
        url: "/bcms/proxy?url=resourcelibrary&method=GET",
        lines: true,
        formatter: function (node) {
            return node.name;
        },
        loadFilter: function (data) {
            return data.rows;
        }
    });
}

function initModifyDepartmentTree() {
    $( '#modify_auth_dlg .department_tree' ).combotree ({
        url: "/bcms/departmentTree",
        lines: true,
        loadFilter: function (data) {
            return formatDepartmentTreeData(data);
        }
    });
}

function initAddDepartmentTree() {
    $( '#add_auth_dlg .department_tree' ).combotree ({
        url: "/bcms/departmentTree",
        lines: true,
        loadFilter: function (data) {
            return formatDepartmentTreeData(data);
        }
    });
}

function formatDepartmentTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        obj.state="closed";
        if (obj.children && obj.children.length > 0) {
            obj.children = formatDepartmentTreeData(obj.children);
        }
        fin.push(obj);
    }
    return fin;
}

function addAuth(){
    initAddDepartmentTree();
    initAddResourcelibraryTree();
    $('#add_auth_dlg').dialog('open').dialog("setTitle","添加权限");
}








function modifyAuth(){
    /*var id= $("#modify_auth_dlg input[name=id]").val();
    var name = $("#modify_auth_dlg input[name=name]").val();
    var description = $('#modify_auth_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"put",url: "permission/"+id, name: name, description:description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#modify_auth_dlg').dialog('close');
            initAuthGrid();
        } else {*/
            $('#modify_auth_dlg').dialog('close');
           /* $.messager.alert("提示",obj.msg,"info");
        }
    });*/
}

/*function delAuth(index) {
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
}*/

function saveAuth() {
   /* var id= $("#add_auth_dlg input[name=id]").val();
    var name = $("#add_auth_dlg input[name=name]").val();
    var description = $('#add_auth_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"post",url: "permission/", name: name, description: description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#add_auth_dlg').dialog('close');
            initAuthGrid();
        } else {*/
            $('#add_auth_dlg').dialog('close');
          /*  alert(obj.msg);
        }
    });*/

}

