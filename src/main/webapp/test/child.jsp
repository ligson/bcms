<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/6
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<% //重定义父页面name=content的内容 %>
<rapid:override name="body">
  <div>
    <h2>Entry one</h2>
    <p>This is my first entry.</p>
  </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="base.jsp" %>