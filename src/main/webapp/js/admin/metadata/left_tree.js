/**
 * Created by Ruby on 2015/8/17.
 */
$(function () {
    $("#metadata_tree").tree({
        url: "../../admin/metadata/lefttree.json",
        lines: true,
        onClick: function (node) {
            if (window.location.href.indexOf("metadataMgr.jsp") == -1) {
                $.cookie("meteMenuState", "open");
                window.location.href = "/bcms/admin/metadata/metadataMgr.jsp";
            }
            var mg = $("#metaGrid");
            if (mg) {
                mg.treegrid({url: node.href});
            }
        }
    });
});
function addMetaLib() {
    $("#addMetaLibDlg").dialog("open");
}
function addMetaCategory() {
    $("#addMetaCategoryDlg").dialog("open");
}
