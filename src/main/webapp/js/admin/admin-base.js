/**
 * Created by ligson on 2015/8/12.
 */
window.alert = function (msg) {
    $.messager.alert('提示信息', msg);
};
$(function () {

    var menuItem = $.cookie("menu-item");
    if (menuItem) {
        var aHref = $(".tree-node").find("a[href='" + menuItem + "']");
        var tree = aHref.parent().parent().parent().parent();
        tree.tree("select", aHref);
        var accordion = tree.parent().parent();
        var index = accordion.index();
        $(".easyui-accordion").accordion("select", index);

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
});
