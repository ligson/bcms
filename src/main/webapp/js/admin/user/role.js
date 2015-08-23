$(function () {
    initRoleTree();
    $('#role_auth_grid').datagrid({
        title: '角色对应权限列表',
        pageSize: 30,
        columns: [[
            {field: 'id', title: 'ID', width: '5%'},
            {field: 'name', title: '权限名称', width: '40%', align: 'center'},
            {field: 'codename', title: '权限缩写', width: '35%', align: 'center'},
            {
                field: '_operate', width: '15%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="clickModifyRole();">移除权限</a>';
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        singleSelect: false
    });
});

function clickAddRole(){
    initAuthCombobox();
    initAddDepartmentTree();
    $("#add_role_dlg .resourcelib_tree").combotree('loadData', [{"id": 1, "text": "案例库",children:[{"id":11,"text":"分类1"}]}, {"id": 2, "text": "视频库",children:[{"id":21,"text":"电影"},{"id":22,"text":"电视剧"}]},{"id":3,"text":"课程中心库"},{"id":4,"text":"精品课程库"},{"id":5,"text":"虚拟仿真库"}]);
    $('#add_role_dlg').dialog('open');
}

function clickModifyRole(){
    var node=$('#role_tree').tree('getSelected');
    if(node) {
        initModify(node);
        initModifyDepartmentTree();
        $("#modify_role_dlg .resourcelib_tree").combotree('loadData', [{"id": 1, "text": "案例库",children:[{"id":11,"text":"分类1"}]}, {"id": 2, "text": "视频库",children:[{"id":21,"text":"电影"},{"id":22,"text":"电视剧"}]},{"id":3,"text":"课程中心库"},{"id":4,"text":"精品课程库"},{"id":5,"text":"虚拟仿真库"}]);
        $('#modify_role_dlg').dialog('open').dialog('setTitle', '编辑角色');;
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModify(node) {
    $("#modify_role_dlg input[name=id]").val(node.id);
    $("#modify_role_dlg input[name=name]").val(node.name);
    $.get("/bcms/proxy", {url: "permission/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#modify_role_dlg .easyui-combobox").combobox('loadData', data);
            var t=[];
            for(var i=0;i<node.permissions.length;i++){
                t[i]=node.permissions[i].id;
            }
            $("#modify_role_dlg .easyui-combobox").combobox('setValues', t);
        } else {
            $.message.alert("提示",obj.msg,"info");
        }
    });


}

function initAuthCombobox(){
    $.get("/bcms/proxy", {url: "permission/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var obj = jQuery.parseJSON(obj.data);
            $("#add_role_dlg .easyui-combobox").combobox('loadData',obj);
        } else {
            alert(obj.msg);
        }
    });
}

function initAddDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#add_role_dlg .department_tree").combotree('loadData', formatTreeData(data));
        } else {
            alert(obj.msg);
        }
    });
}

function initModifyDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#modify_role_dlg .department_tree").combotree('loadData', formatTreeData(data));
        } else {
            alert(obj.msg);
        }
    });
}
function initRoleTree() {
    $.post("/bcms/proxy", {method:"get",url: "role/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        console.log(obj);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            $("#role_tree").tree({data: handle(data), onClick: function () {
                initAuthGridByNode();
            }
            });
        } else {
            alert(obj.msg);
        }
    });
}

function initAuthGridByNode(){
    var node = $('#role_tree').tree('getSelected');
    $("#role_auth_grid").datagrid('loadData',node.permissions);
}

function saveRole(){
    var name = $("#add_role_dlg input[name=name]").val();
    var auths = $('#add_role_dlg .easyui-combobox').combobox('getValues');
    $.post("/bcms/proxy", {method:"post",url: "role/",dataType:"json", name: name, permission_ids:auths.toString()}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#add_role_dlg').dialog('close');
            initRoleTree();
        } else {
            $('#add_role_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        }
    });
}

function modifyRole(){
    var id= $("#modify_role_dlg input[name=id]").val();
    var name = $("#modify_role_dlg input[name=name]").val();
    var auths = $('#modify_role_dlg .easyui-combobox').combobox('getValues');
    $.post("/bcms/proxy", {method:"put",url: "role/"+id, name: name, permission_ids:auths.toString()}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#modify_role_dlg').dialog('close');
            initRoleTree();
            $("#role_auth_grid").datagrid('loadData', {total: 0, rows: []});
        } else {
            $('#modify_role_dlg').dialog('close');
            alert(obj.msg);
        }
    });

}

function delRole() {
    var node = $('#role_tree').tree('getSelected');
    if (node) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/bcms/proxy", {method: "delete", url: "role/" + node.id + "/"}, function (result) {
                    var obj = jQuery.parseJSON(result);
                    if (obj.success) {
                        $('#role_tree').tree('remove', node.target);
                        $("#auth_table").datagrid('loadData', {total: 0, rows: []});
                    } else {
                        alert(obj.msg);
                    }
                });
            }
        });
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
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



