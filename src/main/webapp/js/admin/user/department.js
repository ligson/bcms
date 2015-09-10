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
            {field:'groups',width:'20%',align:'center',formatter:formatGroup,title:'用户组'}

        ]]
    });
});

function initDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            departmentTree = formatTreeData(obj)
            $("#department_tree").tree({
                data: departmentTree,
                onClick: function (node) {
                    initUserGridByDepartment(node);
                    $.post("/bcms/proxy", {method: "get", url: "department/"+node.id}, function (result2) {
                        var obj2 = jQuery.parseJSON(result2);
                        if (obj2.success == false) {
                            alert(obj2.msg);
                        } else {
                            $("#department_tree").tree('update', {
                                parent : node.target,
                                data : formatTreeData(obj2.children)
                            });
                        }
                    });
                }
            });
        }
    });
}

function initUserGridByDepartment(node) {
    $.post("/bcms/proxy", {method: "get", url: "department/" + node.id + "/user/page/1"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            var json = {total: obj.length, rows: obj};
            $("#department_user_grid").datagrid('loadData', json);
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

function formatGroup(val, row) {
    var result="";
    for(var i=0;i<val.length;i++){
        result+="<span>"+val[i].name+"|<span>";
    }
    return result;
}

function clickAddDepartment(){
    $('#add_department_dlg .department_tree').combotree('loadData', departmentTree);
    $('#add_department_dlg').dialog('open').dialog('setTitle', '添加新部门');;
}

function clickModifyDepartment(){
    var node=$('#department_tree').tree('getSelected');
    if(node) {
        initMoidfyDepartment(node);
        $('#modify_department_dlg').dialog('open').dialog('setTitle', '编辑部门');;
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }

}

function initMoidfyDepartment(node){
    $("#modify_department_dlg input[name=id]").val(node.id);
    $("#modify_department_dlg input[name=name]").val(node.name);
    $('#modify_department_dlg .department_tree').combotree('loadData', departmentTree);
    var parent_node=$('#department_tree').tree('getParent',node.target);
    if(parent_node) {
        $('#modify_department_dlg .department_tree').combotree("setValue", parent_node.id);
    }

}

function saveDepartment(){
    var name = $("#add_department_dlg input[name=name]").val();
    var parent_id=$("#add_department_dlg .department_tree").combotree("getValue");
    $.post("/bcms/proxy", {method:"post",url: "department/", name: name,parent_id:parent_id}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#add_department_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#add_department_dlg').dialog('close');
            initDepartmentTree();
        }
    });
}

function modifyDepartment(){
    var id= $("#modify_department_dlg input[name=id]").val();
    var name = $("#modify_department_dlg input[name=name]").val();
    var parent_id=$("#modify_department_dlg .department_tree").combotree("getValue");
    $.post("/bcms/proxy", {method:"put",url: "department/"+id, name: name,parent_id:parent_id}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            $('#modify_department_dlg').dialog('close');
            $.message.alert("提示",obj.msg,"info");
        } else {
            $('#modify_department_dlg').dialog('close');
            initDepartmentTree();
        }
    });
}

function delDepartment(){
    var node = $('#department_tree').tree('getSelected');
    if(node) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "department/" + node.id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        initDepartmentTree();
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}