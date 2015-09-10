/**
 * Created by Ruby on 2015/8/17.
 */
$(function () {
    $("#metadata_tree").tree({
        url: "/bcms/categoryTree",
        lines: true,
        formatter: function (node) {
            return node.name;
        },
        onClick: function (node) {
            if (window.location.href.indexOf("metadataMgr.jsp") == -1) {
                $.cookie("meteMenuState", "open");
                window.location.href = "/bcms/admin/metadata/metadataMgr.jsp";
            }
            var mg = $("#metaGrid");
            if (mg) {
                mg.treegrid({url: node.href});
            }
        },
        loadFilter: function (data, parent) {
            //console.log(node.iconCls);
            for (var i = 0; i < data.length; i++) {
                if (data[i].children_type == 2) {
                    data[i].iconCls = "icon-06";
                }
            }
            return data;
        }
    });
});
function addMetaLib() {
    var node = $("#metadata_tree").tree("getSelected");
    $("#categoryId10").val(node.id);
    $("#addMetaLibDlg").dialog("open");
}
function addMetaCategory() {
    var node = $("#metadata_tree").tree("getSelected");
    var dlg = $("#addMetaCategoryDlg");
    dlg.dialog("open");
    if (node) {
        dlg.find("input[name='parent_id']").val(node.id);
    }
}

function submitAddMetaLib() {
    var node = $("#metadata_tree").tree("getSelected");
    if (node.children_type == 2) {
        var categoryId10 = parseInt($("#categoryId10").val());
        if (categoryId10) {
            var name10 = $("#name10").val();
            var desc10 = $("#desc10").val();
            var version10 = $("#version10").val();
            $.post("/bcms/proxy", {
                url: "metalibrary/",
                method: "POST",
                name: name10,
                category_id: categoryId10,
                version: version10,
                description: desc10,
                meta_types:"[1]"
            }, function (data) {
                if (data.id != null) {
                    $("#addMetaLibDlg").dialog("close");
                    $("#metadata_tree").tree("reload");
                } else {
                    alert(data.msg);
                }
            }, "json");
        } else {

        }
    }
}
function submitAddMetaCategory() {
    var name = $("#categoryName1").textbox("getValue");
    var desc = $("#categoryDesc1").textbox("getValue");
    var parent_id = $("#addMetaCategoryDlg").find("input[name=parent_id]").val();
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
            $("#metadata_tree").tree("reload");
        } else {
            if (data.success != null && data.success == false) {
                alert(data.msg);
            }
        }
    }, "json");
}