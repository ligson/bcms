/**
 * Created by ligson on 2015/8/17.
 *  "libId": "库id",
 "libName": "库名称",
 "categoryId": "分类id",
 "categoryName": "分类名称"
 "playNum": "点播数",
 "recommendNum": "推荐数",
 "collectNum": "收藏数"
 */
$(function () {
    $("#logGrid").datagrid({
        columns: [
            [
                {field: 'id', title: 'id', width: 100},
                {field: 'user_name', title: '名称', width: 100, sortable: true},
                {field: 'resource_name', title: '资源名称', width: 100},
                {field: 'operation', title: '操作', width: 100, sortable: true},
                {field: 'result', title: '操作结果', width: 100, sortable: true},
                {field: 'create_date', title: '操作日期', width: 100, sortable: true}
            ]
        ]
    });

});
