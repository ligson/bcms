$(function () {
    var groupTree;
    //initGroupTree();
    $("#group_tabs").tabs({
        fit:true,
        plain:true
    });
    $("#group_tree").tree({
        url: "/bcms/proxy?url=group&method=GET",
        lines: true,
        loadFilter: function (data) {
            return formatGroupListData(data);
        },
        onClick: function (node) {
            $('#group_user_grid').datagrid({
                rownumbers: true,
                url: "/bcms/proxy?url=user&method=GET&group_id="+node.id,
                singleSelect:false,
                pagination:true,
                columns:[[
                    {field:'id',width:'10%',checkbox:true,title:'ID'},
                    {field:'username',width:'10%',align:'center',title:'用户名'},
                    {field:'cn_name',width:'10%',align:'center',title:'中文名'},
                    {field:'number',width:'10%',align:'center',title:'编号'},
                    {field:'gender',width:'5%',align:'center',title:'性别',
                        formatter: function (value,row,index) {
                            var result = "";
                            if (value == "1") {
                                result = "男"
                            } else {
                                result = "女"
                            }
                            return result;
                        }
                    },
                    {field:'email',width:'10%',align:'center',title:'邮箱'},
                    {field:'department_id',width:'10%',align:'center',title:'部门'},
                    {field:'phone',width:'10%',align:'center',title:'电话'},
                ]],
                toolbar:[{
                    text: '用户管理',
                    iconCls: 'icon-add',
                    handler: function () {
                        clickAddGroupUser();
                    }
                }]
            });

            $('#group_role_grid').datagrid({
                rownumbers: true,
                singleSelect:false,
                pagination:true,
                url: "/bcms/proxy?url=role&method=GET&group_id="+node.id,
                columns:[[
                    {field:'id',width:'10%',checkbox:true,title:'ID'},
                    {field:'name',width:'10%',align:'center',title:'角色名'},
                    {field:'_operate',width:'10%',align:'center',title:'操作',
                        formatter: function (value, row,index) {
                            return '<a class="tablelink" href="#" onclick="delGroupRole(' + index + ')">移除</a>';
                        }
                    }
                ]],
                toolbar:[{
                    text: '添加用户组角色',
                    iconCls: 'icon-add',
                    handler: function () {
                        clickAddGroupRole();
                    }
                }]
            });
        }
    });


});


function clickAddGroup(){
    $('#add_group_dlg').dialog('open').dialog("setTitle","添加用户组");
}

function clickAddGroupRole(){
    var node=$('#group_tree').tree('getSelected');
    if(node){
        initRoleTree();
        $("#add_group_role_dlg input[name=name]").val(node.name);
        $("#add_group_role_dlg input[name=group_id]").val(node.id);
        $('#add_group_role_dlg').dialog('open').dialog("setTitle","添加用户组角色");
    }else{
        $.messager.alert("提示", "请选择左侧用户组后再操作！", "info");
        return;
    }
}

function clickAddGroupUser(){
    $('#user_list').datalist({data:[]});
    var node=$('#group_tree').tree('getSelected');
    if(node){
        $('#add_group_user_dlg').dialog('open').dialog("setTitle","用户组用户管理");
        initDepartmentSelectUsers(node);
        initDepartmentTree(node);
    }else{
        $.messager.alert("提示", "请选择左侧用户组后再操作！", "info");
        return;
    }
}

function initDepartmentTree(node) {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#add_group_user_dlg #department_tree").tree({
                data: formatTreeData(obj), onClick: function (node) {
                    initUserListByDepartment(node);
                }
            });
        }
    });
}

function initDepartmentSelectUsers(node) {
    $("#select_user_list").datalist({
        textField: 'cn_name',
        valueField: 'id',
        data: node.users
    });
}

function initUserListByDepartment(node) {
    $.post("/bcms/proxy", {method: "get", url: "user/",department_id: node.id,page:1,rows:10000}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            var rows = $('#select_user_list').datalist("getData").rows;
            for (var j = 0; j < rows.length; j++) {
                for (var x = 0; x < obj.rows.length; x++) {
                    if (rows[j].id == obj.rows[x].id) {
                        obj.rows[x].checked = true;
                    }
                }
            }
            $("#add_group_user_dlg #user_list").datalist({
                checkbox: true,
                singleSelect:false,
                textField: 'cn_name',
                valueField: 'id',
                data: obj,
                onCheck: function (index, row) {
                    $("#select_user_list").datalist('appendRow', {'id': row.id, 'cn_name': row.cn_name});
                },
                onUncheck:function(index,row) {
                    var rows = $("#select_user_list").datalist('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].id == row.id) {
                            var sIndex = $("#select_user_list").datalist('getRowIndex', rows[i]);
                            $("#select_user_list").datalist('deleteRow', sIndex);
                        }
                    }
                }
            });
        }
    });
}

