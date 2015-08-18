/**
 * Created by Ruby on 2015/8/17.
 */
$(function () {
    initMetaDataGrid("mustdata");

});

function initMetaDataGrid(url) {
    $('#mustdata_table').datagrid({
        rownumbers: true,
        singleSelect: false,
        pagination: true,
        url: "../../js/admin/metadata/test_" + url + "_table.json",
        columns: [[
            {field: 'id', checkbox: true, title: 'ID'},
            {field: 'bh', title: '编号'},
            {field: 'cn', align: 'center', title: '中文名称'},
            {field: 'en', align: 'center', title: '英文名称'},
            {field: 'js', align: 'center', title: '解释'},
            {field: 'sjlx', align: 'center', title: '数据类型'},
            {field: 'zy', align: 'center', title: '值域'},
            {field: 'qsz', align: 'center', title: '取值数'},
            {field: 'sx', align: 'center', title: '顺序'},
            {field: 'jl', align: 'center', title: '举例'},
            {field: 'lom', align: 'center', title: 'LOM编号'},
            {field: 'bz', align: 'center', title: '备注'},
            {
                field: '_operate', align: 'center', title: '操作',
                formatter: function (value, row, index) {
                    return '<a class="tablelink" href="#" onclick="editMust(' + index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delMust(' + index + ')">删除</a>';
                }
            }
        ]],
        toolbar: [
            {
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    newMust();
                }
            },
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {
                    delMusts();
                }
            }
        ]
    });
}

function newMust(){
    $('#add_must_dlg').dialog('open');
}

function editMust(){
    $('#modify_must_dlg').dialog('open');
}

function delMusts() {
    $.messager.confirm('确认', '确认删除?', function (data) {
        if (data) {

        }
    });
}

function delMust(index){
    $.messager.confirm('确认', '确认删除?', function (data) {
        if (data) {

        }
    });
}