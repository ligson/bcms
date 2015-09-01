/**
 * Created by Ruby on 2015/9/1.
 */
Array.prototype.convertToIntArray = function () {
    var arr = [];
    for (var i = 0; i < this.length; i++) {
        arr.push(parseInt(this[i]));
    }
    return arr;
};
