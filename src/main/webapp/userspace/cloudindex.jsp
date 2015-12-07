<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/11/28
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">我的文件</rapid:override>
<rapid:override name="head">
  <link rel="stylesheet" type="text/css" href="../css/could_index.css">
  <link rel="stylesheet" type="text/css" href="../js/jstree/dist/themes/default/style.min.css">
  <script type="text/javascript" src="../js/bootstrap-3.3.5-dist/js/bootstrap-contextmenu.js"></script>
  <script type="text/javascript" src="../js/jstree/dist/jstree.min.js"></script>
  <script type="text/javascript" src="../js/spark-md5.js"></script>
  <script type="text/javascript" src="../js/common/fileutils.js"></script>
  <script type="text/javascript" src="http://42.62.52.40:8000/static/flow.js"></script>
  <script type="text/javascript" src="../js/userspace/uploadfile.js"></script>
  <%--<script type="text/javascript" src="${resource(dir: 'js/boful/pan', file: 'index.js')}"></script>--%>
</rapid:override>
<rapid:override name="body">
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12 ">
      <div class="up-load">
        <div class="btn-item">
          <span class="btn btn-success glyphicon glyphicon-level-up" id="btn_flow">&nbsp;上传文件<input type="file" multiple="multiple" style="visibility: hidden; position: absolute;"></span>
          <%--<button class="btn btn-success flow-browse"><span
                  class="glyphicon glyphicon-level-up"></span>上传文件</button>--%>
        </div>

        <div class="btn-item">
         <span id="addFolder" class="btn btn-default glyphicon glyphicon-folder-open">&nbsp;新建文件夹</span>
        </div>

      <%--  %{--<div class="btn-item">
        <button class="btn btn-default"><span class="glyphicon glyphicon-save"></span>&nbsp;&nbsp;离线下载
        </button>
      </div>--}%

        %{--<div class="btn-item">
        <button class="btn btn-default"><span class="glyphicon glyphicon-hdd"></span>&nbsp;&nbsp;我的设备
        </button>
      </div>--}%--%>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12 tab-box">
      <table id="fileListTable" class="table table-bordered table-hover bgFFF">
        <tbody>
        <tr id="titleMenu">
          <th width="40" align="center"><input id="chk_all" type="checkbox"></th>
          <th class="fn12 col666"><p>文件名</p></th>
          <th width="200"><p class="fn12 col666">大小</p></th>
          <th width="260" class="fn12 col666"><p class="fn12 col666">修改日期</p></th>
        </tr>

        <tr id="addRow" style="display:none;">
          <td align="center"><input type="checkbox" disabled="true" ></td>
          <td class="fn12 col333"><input id="fileFolderName" type="text" value="新建文件夹"><button onclick="saveNewFolder();" type="button" class="btn btn-primary">创建</button><button id="btnCancel" type="button" class="btn btn-warning">取消</button></td>
          <td class="fn12 col333"><p>-</p></td>
          <td class="fn12 col333"><p>-</p></td>
        </tr>
        </tbody>
      </table>

    </div>
  </div>
</div>


<div id="uploadFileDialog" class="panel panel-primary"
     style="display: none; background: none repeat scroll 0% 0% #FFF;width: 635px;height:340px;position: fixed;right: 10px;top:auto;left:auto;bottom: 0px;box-shadow: 0px 0px 20px -2px rgba(0, 0, 0, 0.5);z-index: 101;">
  <div class="panel-heading" style="height: 39px;">
    <h3 class="panel-title">上传列表</h3>
    <button onclick="maxUploadDialog();" id="btnMax" type="button" class="btn btn-primary"
            style="height: 39px;position: absolute;right: 39px;top: 0px;">
      <span class="glyphicon glyphicon-fullscreen"></span>
    </button>
    <button onclick="minUploadDialog();" id="btnMin" type="button" class="btn btn-primary"
            style="height: 39px;position: absolute;right: 39px;top: 0px;">
      <span class="glyphicon glyphicon-minus"></span>
    </button>
    <button onclick="closeUploadDialog();" id="btnClose" type="button" class="btn btn-primary"
            style="height: 39px;position: absolute;right: 0px;top: 0px;">
      <span class="glyphicon glyphicon-remove"></span>
    </button>
  </div>

  <div id="uploadBody" class="panel-body">
    <table id="uploadList" class="table" style="font-size: 14px;">
      <thead>
      <tr>
        <th>文件名</th>
        <th>文件大小</th>
        <th>状态</th>
        <th>进度</th>
      </tr>
      </thead>
      <tbody>

      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="moveModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"
                data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">
          移动到
        </h4>
      </div>
      <div class="modal-body">
        <div id="moveTree"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="saveMoveFile();">
          提交更改
        </button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>

<div class="modal fade" id="copyModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"
                data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title">
          复制到
        </h4>
      </div>
      <div class="modal-body">
        <div id="copyTree"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="saveCopyFile();">
          提交更改
        </button>
      </div>
    </div>
  </div>
</div>

<div id="context-menu">
  <ul class="dropdown-menu" role="menu">
    %{--<li><a id="btnOpen" onclick="openFile();">打开</a></li>--}%
    <li><a onclick="downloadFile();">下载</a></li>
    <li class="divider"></li>
    <li><a onclick="shareFile();">分享</a></li>
    <li><a onclick="moveFile();">移动到</a></li>
    <li class="divider"></li>
    <li><a onclick="copyFile();">复制到</a></li>
    %{--  <li><a id="btnReName" onclick="renameFile();">重命名</a></li>--}%
    <li class="divider"></li>
    <li><a onclick="delFile();">删除</a></li>
  </ul>
</div>


<script type="text/javascript" language="JavaScript">
  //getFileList(100,"pan/getFiles",1);
  var winH = $(window).height(); //页面可视区域高度
  var i = 2;
  $(window).scroll(function () {
    var pageH = $(document.body).height();
    var scrollT = $(window).scrollTop(); //滚动条top
    var aa = (pageH - winH - scrollT) / winH;
    if (aa < 0.02) {
      //getFileList(100,"pan/getFiles",i);
      i++;
    }
  });
  $("#addFolder").click(function(){
    $("#addRow").show();
  });
  $("#btnCancel").click(function(){
    $("#fileFolderName").val("新建文件夹");
    $("#addRow").hide();
  });


</script>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../layout/userspace/myfile-base.jsp" %>
