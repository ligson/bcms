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
        onContextMenu: onContextMenu,
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
                    field: "增加", title: "增加", width: 50, formatter: function (value, row, idx) {
                    console.log(row.id);
                    return "<a class='easyui-linkbutton' onclick='appendMetaRow()'>增加</a>";
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
function appendMetaRow() {

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