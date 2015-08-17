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
    $("#rGrid").datagrid({
        columns: [
            [
                {field: 'id', title: 'id', width: 100},
                {field: 'name', title: '名称', width: 100, sortable: true},
                {field: 'libId', title: '库id', width: 100},
                {field: 'libName', title: '库名称', width: 100, sortable: true},
                {field: 'categoryId', title: '分类id', width: 100},
                {field: 'categoryName', title: '分类名称', width: 100, sortable: true},
                {field: 'playNum', title: '点播数', width: 100, sortable: true},
                {field: 'recommendNum', title: '推荐数', width: 100, sortable: true},
                {field: 'collectNum', title: '收藏数', width: 100, sortable: true},
                {
                    field: 'publishState',
                    title: '发布状态',
                    width: 100,
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (row.publishState) {
                            return "已发布";
                        } else {
                            return "未发布";
                        }
                    }
                },
                {
                    field: 'applyState',
                    title: '审核状态',
                    width: 100,
                    sortable: true,
                    formatter: function (value, row, index) {
                        if (row.applyState) {
                            return "已审核";
                        } else {
                            return "未审核";
                        }
                    }
                }, {
                field: "editOpt"
            }
            ]
        ]
    });
});