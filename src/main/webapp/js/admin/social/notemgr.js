/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#note_table').datagrid({
        rownumbers: true,
        singleSelect: true,
        pagination: true,
        toolbar:"#tb",
        url: "/bcms/proxy?url=note&method=GET",
        columns: [[
            {field: 'content', width: '60%', align: 'center', title: '笔记内容'},
            {field:'user_id',width:'10%',align:'center',title:'提交者'},
            {field:'target_id',width:'10%',align:'center',title:'关联资源'},
            {field:'is_public',width:'9%',align:'center',title:'是否公开',
                formatter: function (value, row, index) {
                    if(value==true){
                        return "公开";
                    }else{
                        return "不公开";
                    }
                }
            },
            {
                field: '_operate', width: '10%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="delNote(' + index + ')">删除</a>';
                }
            }
        ]]
    });
});


function getQueryParams(queryParams){
    var username=$("#username").val();
    var is_public=$("#is_public").combobox('getValue');
    queryParams.username=username;
    queryParams.is_public=is_public;
    return queryParams;
}

function reloadgrid() {
    var queryParams = $('#note_table').datagrid('options').queryParams;
    getQueryParams(queryParams);
    $('#note_table').datagrid('options').queryParams = queryParams;
    $("#note_table").datagrid('reload');
}


function delNote(index){
    $('#note_table').datagrid('selectRow',index);
    var row = $('#note_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "note/" + row.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#note_table").datagrid("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}



function initAddRoleTree(){
    $.post("/bcms/proxy", {method: "get", url: "role/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $(".add_role_tree").combotree({multiple:true,data: formatTreeData(obj)});
        }
    });
}

function initAddDepartmentTree(){
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $(".add_department_tree").combotree({multiple:true,data: formatTreeData(obj)});
        }
    });
}

function initModifyRoleTree(values){
    $.post("/bcms/proxy", {method: "get", url: "role/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $(".modify_role_tree").combotree({multiple:true,data: formatTreeData(obj)});
            $(".modify_role_tree").combotree("setValues",values);
        }
    });
}

function initModifyDepartmentTree(values){
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $(".modify_department_tree").combotree({multiple:true,data: formatTreeData(obj)});
            $(".modify_department_tree").combotree("setValues",values);
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
