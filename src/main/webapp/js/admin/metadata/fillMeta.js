/**
 * Created by Administrator on 2015/8/26.
 */
var datas = [];
$(function () {
    $("thead").dblclick(function () {
        $(this).next().toggle();
        //alert("---");
    });
    var href = window.location.href;
    var idx = href.indexOf("id=");
    var resourceId = href.substring(idx + 3);
    //	$('#dg').datagrid().datagrid('enableCellEditing');
    $("#metaGrid").treegrid({
        url: "/bcms/proxy?url=resource/" + resourceId + "/meta&method=GET",
        idField: "id",
        treeField: "zh_name",
        fitColumns: true,
        //onContextMenu: onContextMenu,
        columns: [
            [
                {
                    field: "id", title: "id", width: 50
                },
                {
                    field: "zh_name", title: "项", width: 50
                },
                {
                    field: "value", title: "值", width: 200, formatter: function (value, row, idx) {
                    if (row.kind == 0) {
                        return "<input type='text' class='easyui-textbox etextbox' id='fill-" + row.id + "'>";
                    } else if (row.kind == 1) {
                        return "<input type='text' class='easyui-textbox etextbox' id='fill-" + row.id + "'>";
                    } else if (row.kind == 2) {
                        return "<select editable='false' style='width:200px;' class='easyui-combobox ecombobox' id='fill-" + row.id + "'></select>";
                    } else if (row.kind == 3) {
                        return "";
                    } else if (row.kind == 4) {
                        return "<input type='text' class='easyui-datebox edatebox' id='fill-" + row.id + "'>";
                    }
                }
                },
                {
                    field: "example", title: "举例", width: 50
                },
                {
                    field: "val_num", title: "取值数", width: 50
                },
                {
                    field: "add", title: "增加", width: 50, formatter: function (value, row, idx) {
                    //console.log(JSON.stringify(row));
                    //var jsonString = JSON.stringify(row);
                    //id, zh_name, en_name, kind, val_num, collection
                    if (row.id.toString().indexOf("-") > -1) {
                        return "--";
                    } else {
                        return "<a class='easyui-linkbutton' onclick='appendMetaRow(\"" + row.id + "\",\"" + row.zh_name + "\",\"" + row.en_name + "\"," + row.kind + "," + row.val_num + "," + row.collection + ",\"" + row.example + "\")'>增加</a>";
                    }
                }
                }, {
                field: "remove", title: "移除", width: 50, formatter: function (value, row, idx) {
                    if (row.id.toString().indexOf("-") == -1) {
                        return "--";
                    } else {
                        return "<a class='easyui-linkbutton' onclick='removeMetaRow(\"" + row.id + "\",\"" + row.zh_name + "\",\"" + row.en_name + "\"," + row.kind + "," + row.val_num + "," + row.collection + ",\"" + row.example + "\")'>移除</a>";
                    }
                }
            }

            ]
        ],
        onLoadSuccess: function (data) {
            $(".easyui-textbox").textbox();
            $(".easyui-datebox").datebox();
            $(".easyui-combobox").combobox();
            $(".easyui-linkbutton").linkbutton();

            var dt = $('#metaGrid').treegrid("getData");
            for (var i = 0; i < dt.length; i++) {
                var kind = dt[i].kind;
                var rowId = dt[i].id;
                if (kind == 2) {
                    var vId = dt[i].vocabulary_type_id;
                    var vBox = $("#fill-" + rowId);
                    vBox.combobox({valueField: "id", textField: "name"});
                    $.post("/bcms/proxy?url=vocabulary/" + vId + "&method=GET", {}, function (data1) {
                        vBox.combobox("loadData", data1.words);
                    }, "json");
                } else if (kind == 3) {
                    //var sId = dt[i].structure_type_id;

                }
                //console.log(dt[i].id);
            }
            //var data = $('#metaGrid').treegrid("getData");
            //$('#metaGrid').treegrid("loading");
            //loadDatas(data);
            //$('#metaGrid').treegrid("loaded");
        },
        loadFilter: function (data, parentId) {
            var data2 = {};
            for (var i = 0; i < data.length; i++) {
                if (data[i].kind == 3) {
                    data[i].state = "closed";
                }
            }
            data2.rows = data;
            data2.total = data.length;
            return data2;
        }
    });
});