function clickModifyGroup(){
    var node=$('#group_tree').tree('getSelected');
    if(node) {
        initModifyGroup(node);
        $("#modify_group_dlg").dialog("open").dialog("setTitle","编辑用户组");;
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModifyGroup(node){
    $("#modify_group_dlg input[name=name]").val(node.name);
    $("#modify_group_dlg input[name=id]").val(node.id);
}

function saveGroup(){
    var name = $("#add_group_dlg input[name=name]").val();
    $.post("/bcms/proxy", {method:"post",url: "group/", name: name}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#add_group_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#add_group_dlg').dialog('close');
            $("#group_tree").tree("reload");
        }
    });
}

function saveGroupRole(){
    var role_id = $("#add_group_role_dlg .role_tree").combotree("getValue");
    var group_id= $("#add_group_role_dlg input[name=group_id]").val();
    $.post("/bcms/proxy", {method:"post",url: "group/"+group_id+"/role/"+role_id}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#add_group_role_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#add_group_role_dlg').dialog('close');
            $("#group_role_grid").datagrid('reload');
        }
    });
}

function modifyGroup(){
    var id= $("#modify_group_dlg input[name=id]").val();
    var name = $("#modify_group_dlg input[name=name]").val();
    $.post("/bcms/proxy", {method:"put",url: "group/"+id, name: name}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#modify_group_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#modify_group_dlg').dialog('close');
            $("#group_tree").tree("reload");
        }
    });
}

function initRoleTree() {
    $.post("/bcms/proxy", {method:"get",url: "role/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $('#add_group_role_dlg .role_tree').combotree('loadData', formatGroupListData(obj.rows));
        }
    });
}

function delGroupRole(index){
    var node=$('#group_tree').tree('getSelected');
    $('#group_role_grid').datagrid('selectRow',index);
    var row = $('#group_role_grid').datagrid('getSelected');
    if(node) {
        if (row) {
            $.messager.confirm('确认', '确认删除?', function (data) {
                if (data) {
                    $.post("/bcms/proxy", {
                        method: "delete",
                        url: "group/" + node.id + "/role/" + row.id
                    }, function (result) {
                        var obj = jQuery.parseJSON(result);
                        if (obj.success==false) {
                            $.message.alert("提示", obj.msg, "info");
                        } else {
                            $("#group_role_grid").datagrid('reload');
                        }
                    });
                }
            });
        } else {
            $.messager.alert("提示", "请选择要移除的行！", "info");
            return;
        }
    }else {
        $.messager.alert("提示", "请选择左侧用户组后再操作！", "info");
        return;
    }
}

function delGroup(){
    var node = $('#group_tree').tree('getSelected');
    if (node) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/bcms/proxy", {method: "delete", url: "group/" + node.id + "/"}, function (result) {
                    var obj = jQuery.parseJSON(result);
                    if (obj.success==false) {
                        alert(obj.msg);
                    } else {
                        $("#group_tree").tree("reload");
                    }
                });
            }
        });
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function saveGroupUser(){
    var rows = $('#select_user_list').datalist("getData").rows;
    var node = $('#group_tree').tree('getSelected');
    var uids=[];
    for(var i=0;i<rows.length;i++){
        uids.push(rows[i].id);
    }
    $.post("/bcms/proxy", {method:"put",url: "group/"+node.id, name: node.name,user_ids:JSON.stringify(uids)}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#add_group_user_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#add_group_user_dlg').dialog('close');
            $("#group_user_grid").datagrid('reload');
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

function formatGroupListData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        obj.children=[];
        fin.push(obj);
    }
    return fin;
}


function formatGroup(val, row) {
    var result="";
    for(var i=0;i<val.length;i++){
        result+="<span>"+val[i].name+"<span>";
    }
    return result;
}