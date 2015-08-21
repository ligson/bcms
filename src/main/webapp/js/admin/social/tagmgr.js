/**
 * Created by Ruby on 2015/8/19.
 */
$(function () {
    $('#search_tag').combobox({
        prompt:'输入关键字后自动搜索',
        url:'../../js/admin/social/tag_test_combobox.json',
        method: 'get',
        valueField:'id',
        textField:'text',
        onSelect:function(tag){
            var id = $('#search_tag').combobox('getValue');
            $("#tag_tree").tree("expand", $("#tag_tree").tree("find",id).target);
            $('#tag_tree').tree('select',$("#tag_tree").tree("find",id).target);
        }
    });
});
