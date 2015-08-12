$(function () {

    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'30%',align:'center',title:'权限名称'},
            {field:'codename',width:'30%',align:'center',title:'权限缩写'},
            {field:'_operate',width:'32%',align:'center',title:'操作',formatter:formatOper}
        ]]
    });

    initAuthGrid();
});


function initAuthGrid() {
    $.post("/index/httpGet", {url: "permission/"}, function (result) {
        if (result.success) {
            var obj = jQuery.parseJSON(result.data);
            var json = {total: obj.length, rows: obj};
            $("#auth_table").datagrid('loadData', json);
        } else {
            alert(result.msg);
        }
    });
}

function clickModifyAuth(index){
    var selectedRow = $('#auth_table').datagrid('getSelected');
    if(selectedRow){
        $("#modify_auth_dlg input[name=id]").val(selectedRow.id);
        $("#modify_auth_dlg input[name=name]").val(selectedRow.name);
        $("#modify_auth_dlg input[name=codename]").val(selectedRow.codename);
        $('#modify_auth_dlg').dialog('open');
    }else{
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function modifyAuth(){
    var id= $("#modify_auth_dlg input[name=id]").val();
    var name = $("#modify_auth_dlg input[name=name]").val();
    var codename = $('#modify_auth_dlg input[name=codename]').val();
    $.post("/index/httpPut", {url: "permission/"+id, name: name, codename:codename}, function (result) {
        if (result.success) {
            $('#modify_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#modify_auth_dlg').dialog('close');
            alert(result.msg);
        }
    });
}


function formatOper(val, row, index) {
    return '<a class="tablelink" href="#" onclick="clickModifyAuth(' + index + ');">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delAuth(' + index + ');">删除</a>';
}

function delAuths() {
    var rows = $('#auth_table').datagrid("getSelections");
    if (rows.length > 0) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                for (var i = 0; i < rows.length; i++) {
                    $.post("/index/httpDelete", {url: "permission/" + rows[i].id + "/"}, function (result) {
                        if (result.success) {
                            initAuthGrid();
                        } else {
                            alert("删除失败!");
                        }
                    });
                }
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function delAuth(index) {
    var row= $('#auth_table').datagrid("getData").rows[index];
    if (row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/index/httpDelete", {url: "permission/" + row.id + "/"}, function (result) {
                    if (result.success) {
                        initAuthGrid();
                    } else {
                        $.messager.alert("提示","删除失败!","error");
                    }
                });
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function addAuth() {
    var name = $("#name").val();
    var codename = $("#codename").val();
    $.post("/index/httpPost", {url: "permission/", name: name, codename: codename}, function (result) {
        if (result.success) {
            $('#add_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#add_auth_dlg').dialog('close');
            alert(result.msg);
        }
    });

}
