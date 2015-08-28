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
});
