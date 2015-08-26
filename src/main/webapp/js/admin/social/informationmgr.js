/**
 * Created by Ruby on 2015/8/26.
 */
$(function () {
    $('#information_table').datagrid({
        rownumbers: true,
        singleSelect:false,
        pagination:true,
        columns:[[
            {field:'id',width:'1%',checkbox:true,title:'ID'},
            {field:'username',width:'20%',align:'center',title:'资讯名称'},
            {field:'content',width:'55%',align:'center',title:'内容'},
            {field:'cn_name',width:'10%',align:'center',title:'创建时间'},
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