function loadDatas(data) {
    for (var i = 0; i < data.length; i++) {
        var isExist = false;
        for (var j = 0; j < datas.length; j++) {
            if (datas[j].id == data[i].id) {
                isExist = true;
                break;
            }
        }
        if (!isExist) {
            datas.push(data[i]);
        }
        if (data.children) {
            loadDatas(data.children);
        }
    }

}

/****
 *  "id": "1",
 "zh_name": "多语言字符串类型",
 "en_name": "多语言字符串类型",
 "description": "字段描述",
 "kind": 0,
 "lom_id": "9.2",
 "domain": "xxxx",
 "example": "xxxx",
 "collection": 0,
 "val_num": 10
 * @param jsonString
 */
var idIndex = 1;
function dealChildren(nodeId, children) {
    if (children) {
        for (var i = 0; i < children.length; i++) {
            children[i].id = nodeId + "-" + idIndex++;
            //col.push(children[i]);
            dealChildren(children[i].id, children[i].children);
        }
    }
}

function removeMetaRow(id, zh_name, en_name, kind, val_num, collection, example) {
    var count = 0;
    for (var i = 0; i < datas.length; i++) {
        var data = datas[i];
        if ((data.zh_name == zh_name) && (data.en_name == en_name) && (data.kind == kind) && (data.val_num == val_num) && (data.collection == collection) && (data.example == example)) {
            count = count + 1;
        }
    }
    if (count > 1) {
        var index = -1;
        for (var i = 0; i < datas.length; i++) {
            var data = datas[i];
            if (data.id == id) {
                index = i;
            }
        }
        if (index >= 0) {
            datas.splice(index, 1);
        }
        $('#metaGrid').treegrid("remove", id);
    } else {
        alert(zh_name + "项的取值数最少1个");
    }

}
function appendMetaRow(id, zh_name, en_name, kind, val_num, collection, example) {
    //console.log(jsonString);

    var count = 0;
    for (var i = 0; i < datas.length; i++) {
        var data = datas[i];
        if ((data.zh_name == zh_name) && (data.en_name == en_name) && (data.kind == kind) && (data.val_num == val_num) && (data.collection == collection) && (data.example == example)) {
            count = count + 1;
        }
    }
    if (count >= val_num) {
        alert(zh_name + "项的取值数最多" + val_num + "个");
        return;
    }

    var data1 = $('#metaGrid').treegrid("find", id);

    //if (data) {
    //console.log(data);
    //data.id = id + "-" + idIndex;
    idIndex++;

    //console.log(data1.children);

    var nodeId = id + "-" + idIndex;
    var clone1 = data1.children;
    dealChildren(nodeId, clone1);
    var d = {
        id: nodeId,
        zh_name: zh_name,
        en_name: en_name,
        kind: kind,
        val_num: val_num,
        collection: collection,
        example: example,
        children: clone1
    };

    $('#metaGrid').treegrid('insert', {
        after: id,
        data: d
    });
    //}

}

function onContextMenu(e, row) {
    e.preventDefault();
    $(this).treegrid('select', row.id);
    $('#mm').menu('show', {
        left: e.pageX,
        top: e.pageY
    });
}

var idIndex = 100;
function append() {
    idIndex++;
    var d1 = new Date();
    var d2 = new Date();
    d2.setMonth(d2.getMonth() + 1);
    var node = $('#metaGrid').treegrid('getSelected');
    $('#metaGrid').treegrid('append', {
        parent: node.id,
        data: [{
            id: idIndex,
            name: 'New Task' + idIndex,
            persons: parseInt(Math.random() * 10),
            begin: $.fn.datebox.defaults.formatter(d1),
            end: $.fn.datebox.defaults.formatter(d2),
            progress: parseInt(Math.random() * 100)
        }]
    })
}

function submitMetaForm() {
    var tboxes = $(".etextbox");
    var tbx = $(tboxes[0]);
    alert(tbx.textbox("getValue"));
    var id = $($($(".etextbox")[0]).parent().parent().parent()).find("td[field='id']").text();
    alert(id);

}