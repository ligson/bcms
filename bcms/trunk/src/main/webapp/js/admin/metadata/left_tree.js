/**
 * Created by Ruby on 2015/8/17.
 */
$(function () {
    $("#metadata_tree").tree({
        url: "../../admin/metadata/lefttree.json",
        lines: true,
        onClick: function (node) {
            $("#metaGrid").treegrid({url:node.href})
        }
    });
});
function addMetaLib() {
    $("#addMetaLibDlg").dialog("open");
}

