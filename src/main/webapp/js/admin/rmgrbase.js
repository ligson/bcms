/**
 * Created by ligson on 2015/8/17.
 */

function formatCategoryTreeData(data) {
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.children = formatCategoryTreeData(obj.children);
        }
        fin.push(obj);
    }
    return fin;
}
function removeCategory() {
    var tree = $("#categoryTree");
    var selectNode = tree.tree("getSelected");
    if (selectNode) {
        $.post("/bcms/proxy", {method: "DELETE", url: "resourcelibrary/" + selectNode.id}, function (data) {
            if (data.id != undefined) {
                alert("删除成功!");
                tree.tree("reload");
            } else {
                alert("删除失败!");
            }
        }, "json");
    }
}
function addCategory() {
    var tree = $("#categoryTree");
    var selectNode = tree.tree("getSelected");
    $("#addCategoryDlg").dialog("open");
    if (selectNode) {
        $("#parentCategoryId").val(selectNode.id);
    }
}
function editCategory() {
    $("#editCategoryDlg").dialog("open");
}
function showContextMenu(e, node) {
    e.preventDefault();
    $("#treeContextMenu").menu("show", {
        left: e.pageX,
        top: e.pageY
    });
}
$(function () {
    $("#categoryTree").tree({
        onContextMenu: function (e, node) {
            showContextMenu(e, node);
        },
        loadFilter: function (data) {
            return formatCategoryTreeData(data.rows);
        },
        onClick: function (node) {
            //alert(node.id);
            if (window.location.href.indexOf("rmgr.jsp") >= 0) {
                $("#rGrid").datagrid({url: "/bcms/proxy?url=resource&method=GET&library_id=" + node.id});
            } else {
                window.location.href = "/bcms/admin/resourcemgr/rmgr.jsp";
            }

        }
    });

    $("#metatypetree").combobox({
        textField: "name",
        valueField: "id",
        panelHeight: 'auto'
    });
    /* $("#metatypetree").combotree({
     url: "/bcms/categoryTree",
     formatter: function (node) {
     return node.name;
     },
     loadFilter: function (data, parent) {
     for (var i = 0; i < data.length; i++) {
     if (data[i].node_type == 1) {
     data[i].iconCls = "icon-06";
     }
     }
     return data;
     },
     onSelect: function (node) {
     $("#metatypetree").combotree("setValue", node.id);
     }
     });*/

    $("#addCategoryDlg").dialog({
        buttons: [
            {
                text: "提交",
                handler: function () {
                    if ($("#addCategoryDlg").find("form").form("validate")) {
                        var name = $("#name13").textbox("getValue");
                        var description = $("#description13").textbox("getValue");
                        var metalibrary_id = $("#metatypetree").combobox("getValue");
                        var params = {
                            name: name,
                            description: description,
                            metalibrary_id: metalibrary_id,
                            url: "resourcelibrary/",
                            method: "POST"
                        };
                        var pId = $("#parentCategoryId").val();
                        if (pId != "" && pId != null) {
                            params.parent_id = pId;
                        }
                        $.post("/bcms/proxy", params, function (data) {
                            if (data.id != null) {
                                $("#categoryTree").tree("reload");
                                $("#addCategoryDlg").dialog("close");
                            } else {
                                alert("失败了.你问问管理员,好吗?");
                            }
                        }, "json");
                    }
                }
            },
            {
                text: "取消",
                handler: function () {
                    $("#addCategoryDlg").dialog("close");
                }
            }
        ]
    });
});