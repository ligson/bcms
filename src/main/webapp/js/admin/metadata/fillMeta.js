/**
 * Created by Administrator on 2015/8/26.
 */
$(function () {
    $("thead").dblclick(function () {
        $(this).next().toggle();
        //alert("---");
    });


    //	$('#dg').datagrid().datagrid('enableCellEditing');
    $("#metaGrid").treegrid({
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
                        return "<input type='text' class='easyui-textbox'>";
                    } else if (row.kind == 1) {
                        return "<input type='text' class='easyui-textbox'>";
                    } else if (row.kind == 2) {
                        return "<select class='easyui-combobox'><option>xxxx</option><option>xxxx</option></select>";
                    } else if (row.kind == 3) {
                        return "";
                    } else if (row.kind == 4) {
                        return "<input type='text' class='easyui-datebox'>";
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
                    field: "增加", title: "增加", width: 50, formatter: function (value, row, idx) {
                    //console.log(JSON.stringify(row));
                    var jsonString = JSON.stringify(row);
                    //id, zh_name, en_name, kind, val_num, collection
                    return "<a class='easyui-linkbutton' onclick='appendMetaRow(\"" + row.id + "\",\"" + row.zh_name + "\",\"" + row.en_name + "\"," + row.kind + "," + row.val_num + "," + row.collection + ",\"" + row.example + "\")'>增加</a>";
                }
                }

            ]
        ],
        onLoadSuccess: function (data) {
            $(".easyui-textbox").textbox();
            $(".easyui-datebox").datebox();
            $(".easyui-combobox").combobox();
            $(".easyui-linkbutton").linkbutton();
        }
    });
});

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
function appendMetaRow(id, zh_name, en_name, kind, val_num, collection, example) {
    //console.log(jsonString);
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