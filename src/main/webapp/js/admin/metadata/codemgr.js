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
    $("#addEncodeItemDlg").dialog("open");
}
function showAddEncodeTypeDlg() {
    $("#addEncodeTypeDlg").dialog("open");
}

function submitAddEncode() {
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
$(function () {
    $("#metaGrid").treegrid({
        idField: 'id',
        treeField: 'name',
        fitColumns: true,
        columns: [[
            {field: "id", title: "id", width: 100, hidden: true},
            {field: "name", title: "属性", width: 100},
            {field: "code", title: "编码", width: 100},
            {
                field: "edit", title: "编码", width: 100, formatter: function (value, row, index) {
                return "<a>编辑</a>";
            }
            }
        ]]
    });

});
