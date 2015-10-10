/**
 * Created by Ruby on 2015/8/31.
 */
$(function () {
    $('#message_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url: "/bcms/proxy?url=message&method=GET",
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'name',width:'30%',align:'center',title:'标题'},
            {field:'created_at',width:'15%',align:'center',title:'发送时间'},
            {field:'pick_user_id',width:'20%',align:'center',title:'接收对象'},
            {field:'send_user_id',width:'10%',align:'center',title:'发送人'},
            {field:'reply_message_id',width:'10%',align:'center',title:'回复消息'},
            {field:'_operate',width:'10%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="replyMessage('+ index + ')">回复</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delMessage(' + index + ')">删除</a>';
                }
            }
        ]],
        toolbar:[{
            text: '添加',
            iconCls: 'icon-add',
            handler: function () {
                newMessage();
            }
        }]
    });

    $("#select_user_list").datalist({
        textField: 'name',
        valueField: 'id'
    });
    initDepartmentTree();

});

function closeTab(title) {
    $('#message_tabs').tabs('close', title);
}

function newMessage(){
    var tab= $('#message_tabs').tabs('getTab', "发送新消息");
    if(!tab) {
        var html = "";
        html += '<div title="发送新消息">';
        html += '<div class="ftitle">发送新消息</div>';
        html += '<form id="add_message_form" method="post">';
        html += '<div class="fitem">';
        html += '<label>标题</label>';
        html += '<input id="name1" class="easyui-validatebox" required="true" type="text" />';
        html += '</div><div class="fitem">';
        html += '<label>接收对象</label>';
        html+='<div id="cc"  class="easyui-layout" style="width:630px;height:300px;align:center;">';
        html+='<div data-options="region:\'west\',title:\'部门\',split:true" style="width:210px;">';
        html+='<div id="department_tree"></div></div>';
        html+='<div data-options="region:\'center\',title:\'待选用户\'" style="padding:5px;">';
        html+='<ul id="user_list" class="easyui-datalist"></ul></div>';
        html+='<div data-options="region:\'east\',title:\'已选用户\',split:true" style="width:210px;">';
        html+='<ul id="select_user_list" class="easyui-datalist"></ul></div></div>';
        html += '</div>';
        html += '<div class="fitem"><label>内容</label>';
        html += '<input id="content1" class="easyui-validatebox" required="true" type="text" />';
        html += '<script type=\"text/javascript\">CKEDITOR.replace(\"content1\");</script>';
        html += '</div>';
        html += '</form>';
        html += '<div id="add_information_dlg_buttons">';
        html += '<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveMessage();" iconcls="icon-save">保存</a>';
        html += "<a href=\"javascript:void(0)\" class=\"easyui-linkbutton\" onclick=\"closeTab('发送新消息');\" iconcls=\"icon-cancel\">取消</a>";
        html += '</div>';
        html += '</div>';
        $('#message_tabs').tabs('add', {
            title: '发送新消息',
            content: html,
            closable: true
        });
    }else{
        $('#message_tabs').tabs('select','发送新消息');
    }
    initDepartmentTree();
}

function saveMessage(){
    var name=$("#name1").val();
    var content=CKEDITOR.instances.content1.getData();
    var user_id=$.cookie("bcms_user_id");
    var create_at=new Date().format("yyyy-MM-dd HH:mm:ss");
    var rows = $('#add_message_form #select_user_list').datalist("getData").rows;
    var uids=[];
    for(var i=0;i<rows.length;i++){
        uids.push(rows[i].id);
    }
    $.post("/bcms/proxy", {
        method: "post",
        url: "/message/",
        send_user_id:user_id,
        name: name,
        content: content,
        created_at: create_at,
        pick_user_id: uids.toString()
    }, function (data) {
        var result = JSON.parse(data);
        if (!result.success) {
            $("#message_table").datagrid("reload");
            $('#message_tabs').tabs('close', "发送新消息");
        } else {
            alert("发送失败!");
        }
    });
}

function initDepartmentTree() {
    $.post("/bcms/proxy", {method: "get", url: "department/"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            $("#add_message_form #department_tree").tree({
                data: formatTreeData(obj), onClick: function (node) {
                    initUserListByDepartment(node);
                }
            });
        }
    });
}

function initUserListByDepartment(node) {
    $.post("/bcms/proxy", {method: "get", url: "department/" + node.id + "/user/page/1"}, function (result) {
        var obj = jQuery.parseJSON(result);
        if (obj.success==false) {
            alert(obj.msg);
        } else {
            var rows = $('#select_user_list').datalist("getData").rows;
            for (var j = 0; j < rows.length; j++) {
                for (var x = 0; x < obj.length; x++) {
                    if (rows[j].id == obj[x].id) {
                        obj[x].checked = true;
                    }
                }
            }
            $("#add_message_form #user_list").datalist({
                checkbox: true,
                singleSelect:false,
                textField: 'cn_name',
                valueField: 'id',
                data: obj,
                onCheck: function (index, row) {
                    $("#add_message_form #select_user_list").datalist('appendRow', {'id': row.id, 'text': row.cn_name});
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