$(function () {

    $('#user_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'10%',checkbox:true,title:'ID'},
            {field:'id_card',width:'15%',title:'编号'},
            {field:'username',width:'10%',align:'center',title:'姓名'},
            {field:'email',width:'10%',align:'center',title:'邮箱'},
            {field:'department',width:'10%',align:'center',title:'单位'},
            {field:'phone',width:'10%',align:'center',title:'电话'},
            {field:'groups',width:'25%',align:'center',formatter:formatGroup,title:'用户组'},
            {field:'_operate',width:'15%',align:'center',title:'操作',
                 formatter: function (value, row,index) {
                     return '<a class="tablelink" href="#" onclick="editUser('+ index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                 }
            }
        ]],
        toolbar:[{
            text:'添加',iconCls:'icon-add',handler:function(){
                newUser();
            }
        },
            {text:'删除',iconCls:'icon-cancel',handler:function(){
                delUsers();
            }
            }
        ]
    });
    initUserGrid();
});

function initUserGrid() {
    $.get("/bcms/proxy", {url: "user/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var obj = jQuery.parseJSON(obj.data);
            var json = {total: obj.length, rows: obj};
            $("#user_table").datagrid('loadData', json);
        } else {
            alert(obj.msg);
        }
    });
}

function newUser(){
    initAddGroupCombotree();
    $("#add_user_dlg").dialog("open").dialog('setTitle', '添加新用户');
    $("#add_user_from").form("clear");
}

function saveUser(){
    var username = $("#add_user_dlg input[name=name]").val();
    var password = $('#add_user_dlg input[name=password]').val();
    var email = $('#add_user_dlg input[name=email]').val();
    var phone = $('#add_user_dlg input[name=phone]').val();
    var groups = $('#add_user_dlg .group_tree').combotree('getValues');
    var id_card=$('#add_user_dlg input[name=id_card]').val();
    var gender=$("#add_user_dlg .gender_combobox").combobox("getValue");
    var grade=$("#add_user_dlg .grade_combobox").combobox("getValue");
    var disk_size=$('#add_user_dlg input[name=disk_size]').val();
    var description=$('#add_user_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"post",url: "user/", username: username, password:password,email:email,phone:phone,groups:groups.toString(),id_card:id_card,gender:gender,grade:grade,disk_size:disk_size,description:description}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success) {
            $('#add_user_dlg').dialog('close');
            initUserGrid();
        } else {
            $('#add_user_dlg').dialog('close');
            alert(obj.msg);
        }
    });
}

function editUser(index){
    $('#user_table').datagrid('selectRow',index);// 关键在这里
    var row = $('#user_table').datagrid('getSelected');
    if(row) {
        initModify(row);
        $('#modify_user_dlg').dialog('open');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModify(row) {
$("#modify_user_form").form("clear");
    $("#modify_user_dlg input[name=id]").val(row.id);
    $("#modify_user_dlg input[name=name]").val(row.username);
    $('#modify_user_dlg input[name=email]').val(row.email);
    $('#modify_user_dlg input[name=phone]').val(row.phone);
    $("#modify_user_dlg .gender_combobox").combobox('loadData', [{"id": 1, "text": "男"}, {"id": 2, "text": "女"}]);
    $("#modify_user_dlg .gender_combobox").combobox('setValues', [row.gender]);
    $("#modify_user_dlg .grade_combobox").combobox('loadData', [{'id': 1, 'text': '大专'}, {
        'id': 2,
        'text': '本科'
    }, {'id': 3, 'text': '研究生'}, {'id': 4, 'text': '博士生'}, {'id': 5, 'text': '其他', "selected": true}]);
    $("#modify_user_dlg .grade_combobox").combobox('setValues', [row.grade]);
    $('#modify_user_dlg input[name=id_card]').val(row.id_card);
    $('#modify_user_dlg input[name=disk_size]').val(row.disk_size);
    $('#modify_user_dlg input[name=description]').val(row.description);
    $.post("/bcms/proxy", {method:"get",url: "group/"}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#modify_user_dlg .group_tree").combotree('loadData',handle(data));
            var t = [];
            for (var i = 0; i < row.groups.length; i++) {
                t[i] = row.groups[i].id;
            }
            console.log(t);
            $("#modify_user_dlg .group_tree").combotree('setValues', t);
        }else {
            alert(obj.msg);
        }
    });
}

function modifyUser(){
    var email = $('#modify_user_dlg input[name=email]').val();
    var phone = $('#modify_user_dlg input[name=phone]').val();
    var groups = $('#modify_user_dlg .group_tree').combotree('getValues');
    var id_card=$('#modify_user_dlg input[name=id_card]').val();
    var gender=$("#modify_user_dlg .gender_combobox").combobox("getValue");
    var grade=$("#modify_user_dlg .grade_combobox").combobox("getValue");
    var disk_size=$('#modify_user_dlg input[name=disk_size]').val();
    var description=$('#modify_user_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"put",url: "user/", email:email,phone:phone,groups:groups.toString(),id_card:id_card,gender:gender,grade:grade,disk_size:disk_size,description:description}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success) {
            $('#modify_user_dlg').dialog('close');
            initUserGrid();
        } else {
            $('#modify_user_dlg').dialog('close');
            alert(obj.msg);
        }
    });
}

function initAddGroupCombotree() {
    $("#add_user_dlg .gender_combobox").combobox('loadData', [{"id": 1, "text": "男"}, {"id": 2, "text": "女"}]);
    $("#add_user_dlg .grade_combobox").combobox('loadData', [{'id': 1, 'text': '大专'}, {'id': 2, 'text': '本科'}, {
        'id': 3,
        'text': '研究生'
    }, {'id': 4, 'text': '博士生'}, {'id': 5, 'text': '其他', "selected": true}]);
    $.post("/bcms/proxy", {method: "get", url: "group/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success) {
            var data = $.parseJSON(obj.data);
            $("#add_user_dlg .group_tree").combotree('loadData', handle(data));
        } else {
            alert(obj.msg);
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
                        if (obj.success) {
                            initUserGrid();
                        } else {
                            alert("删除失败!");
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
                $.post("/bcms/proxy", {method: "delete", url: "user/" + row.id + "/"}, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success) {
                        initUserGrid();
                    } else {
                        alert("删除失败!");
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
