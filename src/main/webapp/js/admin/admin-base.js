/**
 * Created by ligson on 2015/8/12.
 */
window.alert = function (msg) {
    $.messager.alert('提示信息', msg);
};
$(function () {
    $("#user_name").text($.cookie("bcms_user_name"));
    $(window).load(function () {
        $(".ui-mask").hide();
    });
    var menuItem = $.cookie("menu-item");
    if (menuItem) {
        var aHref = $(".tree-node").find("a[href='" + menuItem + "']");
        var tree = aHref.parent().parent().parent().parent();
        tree.tree("select", aHref);
        var accordion = tree.parent().parent();
        var index = accordion.index();
        $(".easyui-accordion").accordion("select", index);
        if (window.location.href.indexOf("metadataMgr.jsp") > -1) {
            $(".easyui-accordion").accordion("select", 0);
        }

    }
    $(".tree-node").click(function () {
        var href = $(this).find("a").attr("href");
        $.cookie("menu-item", href);
    });
    //var items = $(".combo-panel").find(".combobox-item");
    //var height = item
    //$(".combo-panel").height();


    //easyui combo高度样式修正
    $(".combo").click(function () {
        var comboPanel = $(".combo-panel");
        for (var i = 0; i < comboPanel.length; i++) {
            var cp = $(comboPanel[i]);
            var items = cp.find(".combobox-item");
            if (items.length > 0) {
                var h = 25 * items.length;
                //cp.css("height",h);
                cp.height(h);
            }
        }
    });

    //自定义验证器
    $.extend($.fn.validatebox.defaults.rules, {
        number: {
            validator: function (value, param) {
                return /^[0-9]+(.[0-9]{1,3})?$/.test(value);
            },
            message: '请输入数字类型'
        }
    });


});

