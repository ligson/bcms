/**
 * Created by Ruby on 2015/8/31.
 */
$(function () {
    $("#select_user_list").datalist({
        textField: 'name',
        valueField: 'id',
        data:[{'id': 01, 'name':"我是谁"}]
    });
    initDepartmentTree();

});


function initDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            $("#add_message_dlg #department_tree").tree({
                data: formatTreeData(data), onClick: function (node) {
                    initUserListByDepartment(node);
                }
            });
        } else {
            alert(obj.msg);
        }
    });
}

function initUserListByDepartment(node) {
    $.post("/bcms/proxy", {method: "get", url: "department/" + node.id + "/user/page/1"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var data = jQuery.parseJSON(obj.data);
            var rows = $('#select_user_list').datalist("getData").rows;
            for (var j = 0; j < rows.length; j++) {
                for (var x = 0; x < data.length; x++) {
                    if (rows[j].id == data[x].id) {
                        data[x].checked = true;
                    }
                }
            }
            $("#add_message_dlg #user_list").datalist({
                checkbox: true,
                singleSelect:false,
                textField: 'cn_name',
                valueField: 'id',
                data: data,
                onCheck: function (index, row) {
                    $("#add_message_dlg #select_user_list").datalist('appendRow', {'id': row.id, 'name': row.cn_name});
                },
                onUncheck:function(index,row) {
                    var rows = $("#select_user_list").datalist('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        if (rows[i].id == row.id) {
                            var sIndex = $("#select_user_list").datalist('getRowIndex', rows[i]);
                            $("#select_user_list").datalist('deleteRow', sIndex);
                        }
                    }
                }
            });
        } else {
            alert(obj.msg);
        }
    });
}

function formatTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        if (obj.children && obj.children.length > 0) {
            obj.children = formatTreeData(obj.children);
        }
        fin.push(obj);
    }
    return fin;
}