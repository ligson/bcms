$(function () {
    var groupTree;
    initGroupTree();
    $("#group_tabs").tabs({
        fit:true,
        plain:true
    })
    $('#group_user_grid').datagrid({
        rownumbers: true,
        title: '用户组对应用户列表',
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'10%',checkbox:true,title:'ID'},
            {field:'name',width:'10%',align:'center',title:'用户名'}
        ]]
    });

    $('#group_role_grid').datagrid({
        rownumbers: true,
        title: '用户组对应角色列表',
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'10%',checkbox:true,title:'ID'},
            {field:'name',width:'10%',align:'center',title:'用户名'}
        ]],
        toolbar:[{
            text: '添加用户组角色',
            iconCls: 'icon-add',
            handler: function () {
                clickAddGroupRole();
            }
        }]
    });

});


function initGroupTree() {
    $.get("/bcms/proxy", {url: "group/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var obj = jQuery.parseJSON(obj.data);
            groupTree = formatGroupListData(obj);
            $("#group_tree").tree({
                data: groupTree, onClick: function (node) {
                    initGridByGroup(node);
                }
            });
        } else {
            alert(obj.msg);
        }
    });
}


function initGridByGroup(node){
    var user_json = {total: node.users.length, rows: node.users};
    var role_json={total:node.roles.length,rows:node.roles};
    $("#group_role_grid").datagrid('loadData',role_json);
    $("#group_user_grid").datagrid('loadData',user_json);
}

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
        if (obj.success) {
            $('#add_group_dlg').dialog('close');
            initGroupTree();
        } else {
            $('#add_group_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        }
    });
}

function saveGroupRole(){
    var role_id = $("#add_group_role_dlg .role_tree").combotree("getValue");
    var group_id= $("#add_group_role_dlg input[name=group_id]").val();
    $.post("/bcms/proxy", {method:"post",url: "group/"+group_id+"/role/"+role_id}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            initGroupTree();
            $('#add_group_role_dlg').dialog('close');
            $.message.alert("提示","保存成功！","info");
            var groupNode=$("#group_tree").tree("find",group_id);
            console.log(groupNode);
            $('#group_tree').tree('select',groupNode.target);
            initGridByGroup(groupNode);
        } else {
            $('#add_group_role_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        }
    });
}

function modifyGroup(){
    var id= $("#modify_group_dlg input[name=id]").val();
    var name = $("#modify_group_dlg input[name=name]").val();
    $.post("/bcms/proxy", {method:"put",url: "group/"+id, name: name}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#modify_group_dlg').dialog('close');
            initGroupTree();
        } else {
            $('#modify_group_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        }
    });
}

function initRoleTree() {
    $.post("/bcms/proxy", {method:"get",url: "role/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            $('#add_group_role_dlg .role_tree').combotree('loadData', formatGroupListData(data));
        } else {
            alert(obj.msg);
        }
    });
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