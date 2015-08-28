/**
 * Created by ligson on 2015/8/28.
 * 文件工具
 */
/****
 * 计算文件部分字节的hash,小于1024全部计算,大于1024算文件开头16个.中间16个(从file.size/2开始),结尾16个
 * @param file 文件blob对象
 * @param callback 计算完成回掉,返回md5的hash结果
 */
function calFile48Hash(file, callback) {
    var data = [];
    if (file.size < 1024) {
        //小于1024字节全部做hash
        var fullData = file.slice(0, file.length);
        data.push(fullData);
    } else {

        //大于1024取文件首、中、尾的16个字节做hash
        var headData = file.slice(0, 16);
        var midPos = parseInt(file.size / 2);
        var midData = file.slice(midPos, midPos + 16);
        var tailData = file.slice(file.size - 16, file.size);
        data.push(headData);
        data.push(midData);
        data.push(tailData);
    }

    var result = [];
    var successCount = 0;
    for (var i = 0; i < data.length; i++) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var str = e.target.result;
            result.push(str);
            successCount++;
            if (successCount == data.length) {
                var spark = new SparkMD5();
                for (var j = 0; j < result.length; j++) {
                    spark.appendBinary(result[j]);
                }
                callback(file, spark.end());
            }
        };
        reader.readAsBinaryString(data[i]);
    }
}

function calcFullFileHash(file) {
    var reader = new FileReader();
    reader.onload = function (e) {
        var blob = e.target.result;
        var spark = new SparkMD5();
        spark.append(blob);
        console.log(spark.end());
    };
    reader.readAsBinaryString(file);
}
