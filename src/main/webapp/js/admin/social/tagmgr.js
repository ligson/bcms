/**
 * Created by Ruby on 2015/8/19.
 */
(function(){
    $('#search').combobox({
        prompt:'输入关键字后自动搜索',
        required:true,
        mode:'remote',
        url:'repairs/getEqiupmentList',
        editable:true,
        hasDownArrow:false,
        onBeforeLoad: function(param){
            if(param == null || param.q == null || param.q.replace(/ /g, '') == ''){
                var value = $(this).combobox('getValue');
                if(value){// 修改的时候才会出现q为空而value不为空
                    param.id = value;
                    return true;
                }
                return false;
            }
        }
    });
});
