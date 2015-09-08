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


/*{
 field: 'constraints', title: '约束', width: 100, formatter: function (value, row, index) {
 if (row.constraints) {
 var dataType = row.datatype;
 //range,nullable,unique,length
 var hString = "";
 for (var i = 0; i < row.constraints.length; i++) {
 var con = row.constraints[i];
 var type = con.type;
 if (type == "range") {
 hString += "范围:" + con.value + "<br/>";
 } else if (type == "nullable") {
 hString += "必备元素:" + con.value + "<br/>";
 } else if (type == "unique") {
 hString += "唯一元素:" + con.value + "<br/>";
 } else {
 hString += "长度:" + con.value + "<br/>";
 }
 }
 return hString;
 } else {
 return "--";
 }
 }
 }*/
var dataTypes = [{name: "0", value: "多语言字符串"}, {name: "1", value: "数值"}, {
    name: "2",
    value: "词汇表"
}, {name: "3", value: "结构类型"}, {name: "4", value: "时间"}];

function addItemToDlg() {
    var aArr = $("#ttbr p").find("a");
    $("#structureItems").empty();
    for (var i = 0; i < aArr.length; i++) {
        var aId = $(aArr[i]).attr("about");
        var aText = $(aArr[i]).text();
        //TODO input un add
        $("#structureItems").append("<p>" + aText + "<p>");
    }
    $("#selectItemDlg").dialog("close");
}
$(function () {
    $("#metadata_tree1").tree({
        onCheck: function (node, checked) {
            if (!node.children) {
                if (checked) {
                    $("#ttbr p").append("<a about='" + node.id + "'>" + node.text + "</a>");
                } else {
                    $("#ttbr p").find("a[about='" + node.id + "']").remove();
                }
            }

        }
    });

    $("#metaGrid").treegrid({
        idField: 'id',
        treeField: 'zh_name',
        fitColumns: true,
        columns: [
            [
                {field: 'ckId', width: 30, checkbox: true},
                {field: 'id', title: '编号', width: 30},
                {field: 'zh_name', title: '中文', width: 100},
                {field: 'en_name', title: '英文', width: 100},
                {
                    field: 'kind', title: '字段类型', width: 100, formatter: function (value, row, index) {
                    for (var i = 0; i < dataTypes.length; i++) {
                        var data = dataTypes[i];
                        if (row.kind == data.name) {
                            return data.value;
                        }
                    }
                    return "未知数据类型";
                }
                },
                {field: 'lom_id', title: 'LOM编号', width: 100},
                /*{field: 'code', title: '编码', width: 100},*/
                /*{field: 'innercode', title: '系统编码', width: 100, hidden: true},*/
                {field: 'description', title: '解释', width: 100},
                {field: 'is_sorted', title: '顺序', width: 50},
                {field: 'example', title: '举例', width: 50},
                {field: 'domain', title: '值域', width: 50},
                {field: 'val_num', title: '取值数', width: 50},
                {field: 'parent_id', title: '父类型id', width: 50}, {
                field: "edit", title: "编辑", formatter: function (value, row, index) {
                    return "<a class='easyui-linkbutton' onclick='showEditItemDlg(" + row.id + ")'>编辑</a>";
                }
            }
            ]
        ]
    });

    $("#itemDateTypeSlt").combobox({
        onSelect: function (item) {
            $("#structureItems").empty();
            if (item.value == "structure") {
                $("#selectItemDlg").dialog("open");
            } else if (item.value == "vocabulary") {
                $("#metadata_tree1").tree({url: "./jsondata/vocabulary/vocabularytree.json"});
                $("#metadata_tree1").tree("reload");
                $("#selectItemDlg").dialog("open");
            }
        }
    });


});
function showAddItemDlg() {
    $("#addMetaItemDlg").dialog("open");
}

function showEditItemDlg(rowId) {
    var mg = $("#metaGrid");
    var data = mg.datagrid("getData");
    mg.datagrid("selectRecord", rowId);
    var row = mg.datagrid("getSelected");
    if (row) {
        $("#id2").val(row.id);
        $("#zh_name2").textbox("setValue", row.zh_name);
        $("#en_name2").textbox("setValue", row.en_name);
        $("#description2").textbox("setValue", row.description);
        $("#lom_id2").textbox("setValue", row.lom_id);
        $("#val_num2").textbox("setValue", row.val_num);
        $("#example2").textbox("setValue", row.example);
        $("#is_sorted2").combobox("setValue", row.is_sorted);
        $("#domain2").textbox("setValue", row.domain);
        $("#kind2").textbox("setValue", row.kind);
        $("#editMetaItemDlg").dialog("open");
    }
}

function submitStructureForm() {
    //var dlg = $("#addMetaItemDlg");
    var zh_name = $("#zh_name1").textbox("getValue");
    var en_name = $("#en_name1").textbox("getValue");
    var description = $("#description1").textbox("getValue");
    var lom_id = $("#lom_id1").textbox("getValue");
    var val_num = $("#val_num1").textbox("getValue");
    var kind = $("#kind1").combobox("getValue");
    var domain = $("#domain1").textbox("getValue");
    var example = $("#example1").textbox("getValue");
    var is_sorted = $("#is_sorted1").combobox("getValue");
    $.post("/bcms/proxy", {
        method: "POST",
        url: "/metatype/",
        zh_name: zh_name,
        en_name: en_name,
        description: description,
        domain: domain,
        val_num: val_num,
        is_sorted: is_sorted,
        example: example,
        lom_id: lom_id,
        collection: 3,
        kind: kind
        //parent_id: null
    }, function (data) {
        if (data.id != null) {
            $('#addMetaItemDlg').dialog("close");
            $("#metaGrid").datagrid("reload");
        } else {
            alert(data.msg);
        }
        //console.log(data);
    }, "json");
}