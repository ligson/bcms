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
            gtreeData=handle(obj);
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


function handle(list){
        var map = {};
        for(var i = 0; i < list.length; i++){
            map[list[i].id] = list[i];
        }
        var fin = [];
        for(var i = 0; i < list.length; i++){
            var obj = list[i];
            if(!obj.parent || obj.parent == null){
                if(obj.children && obj.children.length>0){
                    var children = obj.children;
                    var childrenList = [];
                    for(var j = 0; j < children.length; j++){
                        childrenList.push(handleChildren(map[children[j]], map));
                    }
                    obj.children = childrenList;
                }
                obj.text=obj.name;
                fin.push(obj);
            }
        }
        return fin;
    }
    function handleChildren(childrenMap , map){
        if(childrenMap.children && childrenMap.children.length > 0){
            var children = childrenMap.children;
            var childrenList = [];
            for(var j = 0; j < children.length; j++){
                childrenList.push(handleChildren(map[children[j]], map));
            }
            childrenMap.children = childrenList;
            childrenMap.text=childrenMap.name;
            return childrenMap;
        }else{
            var children = childrenMap.children;
            var childrenList = [];
            for(var j = 0; j < children.length; j++){
                childrenList.push(map[children[j]]);
            }
            childrenMap.children = childrenList;
            childrenMap.text=childrenMap.name;
            return childrenMap;
        }
        return null;
    }



