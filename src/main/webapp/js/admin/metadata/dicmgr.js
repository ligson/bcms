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

function showAddDicItemDlg() {
    $("#addDicItemDlg").dialog("open");
}
function showAddDicTypeDlg() {
    $("#addDicTypeDlg").dialog("open");
}

/****
 * "id": "FI-SW-01",
 "zh_name": "Koi",
 "en_name": "Koi",
 "lom_id": "5.2",
 "source": "XXXXX",
 "words"
 */
$(function () {
    $("#metaGrid").datagrid({
        columns: [[
            {field: "id", title: "id", width: 100},
            {field: "zh_name", title: "中文名称", width: 100},
            {field: "en_name", title: "英文名称", width: 100},
            {field: "lom_id", title: "lom编号", width: 100},
            {field: "source", title: "来源", width: 100},
            {
                field: "words", title: "词汇表", width: 100, formatter: function (value, row, idx) {
                var words = "";
                if (row.words) {
                    for (var i = 0; i < row.words.length; i++) {
                        words += row.words[i];
                        if (i != row.words.length - 1) {
                            words += ";";
                        }
                    }
                }
                return words;
            }
            },
            {
                field: "edit", title: "编辑", width: 100, formatter: function (value, row, index) {
                return "<a onclick='showEditDicItemDlg(\"" + row.id + "\",\"" + row.zh_name + "\",\"" + row.en_name + "\",\"" + row.lom_id + "\",\"" + row.source + "\",\"" + row.words + "\")'>编辑</a>";
            }
            }
        ]]
    });

});

function showEditDicItemDlg(id, zh_name, en_name, lom_id, source, words) {
    //var row = $("#metaGrid").datagrid("getSelected");
    var dlg = $("#editDicItemDlg");
    $("#zh_name1").textbox("setText", zh_name);
    $("#en_name1").textbox("setText", en_name);
    $("#lom_id1").textbox("setText", lom_id);
    $("#source1").textbox("setText", source);
    $("#words1").textbox("setText", words);
    //dlg.find("input[name='zh_name']").val(zh_name);
    dlg.dialog("open");
}
function submitDicForm() {
    var form = $("#addDicForm");
    var zh_name = form.find("input[name='zh_name']").val();
    var en_name = form.find("input[name='en_name']").val();
    var lom_id = form.find("input[name='lom_id']").val();
    var source = form.find("input[name='source']").val();
    var words = form.find("input[name='words']").val();
    $.post("/bcms/proxy", {
        method: "post",
        url: "/vocabulary/",
        zh_name: zh_name,
        en_name: en_name,
        lom_id: lom_id,
        source: source,
        words: words
    }, function (data) {
        var result = JSON.parse(data);
        if (result.success) {
            $("#addDicTypeDlg").dialog("close");
        } else {
            alert("创建失败!");
        }
    });
}
