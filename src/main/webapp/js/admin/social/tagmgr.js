/**
 * Created by Ruby on 2015/8/19.
 */
$(function () {
    $('#search_tag').combobox({
        prompt:'输入关键字后自动搜索',
        url:'../../js/admin/social/tag_test_combobox.json',
        method: 'get',
        valueField:'id',
        textField:'text',
        onSelect:function(tag){
            var id = $('#search_tag').combobox('getValue');
            $("#tag_tree").tree("expand", $("#tag_tree").tree("find",id).target);
            $('#tag_tree').tree('select',$("#tag_tree").tree("find",id).target);
        }
    });
});

function clickAddTag() {
    var node = $('#tag_tree').tree('getSelected');
    if (node) {
        $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加标签");
    }else{
        $.messager.alert("提示", "请选择同级标签！", "info");
        return;
    }
}

function clickAddNextTag(){
    var node = $('#tag_tree').tree('getSelected');
    if (node) {
        $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加下级标签");
    }else{
        $.messager.alert("提示", "请选择上级标签！", "info");
        return;
    }
}

function clickModifyTag(){
    var node=$('#tag_tree').tree('getSelected');
    if(node) {
        $('#modify_tag_dlg').dialog('open').dialog('setTitle', '编辑标签');;
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function delTag(){
    var node = $('#tag_tree').tree('getSelected');
    if (node) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {

            }
        });
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}