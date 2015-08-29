/**
 "id": 1,
 "name": "文件1",
 "media_type": 1,
 "size": 100001,
 "create_date": "201212121212",
 "creator_id": "3",
 "creator_name": "xxxxx",
 "play_url": "/bcms/admin/resourcemgr/filelist.jsp"
 */
$(function () {
    $("#fileGrid").datagrid({
        autoRowHeight: true,
        fitColumns: true,
        columns: [
            [
                {field: 'id', title: 'id', width: 50},
                {field: 'name', title: '名称', width: 100, sortable: true},
                {field: 'size', title: '大小', width: 100, sortable: true},
                {
                    field: 'media_type', title: '媒体类型', width: 50, formatter: function (value, row, idx) {
                    return "<a plain='true' class='easyui-linkbutton' iconCls='icon-film'></a>";
                }
                },
                {field: 'creator_name', title: '创建者', width: 100, sortable: true},
                {field: 'create_date', title: '上传日期', width: 100, sortable: true},
                {
                    field: 'playOperator', title: '点播', width: 50, formatter: function (value, row, idx) {
                    return "<a plain='true' class='easyui-linkbutton' iconCls='icon-control_play_blue'></a>";
                }
                },
                {
                    field: 'shieldOperator', title: '屏蔽', width: 50, formatter: function (value, row, idx) {
                    return "<a plain='true' class='easyui-linkbutton' iconCls='icon-01'></a>";
                }
                }
            ]
        ],
        onLoadSuccess: function (data) {
            $(".easyui-linkbutton").linkbutton();
        }
    });

});
