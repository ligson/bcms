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
                {field: 'id', title: 'id', width: 30},
                {field: 'zh_name', title: '中文名称', width: 100},
                {field: 'en_name', title: '英文名称', width: 100},
                {
                    field: 'kind', title: '字段类型', width: 100, formatter: function (value, row, index) {
                    for (var i = 0; i < dataTypes.length; i++) {
                        var data = dataTypes[i];
                        if (row.kind == data.name) {
                            return data.value + "(" + data.name + ")";
                        }
                    }
                    return "未知数据类型";
                }
                },
                {field: 'lom_id', title: 'LOM编号', width: 100},
                /*{field: 'code', title: '编码', width: 100},
                 {field: 'innercode', title: '系统编码', width: 100, hidden: true},*/
                {field: 'description', title: '解释', width: 100},
                {field: 'is_sorted', title: '顺序', width: 50},
                {field: 'example', title: '举例', width: 50},
                {field: 'domain', title: '值域', width: 50},
                {field: 'val_num', title: '取值数', width: 50},
                {field: 'parent_id', title: 'parent_id', width: 50}
                /* ,{
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
                 }*/, {
                field: "edit", title: "编辑", formatter: function (value, row, index) {
                    return "<a class='easyui-linkbutton' onclick='showAddItemDlg()'>编辑</a>";
                }
            }
            ]
        ]
    });

    $("#kind1").combobox({
        onSelect: function (item) {
            if (item.value == 2) {
                $("#dicBlock").show();
            } else {
                $("#dicBlock").hide();
            }
            /* $("#structureItems").empty();
             if (item.value == "structure") {
             $("#selectItemDlg").dialog("open");
             } else if (item.value == "vocabulary") {
             $("#metadata_tree1").tree({url: "./jsondata/vocabulary/vocabularytree.json"});
             $("#metadata_tree1").tree("reload");
             $("#selectItemDlg").dialog("open");
             }*/
        }
    });

    //增加结构类型字段
    $("#addStructureItemDlg").dialog({
        buttons: [{
            text: '确定',
            iconCls: 'icon-ok',
            handler: function () {
                //alert('ok');
            }
        }, {
            text: '关闭',
            handler: function () {
                $("#addStructureItemDlg").dialog("close");

            }
        }]
    });

    //增加词汇表类型字段
    $("#addDicItemDlg").dialog({
        buttons: [{
            text: '确定',
            iconCls: 'icon-ok',
            handler: function () {
                //alert('ok');
            }
        }, {
            text: '关闭',
            handler: function () {
                $("#addDicItemDlg").dialog("close");

            }
        }]
    });


    $("#addMetaItemDlg").dialog({
        buttons: [
            {
                text: "提交",
                handler: function () {
                    showAddItemDlg();
                }

            },
            {
                text: "关闭"
            }
        ]
    });


});
function showAddItemDlg() {
    $("#addMetaItemDlg").dialog("open");
}
function showAddStructureItemDlg() {
    $("#addStructureItemDlg").dialog("open");
}

function showAddDicItemDlg() {
    $("#addDicItemDlg").dialog("open");
}