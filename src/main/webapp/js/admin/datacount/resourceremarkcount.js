/**
 * Created by ligson on 2015/8/11.
 */

$(function () {
    $("#dataGrid").datagrid({
        url: "/bcms/proxy?url=query/comment_all&method=GET&isStatsticalQuery=true",
        singleSelect: false,
        pagination: true,
        columns: [
            [
                {field: 'userId', title: '用户ID', width: "5%", align: 'left'},
                {field: 'userName', title: '用户名', width: "10%", align: 'center'},
                {field: 'createDate', title: '发表日期', width: "10%", align: 'center'},
                {field: 'resourceId', title: '资源ID', width: "5%", align: 'right'},
                {field: 'resourceName', title: '资源名', width: "15%", align: 'center'},
                {field: 'content', title: '评论内容', width: "55%", align: 'center'}
            ]
        ]
    });
});