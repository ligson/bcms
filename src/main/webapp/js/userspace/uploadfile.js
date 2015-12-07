/**
 * Created by Ruby on 2015/12/1.
 */
var waitFile = {status: false};
var flow;
$(function () {
    openUploadDialog();
    flow = new Flow({
        target: 'http://42.62.77.189:8000/file/upload',
        chunkSize: 1024 * 1024,
        testChunks: false,
        simultaneousUploads: 1,
        method: "POST",
        query: {
            user_id: 1
        }
    });

    flow.assignBrowse($('#btn_flow')[0]);
    flow.on('fileAdded', function(file,event){
        var fileId = file.uniqueIdentifier;
        calFile48Hash(file.file, function (source, hash) {
            waitFile.hash = hash.toUpperCase();
            waitFile.file = source;
            waitFile.fileId = fileId;
            var fileName = file.name.toString();
            var fileSize = readablizeBytes(file.size);
            var fileSubName = fileName.length > 20 ? (fileName.substr(0, 20) + "...") : fileName;
            var fileItem = "<tr><td class='up_name1' title='" + fileName + "'>" + fileSubName + "</td><td class='up_size1'>" + fileSize + "</td><td  class='up_step1' id='process_" + fileId + "'></td><td><div class='progress' style='width: 156px;'><div class='progress-bar progress-bar-success' role='progressbar'  aria-valuemin='0' aria-valuemax='100'aria-valuenow='60' style='width: 0%' id='status_" + fileId + "'></div></div></td></tr>";
            $("#uploadList").find("tbody").append(fileItem);
        });
        openUploadDialog();
    });
    flow.on('filesSubmitted', function(file) {
        flow.upload();
    });
    flow.on('fileSuccess', function(file,message){
        var fileId = file.uniqueIdentifier;
        $("#process_" + fileId).empty().append("上传成功");
    });
    flow.on('fileError', function(file, message){
        var fileId = file.uniqueIdentifier;
        $("#process_" + fileId).empty().append("上传失败!");
    });
    flow.on('fileProgress', function(file){
        var fileId = file.uniqueIdentifier;
        $("#status_" + fileId).html(Math.floor(file.progress()*100) + '% '
        + readablizeBytes(file.averageSpeed) + '/s '
        + secondsToStr(file.timeRemaining()) + ' remaining') ;;
        $("#status_" + fileId).css({width:Math.floor(flow.progress()*100) + '%'});
      /*  $('.flow-file-'+file.uniqueIdentifier+' .flow-file-progress')
            .html(Math.floor(file.progress()*100) + '% '
            + readablizeBytes(file.averageSpeed) + '/s '
            + secondsToStr(file.timeRemaining()) + ' remaining') ;
        $('.progress-bar').css({width:Math.floor(r.progress()*100) + '%'});*/
    });



});

function readablizeBytes(bytes) {
    var s = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB'];
    var e = Math.floor(Math.log(bytes) / Math.log(1024));
    return (bytes / Math.pow(1024, e)).toFixed(2) + " " + s[e];
}
function secondsToStr (temp) {
    function numberEnding (number) {
        return (number > 1) ? 's' : '';
    }
    var years = Math.floor(temp / 31536000);
    if (years) {
        return years + ' year' + numberEnding(years);
    }
    var days = Math.floor((temp %= 31536000) / 86400);
    if (days) {
        return days + ' day' + numberEnding(days);
    }
    var hours = Math.floor((temp %= 86400) / 3600);
    if (hours) {
        return hours + ' hour' + numberEnding(hours);
    }
    var minutes = Math.floor((temp %= 3600) / 60);
    if (minutes) {
        return minutes + ' minute' + numberEnding(minutes);
    }
    var seconds = temp % 60;
    return seconds + ' second' + numberEnding(seconds);
}

function openUploadDialog() {
    $("#uploadFileDialog").slideDown();
}

function maxUploadDialog() {
    $("#btnMax").hide();
    $("#uploadFileDialog").height(340);
    $("#btnMin").show();
}

function minUploadDialog() {
    $("#btnMin").hide();
    $("#uploadFileDialog").height(39);
    $("#btnMax").show();
}

function closeUploadDialog() {
    $("#uploadList").find("tbody").find("tr").remove();
    $("#uploadFileDialog").hide();
}