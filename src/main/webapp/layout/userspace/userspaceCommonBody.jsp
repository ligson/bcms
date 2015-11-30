<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/11/28
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="commen-head bg2C3">
  <!--logo-->
  <div class="pan-logo f-l">
    <a href="#">用户空间</a>
  </div>
  <!--nav-->
  <div class="pan-nav f-l">
    <div class="nav-item lin-r text-center f-l"><a class="fn16 colFFF"
                                                   href="index.jsp">主页</a>
    </div>

    <div class="nav-item lin-r text-center f-l"><a class="fn16 colFFF"
                                                   href="cloudindex.jsp">网盘&nbsp;&nbsp;<span
            class="glyphicon glyphicon-chevron-down fn10 colFFF"></span></a></div>

    <div class="nav-item text-center f-l"><a class="fn16 colFFF"
                                             href="http://www.baidu.com">分享</a>
    </div>
  </div>
  <!--用户信息-->
  <div class="user-box f-r">
    <div class="user-item">
      <div class="user-name f-l">
        <div class="btn-group">
          <button type="button" class="user-list dropdown-toggle" data-toggle="dropdown">
            superadmin
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" role="menu">
            <li><a  href="">个人资料</a></li>

            <li><a  href="">购买容量</a></li>

            <li><a  href="">免费扩展</a></li>
            <li class="divider"></li>
            <li><a  href="">退出</a></li>
          </ul>
        </div>
      </div>

      <div class="user-massage f-l">
        <p><a class="fn12 colFFF text-center" href="">通知</a></p>
      </div>

      <div class="more-list f-l">
        <p><a class="fn12 colFFF text-center" href="">更多</a></p>
      </div>
    </div>
  </div>
</div>
