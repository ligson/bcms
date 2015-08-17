/**
 * Created by ligson on 2015/8/17.
 *   "id": "1",
 "name": "案例库1",
 "index": 2,
 "resourceNum": 12,
 "isVisible": true
 */
$(function () {
    $("#rGrid").datagrid({
        columns: [
            [
                {
                    field: 'id',
                    title: 'id',
                    width: 100,
                    sortable: true
                }, {
                field: 'name',
                title: '案例库名称',
                width: 100,
                sortable: true
            }, {
                field: 'resourceNum',
                title: '资源数',
                width: 100,
                sortable: true
            }, {
                field: 'index',
                title: '显示顺序',
                width: 100,
                sortable: true
            }, {
                field: 'isVisible',
                title: '是否显示',
                width: 100,
                sortable: true, formatter: function (value, row, index) {
                    if (row.isVisible) {
                        return "是";
                    } else {
                        return "否";
                    }
                }
            }, {
                field: 'createDate',
                title: '创建日期',
                width: 100,
                sortable: true, formatter: function (value, row, index) {
                    return Date.convertTxtFormat(row.createDate);
                }
            }
            ]
        ]
    });
});