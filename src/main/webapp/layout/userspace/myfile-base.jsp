<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/11/28
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <title><rapid:block name="title"/></title>
  <link type="text/css" rel="stylesheet"  href="../css/pan-template.css">
  <jsp:include page="../layout/userspace/userspaceCommonHead.jsp"/>
  <rapid:block name="head"/>
</head>

<body>
<jsp:include page="../layout/userspace/userspaceCommonBody.jsp"/>
<div class="space-content">
  <div class="space-clum bgeee">
    <div class="clum-top">
      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item fi-ic"></em>&nbsp;&nbsp;全部文件</a>
      </div>

      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item vio-ic"></em>&nbsp;&nbsp;视频</a>
      </div>

      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item muc-ic"></em>&nbsp;&nbsp;音频</a>
      </div>

      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item link-ic"></em>&nbsp;&nbsp;文档</a>
      </div>

      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item img-ic"></em>&nbsp;&nbsp;图片</a>
      </div>



    <%--  %{--<div class="clum-item">
      <a class="fn14 col333" href="${createLink( controller: 'pan', action: 'linkIndex')}"><em class="um-item link-ic"></em>&nbsp;&nbsp;种子</a>
    </div>--}%--%>



      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item ota-ic"></em>&nbsp;&nbsp;其他</a>
      </div>

    </div>

    <div class="cl-line"></div>

    <div class="clum-btm">
      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item ms-ic"></em>&nbsp;&nbsp;我的分享</a>
      </div>
    </div>

    <div class="cl-line"></div>

    <div class="clum-btm">
      <div class="clum-item">
        <a class="fn14 col333" href=""><em class="um-item bac-ic"></em>&nbsp;&nbsp;回收站</a>
      </div>
    </div>

  </div>

  <div class="space-main bgeee">
    <rapid:block name="body"/>
  </div>

</div>

</body>
</html>
