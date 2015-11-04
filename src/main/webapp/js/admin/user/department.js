/**
 * Created by Ruby on 2015/8/18.
 */
$(function () {
    $("#department_tree").tree({
        url: "/bcms/proxy?url=department&method=GET",
        lines: true,
        onBeforeLoad:function(node,param){
            ajaxLoading();
        },
        loadFilter: function (data) {
            return formatDepartmentTreeData(data);
        },
        onLoadSuccess:function(node,data){
            ajaxLoadEnd();
        },
        onClick: function (node) {
            $('#department_user_grid').datagrid({
                rownumbers: true,
                singleSelect: false,
                pagination: true,
                url: "/bcms/proxy?url=user&method=GET&department_id="+node.id,
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
        }
    });


});


function formatDepartmentTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.state="closed";
            obj.children = formatDepartmentTreeData(obj.children);
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
    $( '#add_department_dlg .department_tree' ).combotree ({
        data: $("#department_tree").tree("getRoots"),
        lines: true
    });
    var node=$('#department_tree').tree('getSelected');
    if(node) {
        $('#add_department_dlg .department_tree').combotree("setValue", node.id);
    }
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
    $('#modify_department_dlg .department_tree').combotree ({
        data: $("#department_tree").tree("getRoots"),
        lines: true
    });
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
            $("#department_tree").tree("reload");
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
            $("#department_tree").tree("reload");
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
                        $("#department_tree").tree("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}
