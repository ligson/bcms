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
        if(selectNode.children&&selectNode.children.length>0){
            alert("请手动删除子分类或者标准!");
            return;
        }
        if(selectNode.resources&&selectNode.resources.length>0){
            alert("请手动删除该标准下的所有资源!");
            return;
        }
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
    var tree = $("#categoryTree");
    var selectNode = tree.tree("getSelected");
    $("#editCategoryDlg").dialog("open");
    if (selectNode) {
        $("#name14").textbox("setValue", selectNode.name);
        $("#updateMetatypetree").combobox("setValue", selectNode.metalibrary_id);
        $("#tagTree14").combotree("setValues", selectNode.tag_ids);
        $("#description14").textbox("setValue", selectNode.description);
        $("#imagePath14").val(selectNode.image_path);
        $("#id14").val(selectNode.id);
        $("#parentCategoryId14").val(selectNode.parent_id);
    } else {
        alert("选中要编辑的行！");
    }
}

function submitForm() {
    if ($("#editCategoryDlg").find("form").form("validate")) {
        var name = $("#name14").textbox("getValue");
        var description = $("#description14").textbox("getValue");
        var metalibrary_id = parseInt($("#updateMetatypetree").combobox("getValue"));
        var tag_ids = $("#tagTree14").combobox("getValues");
        var image_path = $("#imagePath14").val();
        var parent_id = parseInt($("#parentCategoryId14").val());
        var id = parseInt($("#id14").val());
        var params = {
            name: name,
            description: description,
            metalibrary_id: metalibrary_id,
            tag_ids:"["+tag_ids+"]",
            image_path: image_path,
            url: "resourcelibrary/" + id,
            method: "PUT"
        };
        if (parent_id) {
            params.parent_id = parent_id;
        }

        $.post("/bcms/proxy", params, function (data) {
            if (data.id != null) {
                $("#categoryTree").tree("reload");
                $("#editCategoryDlg").dialog("close");
            } else {
                alert("失败了.你问问管理员,好吗?");
            }
        }, "json");
    }
}

function clearForm() {
    $("#editCategoryDlg").dialog("close");
}

function removeit() {
    var tree = $("#categoryTree");
    var selectNode = tree.tree("getSelected");
    if (selectNode) {
        if(selectNode.children&&selectNode.children.length>0){
            alert("请手动删除子分类或者标准!");
            return;
        }
        if(selectNode.resources&&selectNode.resources.length>0){
            alert("请手动删除该标准下的所有资源!");
            return;
        }
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

function showContextMenu(e, node) {
    e.preventDefault();
    $("#treeContextMenu").menu("show", {
        left: e.pageX,
        top: e.pageY
    });
}

function loadAllRes() {
    //alert(node.id);
    if (window.location.href.indexOf("rmgr.jsp") >= 0) {
        $("#rGrid").datagrid({url: "/bcms/proxy?url=resource&method=GET"});
    } else {
        window.location.href = "/bcms/admin/resourcemgr/rmgr.jsp";
    }
}
function setData(data) {
    if (data != undefined) {
        for (var i = 0; i < data.length; i++) {
            data[i].text = data[i].name;
            setData(data[i].children);
        }
    }
};
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
    $("#updateMetatypetree").combobox({
        textField: "name",
        valueField: "id",
        panelHeight: 'auto'
    });

    $("#tagTree13").combotree({
        loadFilter: function (data) {
            for (var i = 0; i < data.rows.length; i++) {
                data.rows[i].text = data.rows[i].name;
                setData(data.rows[i].children);
            }
            return data.rows;
        }
    });
    $("#tagTree14").combotree({
        loadFilter: function (data) {
            for (var i = 0; i < data.rows.length; i++) {
                data.rows[i].text = data.rows[i].name;
                setData(data.rows[i].children);
            }
            return data.rows;
        }
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
                        var tag_ids = $("#tagTree13").combobox("getValues");
                        var params = {
                            name: name,
                            description: description,
                            metalibrary_id: metalibrary_id,
                            tag_ids:"["+tag_ids+"]",
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