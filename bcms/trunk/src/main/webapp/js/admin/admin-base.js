/**
 * Created by ligson on 2015/8/12.
 */
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
});
