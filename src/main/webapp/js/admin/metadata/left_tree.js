/**
 * Created by Ruby on 2015/8/17.
 */
$(function () {
    $("#metadata_tree").tree({
        url:"../../js/admin/metadata/test_metadata_tree.json",
        lines:true,
        onClick: function (node) {
            if(node.url) {
                location.href = "/bcms/admin/metadata/" + node.url + ".jsp";
            }
        }
    });
});

