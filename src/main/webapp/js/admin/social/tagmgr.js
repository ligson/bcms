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
                    return '<a class="tablelink" href="#" onclick="clickModifyTag(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delTag(' + index + ')">删除</a>';
                }
            }
        ]]
    });
});

//点击编辑标签
function clickModifyTag(index){
    $('#tag_tree_grid').treegrid('select', "tag"+id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $('#modify_tag_dlg input[name=name]').val(row.name);
        $('#modify_tag_dlg input[name=id]').val(id);
        $('#modify_tag_dlg input[name=library_id]').val(row.library_id);
        $('#modify_tag_dlg').dialog('open').dialog('setTitle', '编辑标签');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyTag(){
    var id=$("#modify_tag_dlg input[name=id]").val();
    var name=$("#modify_tag_dlg input[name=name]").val();
    var library_id=$("#modify_tag_dlg input[name=library_id]").val();
    $.post("/bcms/proxy", {method:"put",url: "tag/"+id,name:name,library_id:library_id}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#modify_tag_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#modify_tag_dlg').dialog('close');
            initTagTree();
        }
    });
}

function delTag(index){
    $('#tag_tree_grid').treegrid('select', "tag"+id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "tag/" + id }, function (result) {
                    var obj= $.parseJSON(result);
                    if (obj.success==false) {
                        alert("删除失败!");
                    } else {
                        initTagTree();
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
    $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加标签");
}

function saveTag(){
    var name=$("#add_tag_dlg input[name=name]").val();
}


function clickAddNextTag(){
    var node = $('#tag_tree_grid').treegrid('getSelected');
    if (node) {
        $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加下级标签");
    }else{
        $.messager.alert("提示", "请选择上级标签！", "info");
        return;
    }
}



