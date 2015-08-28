/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#information_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        url:"information_table.json",
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'username',width:'20%',align:'center',title:'资讯名称'},
            {field:'content',width:'45%',align:'center',title:'内容'},
            {field:'is_show',width:'10%',align:'center',title:'是否首页滚动'},
            {field:'create_date',width:'10%',align:'center',title:'创建时间'},
            {field:'_operate',width:'10%',align:'center',title:'操作',
                formatter: function (value, row,index) {
                    return '<a class="tablelink" href="#" onclick="editUser('+ index + ')">修改</a>&nbsp;&nbsp;<a class="tablelink" href="#" onclick="delUser(' + index + ')">删除</a>';
                }
            }
        ]],
        toolbar:[{
            text: '添加',
            iconCls: 'icon-add',
            handler: function () {
                $("#add_information_dlg").dialog("open");
            }
        },
            {
                text: '删除',
                iconCls: 'icon-cancel',
                handler: function () {

                }
            }
        ]
    });
});