/**
 * Created by Ruby on 2015/8/23.
 */
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
                title: '专题名称',
                width: 100,
                sortable: true
            }, {
                field: 'resourceNum',
                title: '描述',
                width: 100,
                sortable: true
            }, {
                field: 'index',
                title: '状态',
                width: 100,
                sortable: true
            }
            ]
        ]
    });
});
function addTopic(){
    $('#add_topic_dlg').dialog('open').dialog("setTitle", "添加专题");
}