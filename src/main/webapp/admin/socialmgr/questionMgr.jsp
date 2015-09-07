<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">提问管理</rapid:override>
<rapid:override name="head">
</rapid:override>
<rapid:override name="mainName">提问管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'提问管理'">
  <div id="container">
    <table id="dg" class="easyui-datagrid"
           pagination="true"
           rownumbers="true" fitColumns="true" singleSelect="true">
      <thead>
      <tr>
        <th field="firstname" width="10%">提交者</th>
        <th field="lastname" width="40%">内容</th>
        <th field="phone" width="10%">关联资源</th>
        <th field="email" width="10%">提交时间</th>
        <th field="playDate" width="10%">答复问题</th>
        <th field="statu" width="5%">状态</th>
        <th field="_opear" width="10%">操作</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      <tr>
        <td>张三</td>
        <td>当前，中央在全国开展党的群众路线教育实践活动，这是新形势下坚持党要管党、从严治党的重大决策，是顺应群众期盼、加强学习型服务型创新型马克思主义执政党建设的重大部署，是推进中国特色社会主义伟大事业的重大举措</td>
        <td>党的先进性.mp4</td>
        <td>2015-08-28</td>
        <td>如何保持党的先进性</td>
        <td>已采纳</td>
        <td><a>修改</a>&nbsp;&nbsp;<a>删除</a></td>
      </tr>
      </tbody>
    </table>
  </div>
  </div>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>