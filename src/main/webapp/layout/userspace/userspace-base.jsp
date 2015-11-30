<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/11/28
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <title><rapid:block name="title"/></title>
  <jsp:include page="../layout/userspace/userspaceCommonHead.jsp"/>
  <rapid:block name="head"/>
</head>

<body>
<jsp:include page="../layout/userspace/userspaceCommonBody.jsp"/>
<rapid:block name="body"/>

</body>
</html>
