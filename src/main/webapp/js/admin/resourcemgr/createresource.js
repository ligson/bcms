/**
 * Created by ligson on 2015/8/28.
 */
$(function () {
    $("#resourceTree").combotree({
        loadFilter: function (data) {
            for (var i = 0; i < data.rows.length; i++) {
                data.rows[i].text = data.rows[i].name;
            }
            return data.rows;
        }
    });


    $("#fileIpt").filebox({
        onChange: function () {
            //var file = $("#fileIpt").find("input[type='file']");
            var fileBoxId = $("#fileIpt").next().find("input[type='file']").attr("id");
            var fileIpt = document.getElementById(fileBoxId);
            var files = fileIpt.files;
            var fileList = $("#fileList");
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var fileName = file.name;
                var fileSize = file.size;
                /*calFile48Hash(file, function (source, hash) {
                 fileList.append("<li class=\"list-group-item\">" + source.name + "(文件大小:" + source.size + "字节,hash:" + hash + ")<span class=\"label label-success\">秒传成功</span></li>");
                 });*/

                /* var formData = new FormData();
                 formData.append("file", file);
                 formData.append("flowChunkNumber", 1);
                 formData.append("flowChunkSize", 1024*1024);
                 formData.append("flowCurrentChunkSize", 0);
                 formData.append("flowTotalSize", fileSize);
                 formData.append("flowIdentifier", fileSize + "-" + fileName);
                 formData.append("flowFilename", fileName);
                 formData.append("filename", fileName);
                 formData.append("flowRelativePath", fileName);
                 formData.append("flowTotalChunks", 1);
                 $.ajax({
                 url: "http://42.62.52.40:8000/file/upload",
                 type: 'POST',
                 data: formData,
                 processData: false,
                 contentType: false,
                 success: function (data1) {
                 alert(data1);
                 },
                 error: function (data2) {
                 alert(data2);
                 }
                 });*/
            }
        }
    });

    var flow = new Flow({
        target: 'http://42.62.52.40:8000/file/upload'
    });
    var fileBoxId = $("#fileIpt").next().find("input[type='file']").attr("id");

    flow.assignBrowse(document.getElementById(fileBoxId));
    flow.on("fileAdded", function (file, e) {
        //alert(file);
        flow.upload();
    });
    flow.on("complete", function () {
        console.log("----");
    });
    flow.on("fileSuccess", function (file, message) {
        console.log(file);
    });

    /*$("#fileIpt").change(function () {

     });*/

    //$("#.parentResource")
    $.post("/bcms/proxy", {url: "taglibrary/page/1", method: "GET"}, function (data) {
        var result = data;
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