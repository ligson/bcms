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
function reloadFileList(folderId) {
    $("#fileGrid").datagrid("reload");
}
function playFile(fileId) {
    alert("点播文件");
}
$(function () {
    $("#fileGrid").datagrid({
        autoRowHeight: true,
        rownumbers: false,
        fitColumns: true,
        columns: [
            [
                {
                    field: 'name', title: '名称', width: 100, formatter: function (value, row, idx) {
                    if (row.is_dir) {
                        return "<a onclick='reloadFileList(\"" + row.id + "\")' class='easyui-linkbutton' plain='true' iconCls='icon-folder'>" + row.name + "</a>";
                    } else {
                        return "<a  onclick='playFile(\"" + row.id + "\")'  class='easyui-linkbutton' plain='true' iconCls='icon-film'>" + row.name + "</a>";
                    }
                }
                },
                {field: 'create_date', title: '上传日期', width: 100, sortable: true}
            ]
        ],
        onLoadSuccess: function (data) {
            $(".easyui-linkbutton").linkbutton();
        }
    });

});
