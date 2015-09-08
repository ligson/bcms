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

function submitAddMetaCategory() {
    var name = $("#categoryName1").textbox("getValue");
    var desc = $("#categoryDesc1").textbox("getValue");
    var parent_id = $("#addMetaCategoryDlg").find("input[name=name]").val();
    var params = {
        url: "metalibrarycategory/",
        method: "POST"
    };
    if (name) {
        params.name = name;
    } else {
        return;
    }
    if (desc) {
        params.description = desc;
    }
    if (parent_id) {
        params.parent_id = parent_id;
    }
    $.post("/bcms/proxy", params, function (data) {
        if (data.id != null) {
            $("#addMetaCategoryDlg").dialog("close");
        } else {
            if (data.success != null && data.success == false) {
                alert(data.msg);
            }
        }
    }, "json");
}