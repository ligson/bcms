$(function () {

    initGroupTree();
    var gtreeData;
    $('#group_role_grid').datagrid({
        title: '用户组角色列表',
        iconCls: 'icon-save',
        sortOrder: 'desc',
        pageSize: 30,
        columns: [[
            {field: 'id', title: 'ID', width: '5%'},
            {field: 'name', title: '角色名称', width: '20%', align: 'center'},
            {field: 'roles', title: '权限', width: '50%', align: 'center'},
            {
                field: '_operate', width: '15%', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="delUser(' + index + ')">移除角色</a>';
                }
            }
        ]],
        pagination: true,
        rownumbers: true,
        singleSelect: false
    });
});


function initGroupTree() {
    $.get("/bcms/proxy", {url: "group/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            var obj = jQuery.parseJSON(obj.data);
            gtreeData=formatGroupListData(obj);
            $("#group_tree").tree({data: gtreeData});
        } else {
            alert(obj.msg);
        }
    });
}

function clickAddGroup(){
    //initAuthCombobox();
    $('#add_group_dlg').dialog('open');
}

function addGroup(){

}



function formatGroupListData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        obj.children=[];
        fin.push(obj);
    }
    return fin;
}

