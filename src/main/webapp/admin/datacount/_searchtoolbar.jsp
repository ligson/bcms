<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="padding:10px;">
  <label>分类:</label><input class="easyui-combotree" data-options="url:'./treedata1.json',method:'get'"
                           style="width:200px;" id="categoryTreeCbox">
  <label for="startDate">开始时间:</label><input class="easyui-datebox" id="startDate"/>
  <label for="endDate">结束时间:</label><input class="easyui-datebox" id="endDate"/>
</div>

</body>
</html>
