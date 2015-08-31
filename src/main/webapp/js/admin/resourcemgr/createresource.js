/**
 * Created by ligson on 2015/8/28.
 */
$(function () {
    $("#fileIpt").change(function () {
        var fileIpt = document.getElementById("fileIpt");
        var files = fileIpt.files;
        var fileList = $("#fileList");
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var fileName = file.name;
            var fileSize = file.size;
            calFile48Hash(file, function (source, hash) {
                fileList.append("<li class=\"list-group-item\">" + source.name + "(文件大小:" + source.size + "字节,hash:" + hash + ")<span class=\"label label-success\">秒传成功</span></li>");
            });
        }
    });

    //$("#.parentResource")
    $.post("/bcms/proxy", {url: "taglibrary/page/1", method: "GET"}, function (data) {
        var result = JSON.parse(data.data);
        var pr = $("#parentResource");
        for (var i = 0; i < result.length; i++) {
            var item = result[i];
            var tagTreeId = "tagTree-" + item.id;
            pr.after("<tr><td><label>" + item.name + ":</label></td><td><input id='" + tagTreeId + "' required='true' class=\"easyui-combotree\" style=\"width:200px;\"/></td></tr>");
            var tagTree = $("#" + tagTreeId);
            tagTree.combotree();
            tagTree.combotree('loadData', formatTagLibTreeGridData(item.tags));
        }

    }, "json");
});


function formatTagLibTreeGridData(data) {
    var fin = [];
    for (var i = 0; i < data.length; i++) {
        var obj = [];
        obj.text = data[i].name;
        obj.id = data[i].id;
        fin.push(obj);
    }
    console.log(fin);
    return fin;
}