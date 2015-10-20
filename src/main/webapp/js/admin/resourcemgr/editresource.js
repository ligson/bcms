/**
 * Created by ligson on 2015/8/28.
 */
$(function () {
    $.post("/bcms/proxy",{method:"GET",url:"resource/"+resourceId},function(data){
        $("#name10").textbox("setValue",data.name);
        $("#kind10").combobox("setValue",data.kind);
        $("#resourceTree").combotree("setValue",data.id);
    },"json");
    $("#resourceTree").combotree({
        loadFilter: function (data) {
            for (var i = 0; i < data.rows.length; i++) {
                data.rows[i].text = data.rows[i].name;
            }
            return data.rows;
        }
    });
});
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