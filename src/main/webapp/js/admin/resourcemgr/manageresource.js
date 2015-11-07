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
                {field: 'resourcelibrary_id', title: '库id', width: 100, sortable: true,
                    formatter: function (value, row, index) {
                        var data = $('#categoryTree').tree("find", value);
                        return data==null?"null(id:"+value+")":data.name+"(id:"+value+")";
                    }
                },
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
                {
                    field: 'kind', title: '类型', width: 100, sortable: true, formatter: function (value, row, idx) {
                    // 0 # 普通 1 # 课程 2 # 课时 3 # 素材
                    if (row.kind == 0) {
                        return "普通";
                    } else if (row.kind == 1) {
                        return "课程";
                    } else if (row.kind == 2) {
                        return "课时";
                    } else if (row.kind == 3) {
                        return "素材";
                    } else {
                        return row.kind;
                    }
                }
                },
                {
                    field: 'status', title: '状态', width: 100, sortable: true, formatter: function (value, row, idx) {
                    //默认是0 STATUS_EDIT = 0 STATUS_AUDIT = 1 STATUS_PASSED = 2 STATUS_REJECT = 3
                    if (row.status == 0) {
                        return "编辑";
                    } else if (row.status == 1) {
                        return "待审";
                    } else if (row.status == 2) {
                        return "通过";
                    } else if (row.status == 3) {
                        return "通过";
                    } else {
                        return row.status;
                    }
                }
                },
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
                },
                {
                    field: "subMeta", title: "子资源", width: 100, formatter: function (value, row, index) {
                    var href = "/bcms/admin/resourcemgr/createresource.jsp?id=" + row.id;
                    var href1 = "/bcms/admin/resourcemgr/manageresource.jsp?id=" + row.id;
                    return "<a class='easyui-linkbutton' href='" + href + "'>添加</a>"
                        +"<a class='easyui-linkbutton' href='" + href1 + "'>管理</a>";
                }
                }

            ]
        ],
        onLoadSuccess: function (data) {
            $(".easyui-linkbutton").linkbutton();

        }
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