$(function () {
    initRoleTree();
});

function clickAddRole(){
    initAuthCombobox();
    $('#add_role_dlg').dialog('open');
}

function clickModifyRole(){
    var node=$('#role_tree').tree('getSelected');
    if(node) {
        initModify(node);
        $('#modify_role_dlg').dialog('open');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModify(node) {
    $("#modify_role_dlg input[name=id]").val(node.id);
    $("#modify_role_dlg input[name=name]").val(node.name);
    $.post("/index/httpGet", {url: "permission/"}, function (result) {
        if (result.success) {
            var obj = $.parseJSON(result.data);
            $("#modify_role_dlg .easyui-combobox").combobox('loadData', obj);
            var t=[];
            for(var i=0;i<node.permissions.length;i++){
                t[i]=node.permissions[i].id;
            }
            $("#modify_role_dlg .easyui-combobox").combobox('setValues', t);
        } else {
            alert(data.msg);
        }
    });


}

function initAuthCombobox(){
    $.post("/index/httpGet", {url: "permission/"}, function (data) {
        if (data.success) {
            var obj = $.parseJSON(data.data);
            $("#add_role_dlg .easyui-combobox").combobox('loadData',obj);
        }else {
            alert(data.msg);
        }
    });
}

function initRoleTree() {
    $.post("/index/httpGet", {url: "role/"}, function (data) {
        if (data.success) {
            var obj = $.parseJSON(data.data);
            $("#role_tree").tree({
                data: handle(obj), onClick: function (node) {
                    $("#auth_table").datagrid('loadData',node.permissions);
                }
            });
        } else {
            alert(data.msg);
        }
    });
}

function addRole(){
    var name = $("#add_role_dlg input[name=name]").val();
    var auths = $('#add_role_dlg .easyui-combobox').combobox('getValues');
    $.post("/index/addRole", {url: "role/", name: name, permission_ids:auths.toString()}, function (result) {
        if (result.success) {
            $('#add_role_dlg').dialog('close');
            initRoleTree();
        } else {
            $('#add_role_dlg').dialog('close');
            alert(result.msg);
        }
    });
}

function modifyRole(){
    var id= $("#modify_role_dlg input[name=id]").val();
    var name = $("#modify_role_dlg input[name=name]").val();
    var auths = $('#modify_role_dlg .easyui-combobox').combobox('getValues');
    $.post("/index/modifyRole", {url: "role/"+id, name: name, permission_ids:auths.toString()}, function (result) {
        if (result.success) {
            $('#modify_role_dlg').dialog('close');
            initRoleTree();
        } else {
            $('#modify_role_dlg').dialog('close');
            alert(result.msg);
        }
    });
}

function delRole(){
    var node = $('#role_tree').tree('getSelected');
    if(node){
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/index/httpDelete", {url: "role/" + node.id + "/"}, function (result) {
                    if (result.success) {
                        $('#role_tree').tree('remove', node.target);
                        $("#auth_table").datagrid('loadData', {total: 0, rows: []});
                    } else {
                        alert("删除失败!");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}



function handle(list) {
    var map = {};
    for (var i = 0; i < list.length; i++) {
        map[list[i].id] = list[i];
    }
    var fin = [];
    for (var i = 0; i < list.length; i++) {
        var obj = list[i];
        if (!obj.parent || obj.parent == null) {
            if (obj.children && obj.children.length > 0) {
                var children = obj.children;
                var childrenList = [];
                for (var j = 0; j < children.length; j++) {
                    childrenList.push(handleChildren(map[children[j]], map));
                }
                obj.children = childrenList;
            }
            obj.text = obj.name;
            fin.push(obj);
        }
    }
    return fin;
}
function handleChildren(childrenMap , map) {
    if (childrenMap.children && childrenMap.children.length > 0) {
        var children = childrenMap.children;
        var childrenList = [];
        for (var j = 0; j < children.length; j++) {
            childrenList.push(handleChildren(map[children[j]], map));
        }
        childrenMap.children = childrenList;
        childrenMap.text = childrenMap.name;
        return childrenMap;
    } else {
        var children = childrenMap.children;
        var childrenList = [];
        for (var j = 0; j < children.length; j++) {
            childrenList.push(map[children[j]]);
        }
        childrenMap.children = childrenList;
        childrenMap.text = childrenMap.name;
        return childrenMap;
    }
    return null;
}



