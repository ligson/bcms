$(function () {
    var groupTree;
    initGroupTree();
    $('#group_user_grid').datagrid({
        rownumbers: true,
        title: '用户组对应用户列表',
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'10%',checkbox:true,title:'ID'},
            {field:'name',width:'10%',align:'center',title:'用户名'}
/*            {field:'gender',width:'5%',align:'center',title:'性别',
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
            {field:'groups',width:'25%',align:'center',formatter:formatGroup,title:'用户组'},
            {field:'_operate',width:'15%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editUser('+ index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                }
            }*/
        ]]
    });

    $('#group_role_grid').datagrid({
        title: '用户组对应角色列表',
        iconCls: 'icon-save',
        sortOrder: 'desc',
        pageSize: 30,
        columns: [[
            {field: 'id', title: 'ID', width: '5%'},
            {field: 'name', title: '用户组名称', width: '20%', align: 'center'},
            {
                field: '_operate', width: '15%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="delUser(' + index + ')">移除角色</a>';
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        singleSelect: false
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
    var role_json={total:node.roles.length,row:node.roles};
    $("#group_user_grid").datagrid('loadData',user_json);
    $("#group_role_grid").datagrid('loadData',role_json);
}

function clickAddGroup(){
    $("#add_group_dlg .roles").combobox({data: groupTree});
    $('#add_group_dlg').dialog('open');
}

function clickModifyGroup(){
    var node=$('#group_tree').tree('getSelected');
    if(node) {
        initModifyGroup(node);
        $("#modify_group_dlg").dialog("open");
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initModifyGroup(node){

}

function addGroup(){

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