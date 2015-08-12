/**
 * Created by ligson on 2015/8/11.
 */
function delremark(rId) {
    alert(rId);
}
$(function () {
    $("#dataGrid").datagrid({
        columns: [
            [
                {field: 'ck', checkbox: true},
                {field: 'id', title: 'id', width: 180, align: 'left'},
                {field: 'userId', title: '用户ID', width: 150, align: 'left'},
                {field: 'userName', title: '用户名', width: 100, align: 'left'},
                {field: 'createDate', title: '发表日期', width: 100, align: 'left'},
                {field: 'resourceId', title: '资源ID', width: 100, align: 'right'},
                {field: 'resourceName', title: '资源名', width: 100, align: 'right'},
                {field: 'content', title: '评论内容', width: 100, align: 'right'},
                {
                    field: "delOption", title: '删除', width: 100, align: 'right', formatter: function (value, row, index) {
                    return "<input type='button' value='删除' onclick='delremark(" + row.id + ")'/>";
                }
                }
            ]
        ]
    });
});