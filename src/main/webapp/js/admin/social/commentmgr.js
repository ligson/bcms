/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#comment_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url:"comment_table.json",
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'create_user',width:'20%',align:'center',title:'提交者'},
            {field:'content',width:'35%',align:'center',title:'内容'},
            {field:'create_date',width:'10%',align:'center',title:'创建时间'},
            {field:'resouce_name',width:'10%',align:'center',title:'关联资源'},
            {field:'statu',width:'10%',align:'center',title:'状态'},
            {field:'_operate',width:'10%',align:'center',title:'操作',
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