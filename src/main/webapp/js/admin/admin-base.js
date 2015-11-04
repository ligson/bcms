/**
 * Created by ligson on 2015/8/12.
 */
window.alert = function (msg) {
    $.messager.alert('提示信息', msg);
};
function ajaxLoading(){
    $("<div class=\"datagrid-mask\"></div>").css({display:"block",width:"100%",height:$(window).height()}).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("正在处理，请稍候。。。").appendTo("body").css({display:"block",left:($(document.body).outerWidth(true) - 190) / 2,top:($(window).height() - 45) / 2});
}
function ajaxLoadEnd(){
    $(".datagrid-mask").remove();
    $(".datagrid-mask-msg").remove();
}

$(function () {
    $("#login_username").text($.cookie("bcms_user_name"));
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

    //currentTopMenu
    var pathName = window.location.pathname;

    var menuItems = $("#topmenu").find("a");
    $.each(menuItems, function (idx, menu) {
        var href = menu.href;
        var arrays = href.split("/");
        if (arrays.length > 6) {
            var pathName2 = "/"+arrays[3] + "/" + arrays[4] + "/" + arrays[5];
            if(pathName.indexOf(pathName2)>=0){
                $(menu).addClass("currentTopMenu");
            }
        }
    });

});

