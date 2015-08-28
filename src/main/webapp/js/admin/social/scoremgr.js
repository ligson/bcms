$(function () {

    $('#score_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url:'score_table.json',
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'create_user',width:'20%',align:'center',title:'提交者'},
            {field:'score',width:'10%',align:'center',title:'分值'},
            {field:'resouce_name',width:'30%',align:'center',title:'关联资源'},
            {field:'create_date',width:'20%',align:'center',title:'创建时间'},
            {field:'_operate',width:'14%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editUser('+ index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                }
            }
        ]],
        toolbar:[
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {

                }
            }
        ]
    });
});

