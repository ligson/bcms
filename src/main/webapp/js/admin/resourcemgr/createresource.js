/**
 * Created by ligson on 2015/8/28.
 */
var flow;
function startUpload() {
    if (waitFile.file && waitFile.hash) {
        $.post("/bcms/proxy", {
            url: "file/" + waitFile.hash + "/checksum",
            method: "GET"
        }, function (data2) {
            var fileId = data2.id;
            if (fileId !== undefined) {
                waitFile.id = fileId;
                waitFile.status = true;
                $("#upload-" + waitFile.fileId).empty().append("秒传!");
            } else {
                flow.upload();
            }
        }, "json");
    }
}

var waitFile = {status: false};
$(function () {
    $("#resourceTree").combotree({
        loadFilter: function (data) {
            for (var i = 0; i < data.rows.length; i++) {
                data.rows[i].text = data.rows[i].name;
            }
            return data.rows;
        }
    });

    flow = new Flow({
        target: 'http://42.62.52.40:8000/file/upload',
        chunkSize: 1024 * 1024,
        testChunks: false,
        simultaneousUploads: 1,
        method: "POST",
        query: {
            user_id: 1
        }
    });
    var fileList = $("#fileList");
    flow.on("fileAdded", function (file, event) {
        var fileId = file.uniqueIdentifier;
        calFile48Hash(file.file, function (source, hash) {
            waitFile.hash = hash.toUpperCase();
            waitFile.file = source;
            waitFile.fileId = fileId;
            fileList.append("<li class=\"list-group-item\">" + source.name + "(文件大小:" + source.size + "字节,hash:" + hash.toUpperCase() + ",已上传:<span class=\"label label-info\" id=\"upload-" + fileId + "\">0%</span>)</li>");
        });
    });
    flow.on("fileProgress", function (file, chunk) {
        var fileId = file.uniqueIdentifier;
        $("#upload-" + fileId).empty().append(chunk.offset + "%");
    });

    flow.on('fileSuccess', function (file, message) {
        //console.log(file,message);
        waitFile.status = true;
        var fileId = file.uniqueIdentifier;
        $("#upload-" + fileId).empty().append("上传成功!");
    });

    flow.on('fileError', function (file, message) {
        //console.log(file, message);
        waitFile.status = false;
        //alert(file.name + "上传失败!" + message);
        var fileId = file.uniqueIdentifier;
        $("#upload-" + fileId).empty().append("上传失败!");
    });

    $("#fileIpt").filebox({
        onChange: function () {
            //var file = $("#fileIpt").find("input[type='file']");
            if (fileList.find("li").length > 0) {
                return;
            }
            var fileBoxId = $("#fileIpt").next().find("input[type='file']").attr("id");
            var fileIpt = document.getElementById(fileBoxId);
            var files = fileIpt.files;
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                //var fileName = file.name;
                //var fileSize = file.size;
                flow.addFile(file);

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
function submitForm() {
    var ff = $("#createResourceForm");
    if (!(waitFile.status && waitFile.hash)) {
        alert("请上传文件");
        return;
    }
    if (ff.form("validate")) {
        var name = $("#name10").textbox("getValue");
        var kind10 = $("#kind10").combobox("getValue");
        var node = $("#resourceTree").combotree("getValue");
        var committer = $.cookie("bcms_user_id");
        $.post("/bcms/proxy", {
            method: "POST",
            url: "resource/",
            name: name,
            kind: kind10,
            resourcelibrary_id: parseInt(node),
            committer: parseInt(committer)
        }, function (data) {
            if (data.id != undefined) {
                //alert("ok........");
                if (waitFile.id != null) {
                    $.post("/bcms/proxy", {
                        url: "file/detail/" + waitFile.id,
                        method: "POST",
                        resource_id: data.id
                    }, function (data3) {
                        if (data3.id != undefined) {
                            submitSuccess(data3, data.id);
                        }
                    }, "json");
                } else {
                    $.post("/bcms/proxy", {
                        url: "file/" + waitFile.hash + "/checksum",
                        method: "GET"
                    }, function (data2) {
                        var fileId = data2.id;
                        if (fileId) {
                            $.post("/bcms/proxy", {
                                url: "file/detail/" + fileId,
                                method: "POST",
                                resource_id: data.id
                            }, function (data3) {
                                submitSuccess(data3, data.id);
                            }, "json");
                        }
                    }, "json");
                }
            } else {
                alert("资源创建失败!");
            }
        }, "json");
    } else {
        alert("表单参数不完整!");
    }
}

function submitSuccess(data3, resourceId) {
    if (data3.id != undefined) {
        //alert("资源创建成功!");
        window.location.href = "/bcms/admin/resourcemgr/editmeta.jsp?id=" + resourceId;
    } else {
        alert("资源创建失败!");
    }
}