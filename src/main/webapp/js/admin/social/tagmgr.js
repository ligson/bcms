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

    $("#tag_tree_grid").treegrid({
        idField:'id',
        treeField:'name',
        rownumbers: true,
        columns:[[
            {field:'name',width:'55%',title:'名称'},
            {field:'type',width:'20%',align:'center',title:'类型', formatter: function (value, row,index) {
                if(value==0){
                    return '<span style="color: #ff0000;">标签库</span>';
                }else{
                    return '<span style="color: #0000ff;">标签</span>';
                }
            }},
            {field:'_operate',width:'20%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    if(row.type==0){
                        var id=row.id.replace("lib","");
                        return '<a class="tablelink" href="#" onclick="delTagLib('+ id + ')">删除</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="clickModifyTagLib(' + id + ')">修改</a>';
                    }else{
                        var id=row.id.replace("tag","");
                        return '<a class="tablelink" href="#" onclick="delTag('+ id + ')">删除</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="clickModifyTag(' + id+ ')">修改</a>';
                    }
                }
            }
            ]]
    });
    initTagTree();
});

function initTagTree(){
    $.post("/bcms/proxy", {method:"get",url: "taglibrary/"}, function (result) {
        var obj = $.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#tag_tree_grid").treegrid('loadData', formatTagLibTreeGridData(obj));
        }
    });
}

function formatTagLibTreeGridData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = [];
        obj.name = data[i].name;
        obj.id="lib"+data[i].id;
        obj.type=0;
        if (data[i].tags && data[i].tags.length > 0) {
            obj.children = formatTagTreeGridData(data[i].tags,data[i].id);
        }
        fin.push(obj);
    }
    return fin;
}

function formatTagTreeGridData(data,library_id){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = [];
        obj.name = data[i].name;
        obj.type=1;
        obj.id="tag"+data[i].id;
        obj.library_id=library_id;
        if ( data[i].children &&  data[i].children.length > 0) {
            obj.children = formatTagTreeGridData(data[i].children,library_id);
        }
        fin.push(obj);
    }
    return fin;
}

//点击添加标签库
function clickAddTagLib(){
    $('#add_taglib_dlg').dialog('open').dialog('setTitle', '添加标签库');
}

//添加标签库保存
function saveTagLib(){
    var name=$("#add_taglib_dlg input[name=name]").val();
    $.post("/bcms/proxy", {method:"post",url: "taglibrary/",name:name}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#add_taglib_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#add_taglib_dlg').dialog('close');
            initTagTree();
        }
    });
}



function clickModifyTagLib(id){
    $('#tag_tree_grid').treegrid('select', "lib"+id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $('#modify_tag_lib_dlg input[name=name]').val(row.name);
        $('#modify_tag_lib_dlg input[name=id]').val(id);
        $('#modify_tag_lib_dlg').dialog('open').dialog('setTitle', '编辑标签库');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyTagLib(){
    var id=$("#modify_tag_lib_dlg input[name=id]").val();
    var name=$("#modify_tag_lib_dlg input[name=name]").val();
    $.post("/bcms/proxy", {method:"put",url: "taglibrary/"+id,name:name}, function (result) {
        var obj= $.parseJSON(result);
        if (obj.success==false) {
            $('#modify_tag_lib_dlg').dialog('close');
            alert(obj.msg);
        } else {
            $('#modify_tag_lib_dlg').dialog('close');
            initTagTree();
        }
    });
}

//点击编辑标签
function clickModifyTag(id){
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

function delTag(id){
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

function delTagLib(id){
    $('#tag_tree_grid').treegrid('select', "lib"+id);
    var row = $('#tag_tree_grid').treegrid('getSelected');
    if(row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                $.post("/bcms/proxy", {method: "delete", url: "taglibrary/" + id }, function (result) {
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
        $.messager.alert("提示", "请选择要删除的标签库！", "info");
        return;
    }
}

function clickAddTag() {
    var node = $('#tag_tree_grid').treegrid('getSelected');
    if (node) {
        $('#add_tag_dlg').dialog('open').dialog("setTitle", "添加标签");
    }else{
        $.messager.alert("提示", "请选择同级标签！", "info");
        return;
    }
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



