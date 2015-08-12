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
            {field:'_operate',width:'15%',align:'center',formatter:formatOper,title:'操作'}
        ]]
    });
    initUserGrid();
});

function initUserGrid() {
    $.post("/index/httpGet", {url: "user/"}, function (result) {
        if (result.success) {
            var obj = jQuery.parseJSON(result.data);
            var json = {total: obj.length, rows: obj};
            $("#user_table").datagrid('loadData', json);
        } else {
            alert(result.msg);
        }
    });
}

function clickAddUser(){
    $('#add_user_dlg').dialog('open');
    initGroupCombotree();
}

function addUser(){
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
    $.post("/index/httpPost", {url: "user/", username: username, password:password,email:email,phone:phone,groups:groups.toString(),id_card:id_card,gender:gender,grade:grade,disk_size:disk_size,description:description}, function (result) {
        if (result.success) {
            $('#add_user_dlg').dialog('close');
            initUserGrid();
        } else {
            $('#add_user_dlg').dialog('close');
            alert(result.msg);
        }
    });
}

function initGroupCombotree(){
    $("#add_user_dlg .gender_combobox").combobox('loadData',[{"id":1,"text":"男"},{"id":2,"text":"女"}]);
    $("#add_user_dlg .grade_combobox").combobox('loadData',[{'id':1,'text':'大专'},{'id':2,'text':'本科'},{'id':3,'text':'研究生'},{'id':4,'text':'博士生'},{'id':5,'text':'其他',"selected":true }]);
    $.post("/index/httpGet", {url: "group/"}, function (data) {
        if (data.success) {
            var obj = $.parseJSON(data.data);
            $("#add_user_dlg .group_tree").combotree('loadData',handle(obj));
        }else {
            alert(data.msg);
        }
    });
}

function delUsers(){
    var rows = $('#user_table').datagrid("getSelections");
    if (rows.length > 0) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                for (var i = 0; i < rows.length; i++) {
                    $.post("/index/httpDelete", {url: "user/" + rows[i].id + "/"}, function (result) {
                        if (result.success) {
                            var index = $('#user_table').datagrid('getRowIndex', rows[i]);//获取某行的行号
                            $('#user_table').datagrid('deleteRow', index);	//通过行号移除该行
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

function formatGroup(val, row) {
    var result="";
    for(var i=0;i<val.length;i++){
        result+=""+val[i].name+"";
    }
    return result;
}

function formatOper(val, row, index) {
    return '<a class="tablelink" href="#" onclick="editUser(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
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
