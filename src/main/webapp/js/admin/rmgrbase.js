/**
 * Created by ligson on 2015/8/17.
 */
function addCategory() {
    //var tree = $("#categoryTree");
    //var selectNode = tree.tree("getSelected");
    $("#addCategoryDlg").dialog("open");
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
        }
    });

    $("#metatypetree").combotree({
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
        onSelect:function(node){
            $("#metatypetree").combotree("setValue",node.id);
        }
    });

    $("#addCategoryDlg").dialog({
        buttons: [
            {
                text: "提交",
                handler: function () {

                }
            },
            {
                text: "取消",
                handler: function () {

                }
            }
        ]
    });
});