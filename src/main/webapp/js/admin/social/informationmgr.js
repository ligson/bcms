/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#information_table').datagrid({
        rownumbers: true,
        singleSelect: false,
        pagination: true,
        toolbar:"#tb",
        url: "/bcms/proxy?url=information&method=GET",
        columns: [[
            {field: 'id', width: '1%', checkbox: true, title: 'ID'},
            {field: 'name', width: '30%', align: 'center', title: '资讯名称'},
            {
                field: 'published_at',
                width: '15%',
                align: 'center',
                title: '展示开始时间',
                formatter: function (value, row, index) {
                    return new Date(value).format("yyyy-MM-dd HH:mm:ss");
                }
            },
            {
                field: 'end_at', width: '15%', align: 'center', title: '展示结束时间',
                formatter: function (value, row, index) {
                    return new Date(value).format("yyyy-MM-dd HH:mm:ss");
                }
            },
            {field: 'user_id', width: '10%', align: 'center', title: '发送人'},
            {
                field: 'created_at', width: '15%', align: 'center', title: '创建时间',
                formatter: function (value, row, index) {
                    return new Date(value).format("yyyy-MM-dd HH:mm:ss");
                }
            },
            {
                field: '_operate', width: '10%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="editInformation(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delInformation(' + index + ')">删除</a>';
                }
            }
        ]]
    });
});

function getQueryParams(queryParams){
    var name=$("#name").val();
    queryParams.name=name;
    return queryParams;
}

function reloadgrid() {
    var queryParams = $('#information_table').datagrid('options').queryParams;
    getQueryParams(queryParams);
    $('#information_table').datagrid('options').queryParams = queryParams;
    $("#information_table").datagrid('reload');
}

function closeTab(title) {
    $('#information_tabs').tabs('close', title);
}

function newInformation() {
    var tab= $('#information_tabs').tabs('getTab', "添加资讯");
    if(!tab) {
        var html = "";
        html += '<div title="添加资讯">';
        html += '<div class="ftitle">添加资讯</div>';
        html += '<form id="add_information_form" method="post">';
        html += '<div class="fitem">';
        html += '<label>标题</label>';
        html += '<input id="name1" class="easyui-validatebox" required="true" type="text" />';
        html += '</div><div class="fitem">';
        html += '<label>开始时间</label>';
        html += '<input id="published_at1" class="easyui-datetimebox" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>结束时间</label>';
        html += '<input id="end_at1" class="easyui-datetimebox" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem">';
        html += '<label>查看部门</label>';
        html += '<input class="easyui-combotree add_department_tree" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>查看角色</label>';
        html += '<input class="easyui-combotree add_role_tree" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>内容</label>';
        html += '<input id="content1" class="easyui-validatebox" required="true" type="text" />';
        html += '<script type=\"text/javascript\">CKEDITOR.replace(\"content1\");</script>';
        html += '</div>';
        html += '</form>';
        html += '<div id="add_information_dlg_buttons">';
        html += '<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveInformation();" iconcls="icon-save">保存</a>';
        html += "<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeTab('添加资讯');\" iconcls=\"icon-cancel\">取消</a>";
        html += '</div>';
        html += '</div>';
        $('#information_tabs').tabs('add', {
            title: '添加资讯',
            content: html,
            closable: true
        });
        initAddDepartmentTree();
        initAddRoleTree();
    }else{
        $('#information_tabs').tabs('select','添加资讯');
    }
}

function saveInformation(){
    var name=$("#name1").val();
    var content=CKEDITOR.instances.content1.getData();
    var published_at =$('#published_at1').datebox('getValue');
    var end_at=$("#end_at1").datebox('getValue');
    var departments=$(".add_department_tree").combotree("getValues");
    var roles=$(".add_role_tree").combotree("getValues");
    var user_id=$.cookie("bcms_user_id");
    var create_date=new Date().format("yyyy-MM-dd HH:mm:ss");
    $.post("/bcms/proxy", {
        method: "post",
        url: "/information/",
        user_id:user_id,
        name: name,
        content: content,
        created_at: create_date,
        published_at: published_at,
        end_at: end_at,
        department_id:departments.toString(),
        role_id:roles.toString()
    }, function (data) {
        var result = JSON.parse(data);
        if (!result.success) {
            $("#information_table").datagrid("reload");
            $('#information_tabs').tabs('close', "添加资讯");
        } else {
            alert("创建失败!");
        }
    });
}

