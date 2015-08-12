$(function () {

        initTree();
});

function initTree() {
    $.post("/index/httpGet", {url: "group/"}, function (data) {
        if (data.success) {
            var obj = $.parseJSON(data.data);
            $("#auth_tree").tree({
                data: handle(obj), onClick: function (node) {
                    alert(node.roles);
                }
            });
        } else {
            alert(data.msg);
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



