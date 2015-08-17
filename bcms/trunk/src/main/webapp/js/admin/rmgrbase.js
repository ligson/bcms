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
});