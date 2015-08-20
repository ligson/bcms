/**
 * Created by ligson on 2015/8/18.
 *  "id": "10",
 "name": "字段名",
 "description": "字段描述",
 "datatype": "数据类型",
 "lomId": "1.1",
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
var dataTypes = [{name: "langstring", value: "多语言字符串"}, {
    name: "string",
    value: "字符串"
}, {name: "number", value: "数值"}, {name: "vocabulary", value: "词汇表"}, {
    name: "value",
    value: "值"
}, {name: "structure", value: "结构类型"}, {name: "date", value: "时间"}];

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
        treeField: 'name',
        fitColumns:true,
        columns: [
            [
                {field: 'id', title: '编号', width: 30},
                {field: 'name', title: '中文', width: 100},
                {field: 'enName', title: '英文', width: 100},
                {
                    field: 'datatype', title: '字段类型', width: 100, formatter: function (value, row, index) {
                    for (var i = 0; i < dataTypes.length; i++) {
                        var data = dataTypes[i];
                        if (row.datatype == data.name) {
                            return data.value + "(" + data.name + ")";
                        }
                    }
                    return "未知数据类型";
                }
                },
                {field: 'lomId', title: 'LOM编号', width: 100},
                {field: 'code', title: '编码', width: 100},
                {field: 'innercode', title: '系统编码', width: 100, hidden: true},
                {field: 'description', title: '解释', width: 100},
                {field: 'size', title: '取值数', width: 100},
                {
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
                }, {
                field: "edit", title: "编辑", formatter: function (value, row, index) {
                    return "<a class='easyui-linkbutton' onclick='showAddItemDlg()'>编辑</a>";
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