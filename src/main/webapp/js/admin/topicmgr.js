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
        singleSelect: false,
        toolbar: "#rGridTbr",
        url: "/bcms/proxy?url=special&method=GET",
        pagination: true,
        rownumbers: true,
        columns: [
            [
                {
                    field: 'name',
                    title: '专题名称',
                    width: '10%'
                }, {
                field: 'description',
                title: '描述',
                width: "20%"
            }, {
                field: 'is_public',
                title: '状态',
                width: "5%",
                align: 'center',
                formatter: function (value, row, index) {
                    return value == true ? "启用" : "禁用";
                }
            }, {
                field: 'created_at',
                title: '创建时间',
                width:"10%",
                formatter: function (value, row, index) {
                    return new Date(value).format("yyyy-MM-dd HH:mm:ss");
                }
            }, {
                field: 'click_number',
                title: '点击量'
            }, {
                field: '_operate', width: '10%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="editTopic(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delTopic(' + index + ')">删除</a>';
                }
            }
            ]
        ]
    });

});
function addTopic(){
    $('#add_topic_dlg').dialog('open').dialog("setTitle", "添加专题");
}