function editInformation(index) {
    $('#information_table').datagrid('selectRow', index);
    var row = $('#information_table').datagrid('getSelected');
    if (row) {
        $('#information_tabs').tabs('close', "编辑资讯");
        var html = "";
        html += '<div title="编辑资讯">';
        html += '<div class="ftitle">编辑资讯</div>';
        html += '<form id="add_information_form" method="post">';
        html += '<input id="id" type="hidden" value="' + row.information_id + '"/>';
        html += '<div class="fitem">';
        html += '<label>标题</label>';
        html += '<input id="name2" class="easyui-validatebox" value="' + row.name + '" required="true" type="text" />';
        html += '</div><div class="fitem">';
        html += '<label>开始时间</label>';
        html += '<input id="published_at2" class="easyui-datetimebox" value="' + row.name + '" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>结束时间</label>';
        html += '<input id="end_at2" class="easyui-datetimebox" value="' + row.name + '" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem">';
        html += '<label>查看部门</label>';
        html += '<input class="easyui-combotree modify_department_tree" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>查看角色</label>';
        html += '<input class="easyui-combotree modify_role_tree" required="true" type="text" />';
        html += '</div>';
        html += '<div class="fitem"><label>内容</label>';
        html += '<input id="content2" class="easyui-validatebox" value="' + row.name + '" required="true" type="text" />';
        html += '<script type=\"text/javascript\">CKEDITOR.replace(\"content2\");</script>';
        html += '</div>';
        html += '</form>';
        html += '<div id="add_information_dlg_buttons">';
        html += '<a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyInformation();" iconcls="icon-save">保存</a>';
        html += "<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeTab('编辑资讯');\" iconcls=\"icon-cancel\">取消</a>";
        html += '</div>';
        html += '</div>';
        $('#information_tabs').tabs('add', {
            title: '编辑资讯',
            content: html,
            closable: true
        });
        CKEDITOR.instances.content2.setData(row.content);
        $("#published_at2").datebox("setValue", row.published_at);
        $("#end_at2").datebox("setValue", row.end_at);
        initModifyDepartmentTree(row.department_id);
        initModifyRoleTree(row.role_id);
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyInformation(){
    var id = $("#id").val();
    var name=$("#name2").val();
    var content=CKEDITOR.instances.content2.getData();
    var published_at =$('#published_at2').datebox('getValue');
    var end_at=$("#end_at2").datebox('getValue');
    var departments=$(".modify_department_tree").combotree("getValues");
    var roles=$(".modify_role_tree").combotree("getValues");
    //var user_id=$.cookie("bcms_user_id");
    var create_date=new Date().format("yyyy-MM-dd HH:mm:ss");
    $.post("/bcms/proxy", {
        method: "put",
        url: "/information/"+id,
        name: name,
        content: content,
        created_at: create_date,
        published_at: published_at,
        end_at: end_at,
        department_id:departments.toString(),
        role_id:roles.toString()
    }, function (data) {
        var result = JSON.parse(data);
        if (!result.success) {
            $("#information_table").datagrid("reload");
            $('#information_tabs').tabs('close', "编辑资讯");
        } else {
            alert("修改失败!");
        }
    });
}


function delInformation(index){
    $('#information_table').datagrid('selectRow',index);
    var row = $('#information_table').datagrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "information/" + row.information_id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#information_table").datagrid("reload");
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
            $(".add_role_tree").combotree({multiple:true,data: formatTreeData(obj.rows)});
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
            $(".modify_role_tree").combotree({multiple:true,data: formatTreeData(obj.rows)});
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
