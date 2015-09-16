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
                /*{field: 'parent_id', title: 'parent_id', width: 50},*/
                {
                    field: 'collection', title: '类别', width: 50, formatter: function (value, row, idx) {
                    if (row.collection == 3) {
                        return "结构";
                    } else if (row.collection == 2) {
                        return "分类数据";
                    } else if (row.collection == 1) {
                        return "通用可选数据";
                    } else {
                        return "必选数据";
                    }
                }
                }
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

    $("#vocabulary_type_id12").combobox({
        url: "/bcms/proxy?url=vocabulary&&method=GET&&page=1&&rows=100",
        loadFilter: function (data) {
            return data.rows;
        },
        valueField: "id",
        textField: "zh_name"

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
                if ($("#addDicItemDlg").find("form").form("validate")) {
                    addDocItem();
                } else {
                    alert("数据格式有误");
                }
            }
        }, {
            text: '关闭',
            handler: function () {
                var dlg = $("#addDicItemDlg");
                dlg.find("form").form("reset");
                dlg.dialog("close");

            }
        }]
    });


    $("#addMetaItemDlg").dialog({
        buttons: [
            {
                text: "提交",
                handler: function () {
                    if ($("#addMetaItemDlg").find("form").form("validate")) {
                        addNormalItem();
                    } else {
                        alert("数据格式有误");
                    }
                }

            },
            {
                text: "关闭",
                handler: function () {
                    var dlg = $("#addMetaItemDlg");
                    dlg.find("form").form("reset");
                    dlg.dialog("close");
                }
            }
        ]
    });


});

function addNormalItem() {
    var zh_name = $("#zh_name11").textbox("getValue");
    var en_name = $("#en_name11").textbox("getValue");
    var lom_id = $("#lom_id11").textbox("getValue");
    var val_num = $("#val_num11").textbox("getValue");
    var example = $("#example11").textbox("getValue");
    var is_sorted = $("#is_sorted11").combobox("getValue");
    var kind = $("#kind11").combobox("getValue");
    var collection = $("#collection11").combobox("getValue");
    var description = $("#description11").textbox("getValue");
    var domain = $("#domain11").textbox("getValue");
    var params = {
        method: "POST",
        url: "metatype/",
        zh_name: zh_name,
        en_name: en_name,
        val_num: val_num,
        example: example,
        is_sorted: is_sorted,
        kind: kind,
        collection: collection,
        description: description,
        domain: domain
    };

    if (lom_id) {
        params.lom_id = lom_id;
    }


    $.post("/bcms/proxy", params, function (data) {
        if (data.id != null) {
            var dlg = $("#addMetaItemDlg");
            dlg.find("form").form("reset");
            dlg.dialog("close");
            var node = $("#metadata_tree").tree("getSelected");
            $.post("/bcms/proxy", {
                url: "metalibrary/add_metatype",
                method: "POST",
                metatype_id: data.id,
                meta_library_id: node.id
            }, function (data2) {
                if (data2.result) {
                    alert("增加成功");
                } else {
                    alert("增加失败");
                }
            }, "json");

        } else {
            if (data.success == false) {
                dlg.dialog("fail");
            }
        }
    }, "json");


}

function addDocItem() {
    var zh_name = $("#zh_name12").textbox("getValue");
    var en_name = $("#en_name12").textbox("getValue");
    var lom_id = $("#lom_id12").textbox("getValue");
    var val_num = $("#val_num12").textbox("getValue");
    var example = $("#example12").textbox("getValue");
    var is_sorted = $("#is_sorted12").combobox("getValue");
    var kind = 2;
    var collection = $("#collection12").combobox("getValue");
    var description = $("#description12").textbox("getValue");
    var domain = $("#domain12").textbox("getValue");
    var vocabulary_type_id = $("#vocabulary_type_id12").combobox("getValue");
    var params = {
        method: "POST",
        url: "metatype/",
        zh_name: zh_name,
        en_name: en_name,
        val_num: val_num,
        example: example,
        is_sorted: is_sorted,
        kind: kind,
        collection: collection,
        description: description,
        domain: domain,
        vocabulary_type_id: vocabulary_type_id
    };

    if (lom_id) {
        params.lom_id = lom_id;
    }


    $.post("/bcms/proxy", params, function (data) {
        if (data.id != null) {
            var dlg = $("#addDicItemDlg");
            dlg.find("form").form("reset");
            dlg.dialog("close");
            var node = $("#metadata_tree").tree("getSelected");
            $.post("/bcms/proxy", {
                url: "metalibrary/add_metatype",
                method: "POST",
                metatype_id: data.id,
                meta_library_id: node.id
            }, function (data2) {
                if (data2.result) {
                    alert("增加成功");
                } else {
                    alert("增加失败");
                }
            }, "json");

        } else {
            if (data.success == false) {
                dlg.dialog("fail");
            }
        }
    }, "json");


}

function showAddItemDlg() {
    var node = $("#metadata_tree").tree("getSelected");
    if (node && (node.node_type != 1)) {
        $("#addMetaItemDlg").dialog("open");
    } else {
        alert("请选择元数据标准");
    }

}
function showAddStructureItemDlg() {
    $("#addStructureItemDlg").dialog("open");
}

function showAddDicItemDlg() {
    var node = $("#metadata_tree").tree("getSelected");
    if (node && (node.node_type != 1)) {
        $("#addDicItemDlg").dialog("open");
    } else {
        alert("请选择元数据标准");
    }
}