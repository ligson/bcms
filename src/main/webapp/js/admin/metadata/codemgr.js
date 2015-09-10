/**
 * Created by ligson on 2015/8/18.
 *  "id": "10",
 "name": "字段名",
 "description": "字段描述",
 "datatype": "数据类型",
 "lom_id": "1.1",
 "code": "11121554",
 "innercode": "010101"
 langstring:多语言字符串
 language:语种
 string:字符串
 number:数值
 vocabulary:词汇表
 source:来源
 value:值
 structure:结构类型
 date:时间

 constraints:range,nullable,unique,length
 **********/


function showAddEncodeItemDlg() {
    var row = $('#metaGrid').treegrid('getSelected');
    if (row) {
        $("#addEncodeItemDlg").dialog("open");
    }else{
        alert("请选择编码分类后再操作");
    }
}

function showAddEncodeTypeDlg() {
    $("#addEncodeTypeDlg").dialog("open");
}

function delEncode(){
    var row = $('#metaGrid').treegrid('getSelected');
    if(row){
        $.post("/bcms/proxy", {url: "encode/" + row.id, method: "DELETE"}, function (data) {
            if (data.id != null) {
                $("#metaGrid").treegrid("reload");
            }
        }, "json");
    }else{
        alert("请选择要删除的数据");
    }
}

function submitAddEncodeItem() {
    var name = $("#name2").textbox("getValue");
    var code = $("#code2").textbox("getValue");
    var row = $('#metaGrid').treegrid('getSelected');
    if ((name && (!name.isEmpty())) && (code && (!code.isEmpty()))) {
        $.post("/bcms/proxy", {url: "encode/", method: "POST", name: name, code: code, parent_id:row.id}, function (data) {
            if (data.id != null) {
                $("#addEncodeItemDlg").dialog("close");
                $("#metaGrid").treegrid("reload");
            } else {
                alert("创建失败!");
            }
        }, "json");
    }
}

function submitAddEncodeType() {
    var name = $("#name1").textbox("getValue");
    var code = $("#code1").textbox("getValue");
    if ((name && (!name.isEmpty())) && (code && (!code.isEmpty()))) {
        $.post("/bcms/proxy", {url: "encode/", method: "POST", name: name, code: code, parent_id: 0}, function (data) {
            if (data.id != null) {
                $("#addEncodeTypeDlg").dialog("close");
                $("#metaGrid").treegrid("reload");
            } else {
                alert("创建失败!");
            }
        }, "json");
    }
}

function showEditEncodeDlg(rowId) {
    var mg = $("#metaGrid");
    mg.treegrid("select", rowId);
    var row = mg.treegrid("getSelected");
    if(row) {
        var dlg = $("#editEncodeDlg");
        $("#editEncodeDlg #id3").val( row.id);
        $("#editEncodeDlg #parent_id3").val( row.parent_id);
        $("#editEncodeDlg #name3").textbox("setText", row.name);
        $("#editEncodeDlg #code3").textbox("setText", row.code);
        dlg.dialog("open");
    }
}

function submitModifyEncodeItem(){
    var id = $("#id3").val();
    var parent_id = $("#parent_id3").val();
    var name=$("#name3").val();
    var code=$("#code3").val();
    $.post("/bcms/proxy", {
        method: "put",
        url: "/encode/"+id,
        name: name,
        code: code,
        parent_id: parent_id
    }, function (data) {
        var result = JSON.parse(data);
        if (!result.success) {
            $("#editEncodeDlg").dialog("close");
            $("#metaGrid").treegrid("reload");
        } else {
            alert("修改失败!");
        }
    });
}

$(function () {
    $("#metaGrid").treegrid({
        idField: 'id',
        treeField: 'name',
        fitColumns: true,
        columns: [[
            {field: "id", title: "id", width: 100, hidden: true},
            {field: "name", title: "属性", width: 100,align:'center'},
            {field: "code", title: "编码", width: 100,align:'center'},
            {
                field: "edit", title: "操作", width: 100, align: 'center', formatter: function (value, row) {
                return "<a class='easyui-linkbutton' onclick='showEditEncodeDlg(" + row.id + ")'>编辑</a>";
            }
            }
        ]]
    });

});


