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
        url: "/bcms/proxy?url=resource&method=GET",
        fitColumns: true,
        autoRowHeight: true,
        fit: true,
        columns: [
            [
                {field: 'id', title: 'id', width: 100},
                {field: 'name', title: '名称', width: 100, sortable: true},
                {field: 'resourcelibrary_id', title: '库id', width: 100, sortable: true},
                {
                    field: 'created_at',
                    title: '创建日期',
                    width: 100,
                    sortable: true,
                    formatter: function (value, row, index) {
                        var date = Date.parseFromText(row.created_at, "yyyy-MM-ddTHH:mm:ssZ");
                        return date.format("yyyy-MM-dd HH:mm:ss");
                    }
                },
                {field: 'kind', title: '类型', width: 100, sortable: true},
                {field: 'status', title: '状态', width: 100, sortable: true},
                {
                    field: 'delOpt', title: '删除', width: 100, formatter: function (value, row, index) {
                    return "<a class='easyui-linkbutton' onclick='delResource(" + row.id + ")'>删除</a>";
                }
                },
                {
                    field: 'editOpt', title: '基本信息', width: 100, formatter: function (value, row, index) {
                    var href = "/bcms/admin/resourcemgr/editresource.jsp?id=" + row.id;
                    return "<a class='easyui-linkbutton' href='" + href + "'>编辑</a>";
                }
                },
                {
                    field: "editMeta", title: "元数据", width: 100, formatter: function (value, row, index) {
                    var href = "/bcms/admin/resourcemgr/editmeta.jsp?id=" + row.id;
                    return "<a class='easyui-linkbutton' href='" + href + "'>编辑</a>";
                }
                }
            ]
        ]
    });
});

function delResource(metaId) {
    $.post("/bcms/proxy?url=resource/" + metaId + "&method=DELETE", {}, function (data) {
        if (data.id != undefined) {
            $("#rGrid").datagrid("reload");
        }
    }, "json");
}
function addMetaItems() {
    $(".items-container").append("<div class='items'>" + $(".items").html() + "</div>");
}

function addField() {
    $("#fieldHref").before("<br/><input type=\"text\" class=\"easyui-textbox\">");
}