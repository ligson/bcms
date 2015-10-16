$(function () {

    //初始化dategrid
    $('#auth_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url: "/bcms/proxy?url=permission&method=GET",
        columns:[[
            {field:'id',width:'8%',checkbox:true,title:'编号'},
            {field:'name',width:'10%',align:'center',title:'权限名称'},
            {field:'department',width:'20%',align:'center',title:'目标部门'},
            {field:'resource_lib',width:'20%',align:'center',title:'目标资源库'},
            {field:'type',width:'10%',align:'center',title:'权限分类'},
            {field:'description',width:'25%',align:'center',title:'备注'},
            {field:'_operate',width:'6%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editAuth('+ index + ')">修改</a>';
                }
            }
        ]],
        toolbar:[{
            text:'添加权限',iconCls:'icon-add',handler:function(){
                addAuth();
            }
        }]
    });
    var themes = [
        {value:'default',text:'添加用户',group:'用户'},
        {value:'gray',text:'修改用户',group:'用户'},
        {value:'metro',text:'删除用户',group:'用户'},
        {value:'bootstrap',text:'查看用户',group:'用户'},
        {value:'black',text:'添加角色',group:'角色'},
        {value:'metro-blue',text:'修改角色',group:'角色'},
        {value:'metro-gray',text:'删除角色',group:'角色'},
        {value:'metro-green',text:'查看角色',group:'角色'},
        {value:'metro-orange',text:'创建部门',group:'部门'},
        {value:'metro-red',text:'修改部门',group:'部门'},
        {value:'ui-cupertino',text:'删除部门',group:'部门'},
        {value:'ui-dark-hive',text:'查看部门',group:'部门'}
    ];

    var authdata=[{
        "id":1,
        "text":"用户",
        "children":[{
            "id":11,
            "text":"添加用户"
        },{
            "id":12,
            "text":"修改用户"
        },{
            "id":13,
            "text":"删除用户"
        },{
            "id":14,
            "text":"搜索用户"
        },{
            "id":15,
            "text":"查看用户"
        }]
    },
        {
            "id":2,
            "text":"部门",
            "children":[{
                "id":21,
                "text":"添加部门"
            },{
                "id":22,
                "text":"修改部门"
            },{
                "id":23,
                "text":"删除部门"
            },{
                "id":24,
                "text":"搜索部门"
            },{
                "id":25,
                "text":"查看部门"
            }]
        }
    ]
    $("#quanxian").combotree({data:authdata});
    $('#fwlx').combobox({
        editable: false,
        data: [{"value":1,"text":'部门'},{"value":2,"text":'资源库'}],
        onChange: function (newValue, oldValue) {
           if(oldValue!=newValue){
               $("#mbfw").combotree('clear');
               if(newValue==1){
                   $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
                       var obj = $.parseJSON(result);
                       if (obj.success==false) {
                           alert(obj.msg);
                       } else {
                           $("#mbfw").combotree('loadData', formatTreeData(obj));
                       }
                   });
               }else{
                   $("#mbfw").combotree('loadData', [{"id": 1, "text": "案例库",children:[{"id":11,"text":"分类1"}]}, {"id": 2, "text": "视频库",children:[{"id":21,"text":"电影"},{"id":22,"text":"电视剧"}]},{"id":3,"text":"课程中心库"},{"id":4,"text":"精品课程库"},{"id":5,"text":"虚拟仿真库"}]);
               }
            }
        }
    });
});

function editAuth(index) {
    $('#auth_table').datagrid('selectRow', index);
    var row = $('#auth_table').datagrid('getSelected');
    if (row) {
        $("#modify_auth_dlg input[name=id]").val(row.id);
        $("#modify_auth_dlg input[name=name]").val(row.name);
        $("#modify_auth_dlg input[name=description]").val(row.description);
        initAddDepartmentTree();
        $("#modify_auth_dlg .resourcelib_tree").combotree('loadData', [{"id": 1, "text": "案例库",children:[{"id":11,"text":"分类1"}]}, {"id": 2, "text": "视频库",children:[{"id":21,"text":"电影"},{"id":22,"text":"电视剧"}]},{"id":3,"text":"课程中心库"},{"id":4,"text":"精品课程库"},{"id":5,"text":"虚拟仿真库"}]);
        $('#modify_auth_dlg').dialog('open');
    } else {
        $.messager.alert("提示", "请选择要编辑的行！", "info");
        return;
    }
}

function initAddDepartmentTree() {
    $( '#modify_auth_dlg .department_tree' ).combotree ({
        url: "/bcms/departmentTree",
        lines: true,
        loadFilter: function (data) {
            return formatDepartmentTreeData(data);
        }
    });
}

function formatDepartmentTreeData(data){
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = data[i];
        obj.text = obj.name;
        obj.state="closed";
        if (obj.children && obj.children.length > 0) {
            obj.children = formatDepartmentTreeData(obj.children);
        }
        fin.push(obj);
    }
    return fin;
}

function addAuth(){
    $('#add_auth_dlg').dialog('open').dialog("setTitle","添加权限");
}

/*






function modifyAuth(){
    var id= $("#modify_auth_dlg input[name=id]").val();
    var name = $("#modify_auth_dlg input[name=name]").val();
    var description = $('#modify_auth_dlg input[name=description]').val();
    $.post("/bcms/proxy", {method:"put",url: "permission/"+id, name: name, description:description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#modify_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#modify_auth_dlg').dialog('close');
            $.messager.alert("提示",obj.msg,"info");
        }
    });
}


function formatOper(val, row, index) {
    return '<a class="tablelink" href="#" onclick="editAuth(' + index + ');">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delAuth(' + index + ');">删除</a>';
}

function delAuths() {
    var rows = $('#auth_table').datagrid("getSelections");
    if (rows.length > 0) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if(data) {
                for (var i = 0; i < rows.length; i++) {
                    $.post("/bcms/proxy", {method: "delete", url: "permission/" + rows[i].id + "/"}, function (result) {
                        var obj = jQuery.parseJSON(result);
                        if (obj.success) {
                            initAuthGrid();
                        } else {
                            $.message.alert("提示",obj.msg,"info");
                        }
                    });
                }
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function delAuth(index) {
    var row= $('#auth_table').datagrid("getData").rows[index];
    if (row) {
        $.messager.confirm('确认', '确认删除?', function (data) {
            if (data) {
                $.post("/bcms/proxy", {method:"delete",url: "permission/" + row.id + "/"}, function (result) {
                    var obj = jQuery.parseJSON(result);
                    if (obj.success) {
                        initAuthGrid();
                    } else {
                        $.messager.alert("提示",obj.msg,"error");
                    }
                });
            }
        })
    } else {
        $.messager.alert("提示", "请选择要删除的行！", "info");
        return;
    }
}

function saveAuth() {
    var name = $("#name").val();
    var description = $("#description").val();
    $.post("/bcms/proxy", {method:"post",url: "permission/", name: name, description: description}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success) {
            $('#add_auth_dlg').dialog('close');
            initAuthGrid();
        } else {
            $('#add_auth_dlg').dialog('close');
            alert(obj.msg);
        }
    });

}
*/
