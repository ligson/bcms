<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/11/28
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">用户空间</rapid:override>
<rapid:override name="head">
  <link rel="stylesheet" type="text/css" href="../css/index-index.css">
  <script type="text/javascript" src="../js/bootstrap-3.3.5-dist/js/tab.js"></script>
  <script type="text/javascript" src="../js/bootstrap-3.3.5-dist/js/masonry-docs.js"></script>
  <script>
    $(function () {
      var $container = $('#masonry1, #masonry2,#masonry3,#masonry4, #masonry5, #masonry6, #masonry7');
      $container.imagesLoaded(function () {
        $container.masonry({
          itemSelector: '.box',
          gutterWidth: 20,
          isAnimated: true
        });
      });
    });
  </script>
</rapid:override>
<rapid:override name="body">
  <div class="space-content">
    <div class="space-clum bg334">
      <div class="clum-top">
        <div class="clum-item">
          <a class="fn12 colFFF" href=""><em class="um-item dy-ic"></em>分享动态</a>
        </div>

        <div class="clum-item">
          <a class="fn12 colFFF" href=""><em class="um-item share-ic"></em>我的分享</a>
        </div>

        <div class="clum-item">
          <a class="fn12 colFFF" href=""><em class="um-item voi-ic"></em>通知</a>
        </div>

      </div>

      <div class="cl-line"></div>

      <div class="clum-btm">
        <div class="clt-item">
          <a class="fn12 colFFF"><em class="tm-item wp"></em>网盘</a>
        </div>

        <div class="clt-item">
          <a class="fn12 colFFF"><em class="tm-item wp"></em>网盘</a>
        </div>

        <div class="clt-item">
          <a class="fn12 colFFF"><em class="tm-item wp"></em>网盘</a>
        </div>
      </div>
    </div>

    <div class="space-main bgeee">

      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="main-top">
              <div class="main-share  f-l">
                <div class="m-s sh-album f-l">
                  <p><span class="m-i s-alum"></span></p>

                  <p class="fn12">专辑分享</p>
                </div>

                <div class="m-s sh-img f-l">
                  <p><span class="m-i s-img"></span></p>

                  <p class="fn12">分享图片</p>
                </div>

                <div class="m-s sh-video f-l">
                  <p><span class="m-i s-video"></span></p>

                  <p class="fn12">分享视频</p>
                </div>

                <div class="m-s sh-doc f-l">
                  <p><span class="m-i s-doc"></span></p>

                  <p class="fn12">分享文档</p>
                </div>

                <div class="m-s sh-audio f-l">
                  <p><span class="m-i s-audio"></span></p>

                  <p class="fn12">分享文档</p>
                </div>

                <div class="m-s sh-other f-l">
                  <p><span class="m-i s-other"></span></p>

                  <p class="fn12">分享文档</p>
                </div>

              </div>

              <div class="main-user f-l">
                <div class="arrow-r"></div>

                <div class="user-p head-img f-l">
                  <a href="#">
                    <img src="../images/use-img.jpg"/>
                  </a>
                </div>

                <div class="user-o share-cnt f-l">
                  <a class="col333" href="">
                    <p>0</p>分享
                  </a>
                </div>

                <div class="user-o share-cnt f-l">
                  <a class="col333" href="">
                    <p>0</p>专辑
                  </a>
                </div>

                <div class="user-o share-cnt f-l">
                  <a class="col333" href="">
                    <p>0</p>订阅
                  </a>
                </div>

                <div class="user-o share-cnt f-l">
                  <a class="col333" href="">
                    <p>0</p>粉丝
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-2"></div>

          <div class="col-md-8">
            <div class="resource_main">
              <!-- Nav tabs -->

              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#item-all" role="tab"
                                                          data-toggle="tab">全部</a></li>
                <li role="presentation"><a href="#item-aulbum" role="tab" data-toggle="tab">专辑</a></li>
                <li role="presentation"><a href="#item-images" role="tab" data-toggle="tab">图片</a></li>
                <li role="presentation"><a href="#item-video" role="tab" data-toggle="tab">视频</a></li>
                <li role="presentation"><a href="#item-doc" role="tab" data-toggle="tab">文档</a></li>
                <li role="presentation"><a href="#item-music" role="tab" data-toggle="tab">音乐</a></li>
                <li role="presentation"><a href="#item-other" role="tab" data-toggle="tab">其他</a></li>
              </ul>

              <div class="lin-h"></div>
              <!-- Tab panes -->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="item-all">

                  <div id="masonry1" class="container-fluids">
                    <div class="box">
                      <div class="share-file">
                        <p class="fn12 fnb col333">
                          <a class="col333 w1" href=""><span
                                  class="glyphicon glyphicon-folder-open fn16 cole15"></span>&nbsp;&nbsp;马DJS加的Q鹅Penguins.of.Mad
                          </a>
                        </p>

                        <p class="fn12 col333 w2"><em
                                class="glyphicon glyphicon-film fn12 col333"></em>&nbsp;&nbsp;<a
                                class="col333" href="">马DJ.Pe</a>
                        </p>
                      </div>

                      <div class="share-user bgf5f">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                    <div class="box">
                      <div class="share-file">
                        <p class="fn12 fnb col333">
                          <a class="col333 w1" href=""><span
                                  class="glyphicon glyphicon-folder-open fn16 cole15"></span>&nbsp;&nbsp;马DJS加的Q鹅Penguins.of.Madagascar.2014.HD1080P.X264.AAC.mp4
                          </a>
                        </p>

                        <p class="fn12 col333 w2"><em
                                class="glyphicon glyphicon-film fn12 col333"></em>&nbsp;&nbsp;<a
                                class="col333" href="">马DJ.Penguins.of.Madag.AAC.mp4</a>
                        </p>
                      </div>

                      <div class="share-user bgf5f">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                    <div class="box">
                      <div class="share-file">
                        <p class="fn12 fnb col333">
                          <a class="col333 w1" href=""><span
                                  class="glyphicon glyphicon-folder-open fn16 cole15"></span>&nbsp;&nbsp;马DJS加的Q鹅Penguins.of.Madagascar.2014.HD1080P.X264.AAC.mp4
                          </a>
                        </p>

                        <p class="fn12 col333 w2"><em
                                class="glyphicon glyphicon-film fn12 col333"></em>&nbsp;&nbsp;<a
                                class="col333" href="">马DJ.Penguins.of.Madag.AAC.mp4</a>
                        </p>
                      </div>

                      <div class="share-user bgf5f">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                    <div class="box">
                      <div class="share-file">
                        <p class="fn12 fnb col333">
                          <a class="col333 w1" href=""><span
                                  class="glyphicon glyphicon-folder-open fn16 cole15"></span>&nbsp;&nbsp;马DJS加的Q鹅Penguins.of.Madagascar.2014.HD1080P.X264.AAC.mp4
                          </a>
                        </p>

                        <p class="fn12 col333 w2"><em
                                class="glyphicon glyphicon-film fn12 col333"></em>&nbsp;&nbsp;<a
                                class="col333" href="">马DJ.Penguins.of.Madag.AAC.mp4</a>
                        </p>
                      </div>

                      <div class="share-user bgf5f">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                    <div class="box">
                      <div class="share-file">
                        <p class="fn12 fnb col333">
                          <a class="col333 w1" href=""><span
                                  class="glyphicon glyphicon-folder-open fn16 cole15"></span>&nbsp;&nbsp;马DJS加的Q鹅Penguins.of.Madagascar.2014.HD1080P.X264.AAC.mp4
                          </a>
                        </p>

                        <p class="fn12 col333 w2"><em
                                class="glyphicon glyphicon-film fn12 col333"></em>&nbsp;&nbsp;<a
                                class="col333" href="">马DJ.Penguins.of.Madag.AAC.mp4</a>
                        </p>
                      </div>

                      <div class="share-user bgf5f">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                  </div>

                </div>

                <div role="tabpanel" class="tab-pane" id="item-aulbum">
                  <div id="masonry2" class="container-fluids">
                    <div class="box">
                      <div class="album-inc">
                        <div class="al-icon">
                          <a href="#">
                            <img src="../images/pp1.jpg"/>
                          </a>
                        </div>

                        <div class="al-name">
                          <p><a class="fn12 fnb col333" href="#">Chopin - 肖邦 > 练习曲 Etudes</a></p>

                          <p class="fn12 col666">此专辑共27个文件</p>
                        </div>
                      </div>

                      <div class="album-poster">
                        <a href="#">
                          <img src="../images/pp1.jpg"/>
                        </a>
                      </div>

                      <div class="bgf5f album-infor">
                        <p><a href="#" class="colc60 fn12"><img class="wid-img img-circle"
                                                                src="../images/use-img.jpg"/>jshfjsf
                        </a><span class="fn12 col333 f-r">15:30</span></p>

                        <p><span class="f-l fn12 col06c"><em
                                class="glyphicon glyphicon-thumbs-up fn12 col06c"></em>&nbsp;赞(1)
                    </span><a
                                href="#" class="col06c fn12 f-r">详细</a></p>
                      </div>

                    </div>

                  </div>
                </div>

                <div role="tabpanel" class="tab-pane" id="item-images">...</div>

                <div role="tabpanel" class="tab-pane" id="item-video">...</div>

                <div role="tabpanel" class="tab-pane" id="item-doc">...</div>

                <div role="tabpanel" class="tab-pane" id="item-music">...</div>

                <div role="tabpanel" class="tab-pane" id="item-other">...</div>
              </div>
            </div>
          </div>

          <div class="col-md-2"></div>
        </div>
      </div>
    </div>

  </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../layout/userspace/userspace-base.jsp" %>
