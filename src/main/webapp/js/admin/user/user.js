$(function () {
    $('#user_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        toolbar:"#tb",
        pagination:true,
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
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
            {field:'groups',width:'20%',align:'center',formatter:formatGroup,title:'用户组'},
            {field:'_operate',width:'10%',align:'center',title:'操作',
                 formatter: function (value, row,index) {
                     return '<a class="tablelink" href="#" onclick="editUser('+ index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                 }
            }
        ]]
    });

    initUserGrid();
});

function initUserGrid() {
    $.post("/bcms/proxy", {method:"get",url: "user/"}, function (result) {
        var data = jQuery.parseJSON(result);
        if (data.success==false) {
            alert(data.msg);
        } else {
            var json = {total: data.length, rows: data};
            $("#user_table").datagrid('loadData', json);
        }
    });
}

function newUser(){
    initAddGroupCombotree();
    initAddDepartmentCombotree();
    $("#add_user_dlg").dialog("open").dialog('setTitle', '添加新用户');
    $("#add_user_from").form("clear");
}

function saveUser(){
    var username = $("#add_user_dlg input[name=name]").val();
    var password = $('#add_user_dlg input[name=password]').val();
    var email = $('#add_user_dlg input[name=email]').val();
    var phone = $('#add_user_dlg input[name=phone]').val();
    var cn_name=$("#add_user_dlg input[name=cn_name]").val();
    var groups = $('#add_user_dlg .group_tree').combotree('getValues');
    var gender=$("#add_user_dlg .gender_combobox").combobox("getValue");
    //var grade=$("#add_user_dlg .grade_combobox").combobox("getValue");
    var disk_size=$('#add_user_dlg input[name=disk_size]').val();
    var description=$('#add_user_dlg input[name=description]').val();
    var identity=$('#add_user_dlg .identity_combobox').combobox("getValue");
    var number=$('#add_user_dlg input[name=number]').val();
    var department_id=$('#add_user_dlg .department_tree').combotree("getValue");
    $.post("/bcms/proxy", {method:"post",url: "user/",number:number,identity:identity,department_id:department_id, username: username,cn_name:cn_name, password:password,email:email,phone:phone,group_ids:JSON.stringify(groups),gender:gender,disk_size:disk_size,description:description}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#add_user_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#add_user_dlg').dialog('close');
            initUserGrid();
        }
    });
}

function editUser(index){
    $('#user_table').datagrid('selectRow', index);
    var row = $('#user_table').datagrid('getSelected');
    if (row) {
        initModify(row);
        $('#modify_user_dlg').dialog('open');
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModify(row) {
    $("#modify_user_form").form("clear");
    $("#modify_user_dlg input[name=id]").val(row.id);
    $("#modify_user_dlg input[name=name]").val(row.username);
    $("#modify_user_dlg input[name=cn_name]").val(row.cn_name);
    $('#modify_user_dlg input[name=email]').val(row.email);
    $('#modify_user_dlg input[name=phone]').val(row.phone);
    $('#modify_user_dlg input[name=number]').val(row.number);
    $("#modify_user_dlg .identity_combobox").combobox('loadData', [{"id": 1, "text": "学生"}, {"id": 2, "text": "老师"}]);
    $("#modify_user_dlg .identity_combobox").combobox('setValues', [row.identity]);
    $("#modify_user_dlg .gender_combobox").combobox('loadData', [{"id": 1, "text": "男"}, {"id": 2, "text": "女"}]);
    $("#modify_user_dlg .gender_combobox").combobox('setValues', [row.gender]);
    $('#modify_user_dlg input[name=id_card]').val(row.id_card);
    $('#modify_user_dlg input[name=disk_size]').val(row.disk_size);
    $('#modify_user_dlg input[name=description]').val(row.description);
    $.post("/bcms/proxy", {method: "get", url: "group/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#modify_user_dlg .group_tree").combotree('loadData', formatGroupListData(obj));
            var t = [];
            for (var i = 0; i < row.groups.length; i++) {
                t[i] = row.groups[i].id;
            }
            $("#modify_user_dlg .group_tree").combotree('setValues', t);
        }
    });
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#modify_user_dlg .department_tree").combotree('loadData', formatTreeData(obj));
            $("#modify_user_dlg .department_tree").combotree('setValue', row.department_id);
        }
    });

}

function modifyUser(){
    var id=$('#modify_user_dlg input[name=id]').val();
    var username= $('#modify_user_dlg input[name=name]').val();
    var cn_name = $('#modify_user_dlg input[name=cn_name]').val();
    var email = $('#modify_user_dlg input[name=email]').val();
    var phone = $('#modify_user_dlg input[name=phone]').val();
    var groups = $('#modify_user_dlg .group_tree').combotree('getValues');
    var gender=$("#modify_user_dlg .gender_combobox").combobox("getValue");
    var disk_size=$('#modify_user_dlg input[name=disk_size]').val();
    var description=$('#modify_user_dlg input[name=description]').val();
    var identity=$('#modify_user_dlg .identity_combobox').combobox("getValue");
    var number=$('#modify_user_dlg input[name=number]').val();
    var department_id=$('#modify_user_dlg .department_tree').combotree("getValue");
    $.post("/bcms/proxy", {method:"put",url: "user/"+id,username:username,cn_name:cn_name,identity:identity,department_id:department_id, email:email,phone:phone,group_ids:JSON.stringify(groups),number:number,gender:gender,disk_size:disk_size,description:description}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#modify_user_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#modify_user_dlg').dialog('close');
            initUserGrid();
        }
    });
}

function initAddGroupCombotree() {
    $("#add_user_dlg .identity_combobox").combobox('loadData', [{"id": 1, "text": "学生"}, {"id": 2, "text": "老师"}]);
    $("#add_user_dlg .gender_combobox").combobox('loadData', [{"id": 1, "text": "男"}, {"id": 2, "text": "女"}]);
    $.post("/bcms/proxy", {method: "get", url: "group/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#add_user_dlg .group_tree").combotree('loadData', formatGroupListData(obj));
        }
    });
}

function initAddDepartmentCombotree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#add_user_dlg .department_tree").combotree('loadData', formatTreeData(obj));
        }
    });
}

function delUsers(){
    var rows = $('#user_table').datagrid("getSelections");
    if (rows.length > 0) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                for (var i = 0; i < rows.length; i++) {
                    $.post("/bcms/proxy", {method:"delete",url: "user/" + rows[i].id + "/"}, function (result) {
                        var obj= $.parseJSON(result);
                        if (obj.success==false) {
                            alert("删除失败!");
                        } else {
                            initUserGrid();
                        }
                    });
                }
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function delUser(index){
    $('#user_table').datagrid('selectRow',index);// 关键在这里
    var row = $('#user_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "user/" + row.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        initUserGrid();
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function formatGroup(val, row) {
    var result="";
    for(var i=0;i<val.length;i++){
        result+="<span>"+val[i].name+"<span>";
    }
    return result;
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

function formatDepartmentTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.children = formatDepartmentTreeData(obj.children);
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