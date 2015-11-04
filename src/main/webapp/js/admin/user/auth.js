var department_tree;
$(function () {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
        } else {
            department_tree= formatDepartmentTreeData(obj);
        }
    });
    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url: "/bcms/proxy?url=permission&method=GET",
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'10%',align:'center',title:'权限名称'},
            {
                field: 'department', width: '25%', align: 'center', title: '目标部门',
                formatter: function (value, row, index) {
                    var department_ids=[];
                    if (row.targets.length > 0) {
                        for (var i = 0; i < row.targets.length; i++) {
                            if (row.targets[i].target_kind == 1) {
                                department_ids.push(row.targets[i].target_id);
                            }
                        }
                    }
                    return department_ids.toString();
                }
            },
            {
                field: 'resource_lib', width: '25%', align: 'center', title: '目标资源库',
                formatter: function (value, row, index) {
                    var resource_lib_ids=[];
                    if(row.targets.length>0){
                        for(var i=0;i<row.targets.length;i++){
                            if(row.targets[i].target_kind==2){
                                resource_lib_ids.push(row.targets[i].target_id);
                            }
                        }
                    }
                    return resource_lib_ids.toString();
                }
            },
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
        var department_ids=[];
        var resource_lib_ids=[];
        if(row.targets.length>0){
            for(var i=0;i<row.targets.length;i++){
                if(row.targets[i].target_kind==1){
                    department_ids.push(row.targets[i].target_id);
                }else if(row.targets[i].target_kind==2){
                    resource_lib_ids.push(row.targets[i].target_id);
                }
            }
         $('#modify_auth_dlg .department_tree').combotree('setValues',department_ids);
         $("#modify_auth_dlg .resourcelib_tree").combotree('setValues',resource_lib_ids);
        }
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
        multiple:true,
        loadFilter: function (data) {
            return formatDepartmentTreeData(data.rows);
        }
    });
}

function initAddResourcelibraryTree() {
    $( '#add_auth_dlg .resourcelib_tree' ).combotree ({
        url: "/bcms/proxy?url=resourcelibrary&method=GET",
        lines: true,
        multiple:true,
        loadFilter: function (data) {
            return formatDepartmentTreeData(data.rows);
        }
    });
}

function initModifyDepartmentTree() {
    $( '#modify_auth_dlg .department_tree' ).combotree ({
        data: department_tree,
        multiple:true,
        lines: true
    });
}

function initAddDepartmentTree() {
    $( '#add_auth_dlg .department_tree' ).combotree ({
        data: department_tree,
        lines: true,
        multiple:true
    });
}

function formatDepartmentTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.state="closed";
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
    var id= $("#modify_auth_dlg input[name=id]").val();
    var name = $("#modify_auth_dlg input[name=name]").val();
    var description = $('#modify_auth_dlg input[name=description]').val();
    var department_ids=$('#modify_auth_dlg .department_tree').combotree('getValues');
    var resourcelib_ids=$("#modify_auth_dlg .resourcelib_tree").combotree('getValues');
    var targets=[];
    if(department_ids.length>0){
        for(var i=0;i<department_ids.length;i++){
            var target=new Object();
            target.target_kind=1;
            target.target_id =department_ids[i];
            target.action=1;
            targets.push(target);
        }
    }
    if(resourcelib_ids.length>0){
        for(var i=0;i<resourcelib_ids.length;i++){
            var target=new Object();
            target.target_kind=2;
            target.target_id =resourcelib_ids[i];
            target.action=1;
            targets.push(target);
        }
    }
    $.post("/bcms/proxy", {method:"put",url: "permission/"+id, name: name, description:description,targets:JSON.stringify(targets)}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#modify_auth_dlg').dialog('close');
            $.messager.alert("提示",obj.msg,"info");
        } else {
            $('#modify_auth_dlg').dialog('close');

        }
    });
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
    var name = $("#add_auth_dlg input[name=name]").val();
    var department_ids=$('#add_auth_dlg .department_tree').combotree('getValues');
    var resourcelib_ids=$("#add_auth_dlg .resourcelib_tree").combotree('getValues');
    var description = $('#add_auth_dlg input[name=description]').val();
    var targets=[];
    if(department_ids.length>0){
        for(var i=0;i<department_ids.length;i++){
            var target=new Object();
            target.target_kind=1;
            target.target_id =department_ids[i];
            target.action=1;
            targets.push(target);
        }
    }
    if(resourcelib_ids.length>0){
        for(var i=0;i<resourcelib_ids.length;i++){
            var target=new Object();
            target.target_kind=2;
            target.target_id =resourcelib_ids[i];
            target.action=1;
            targets.push(target);
        }
    }
    $.post("/bcms/proxy", {method:"post",url: "permission/", name: name, description: description,targets:JSON.stringify(targets)}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $('#add_auth_dlg').dialog('close');
        }
    });

}

