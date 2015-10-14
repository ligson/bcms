$(function () {
    $('#search_tag').combobox({
        prompt: '输入关键字后自动搜索',
        url: '../../js/admin/social/tag_test_combobox.json',
        method: 'get',
        valueField: 'id',
        textField: 'text',
        onSelect: function (tag) {
            var id = $('#search_tag').combobox('getValue');
            $("#tag_tree").tree("expand", $("#tag_tree").tree("find", id).target);
            $('#tag_tree').tree('select', $("#tag_tree").tree("find", id).target);
        }
    });

    $("#tag_tree_grid").treegrid({
        idField: 'id',
        treeField: 'name',
        rownumbers: true,
        pagination: true,
        url: "/bcms/proxy?url=tag&method=GET",
        columns: [[
            {field: 'name', width: '75%', title: '名称'},
            {
                field: '_operate', width: '20%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="clickModifyTag(' + row.id + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delTag(' + row.id + ')">删除</a>';
                }
            }
        ]]
    });
});

//点击编辑标签
function clickModifyTag(id){
    $('#tag_tree_grid').treegrid('select', id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $('#modify_tag_dlg input[name=name]').val(row.name);
        $('#modify_tag_dlg input[name=id]').val(id);
        $('#modify_tag_dlg input[name=parent_id]').val(row.parent_id);
        $('#modify_tag_dlg').dialog('open').dialog('setTitle', '编辑标签');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyTag(){
    var id=$("#modify_tag_dlg input[name=id]").val();
    var name=$("#modify_tag_dlg input[name=name]").val();
    var parent_id=$("#modify_tag_dlg input[name=parent_id]").val();
    $.post("/bcms/proxy", {method:"put",url: "tag/"+id,name:name,parent_id:arent_idli}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#modify_tag_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#modify_tag_dlg').dialog('close');
            $("#tag_tree_grid").treegrid("reload");
        }
    });
}

function delTag(id){
    $('#tag_tree_grid').treegrid('select', id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "tag/" + id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        $("#tag_tree_grid").treegrid("reload");
                    }
                });
            }
        })
    }else{
        $.messager.alert("提示", "请选择要删除的标签！", "info");
        return;
    }
}

function clickAddTag() {
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $('#add_tag_dlg input[name=parent_id]').val(row.id);
    }else{
        $('#add_tag_dlg input[name=parent_id]').val(0);
    }
    $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加标签");
}

function saveTag(){
    var name=$("#add_tag_dlg input[name=name]").val();
    var parent_id=$("#add_tag_dlg input[name=parent_id]").val();
    $.post("/bcms/proxy", {
        method: "post",
        url: "/tag/",
        name: name,
        parent_id: parent_id
    }, function (data) {
        var result = JSON.parse(data);
        if (result.success==false) {
            $('#add_tag_dlg').dialog('close');
            alert(result.msg);
        } else {
            $('#add_tag_dlg').dialog('close');
            $("#tag_tree_grid").treegrid("reload");
        }
    });
}




