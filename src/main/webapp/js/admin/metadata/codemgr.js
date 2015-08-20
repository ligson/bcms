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

$(function () {
    $("#metaGrid").datagrid({
        columns: [[
            {field: "id", title: "id", width: 100},
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
