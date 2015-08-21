/**
 * Created by Ruby on 2015/8/18.
 */
$(function () {
    var departmentTree;
    initDepartmentTree();
    $('#department_user_grid').datagrid({
        rownumbers: true,
        singleSelect: false,
        pagination: true,
        columns: [[
            {field: 'id', width: '10%', checkbox: true, title: 'ID'},
            {field: 'id_card', width: '15%', title: '编号'},
            {field: 'username', width: '10%', align: 'center', title: '姓名'},
            {field: 'email', width: '10%', align: 'center', title: '邮箱'},
            {field: 'department', width: '10%', align: 'center', title: '单位'},
            {field: 'phone', width: '10%', align: 'center', title: '电话'},
            {field: 'groups', width: '25%', align: 'center', formatter: formatGroup, title: '用户组'},
            {
                field: '_operate', width: '15%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="editUser(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                }
            }
        ]],
        toolbar: [{
            text: '添加',
            iconCls: 'icon-add',
            handler: function () {
            }
        },
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                }
            }
        ]
    });
});

function initDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            departmentTree = formatTreeData(data)
            $("#department_tree").tree({
                data: departmentTree, onClick: function (node) {
                    initUserGridByDepartment(node);
                }
            });
        } else {
            alert(obj.msg);
        }
    });
}

function initUserGridByDepartment(node){
    if(node){

        //$("#department_user_grid").datagrid('loadData',node);

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

function formatGroup(val, row) {
    var result="";
    for(var i=0;i<val.length;i++){
        result+="<span>"+val[i].name+"<span>";
    }
    return result;
}

function clickAddDepartment(){
    $('#add_department_dlg .department_tree').combotree('loadData', departmentTree);
    $('#add_department_dlg').dialog('open');
}

function clickModifyDepartment(){
    $('#modify_department_dlg').dialog('open');
}

function initMoidfyDepartment(){

}

function saveDepartment(){
    var name = $("#add_department_dlg input[name=name]").val();
    var parent_id=$("#add_department_dlg .department_tree").combotree("getValue");
    $.post("/bcms/proxy", {method:"post",url: "department/",dataType:"json",  name: name,parent_id:parent_id}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#add_department_dlg').dialog('close');
            initDepartmentTree();
        } else {
            $('#add_department_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        }
    });
}

function modifyGroup(){

}