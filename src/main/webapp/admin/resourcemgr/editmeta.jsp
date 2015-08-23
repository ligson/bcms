<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑元数据</title>
    <jsp:include page="_header.jsp"/>
    <link type="text/css" rel="stylesheet" href="../../js/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <script type="text/javascript" src="../../js/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
    <script type="text/javascript" src="../../js/admin/rmgr.js"></script>
    <style type="text/css">

        .testTable td{
            padding:10px;
            border:1px solid #E6E6E6;
        }
    </style>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'编辑元数据'" iconCls="icon-page_world">
    <div id="container" style="padding:10px;">
        <h4>通用</h4>
        <hr/>
        <table cellpadding="0" cellspacing="0" style="border:1px solid #E6E6E6;" class="testTable">
            <tr >
                <td><label>标识:</label></td>
                <td>
                    类型:&nbsp;&nbsp;<input type="text" class="easyui-textbox">&nbsp;&nbsp;(举例:"ISBN")<br/><br/>
                    值:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="easyui-textbox">&nbsp;&nbsp;(举例:"7-88489-072-0")
                </td>
            </tr>
            <tr>
                <td><label>标题:</label></td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="easyui-textbox">&nbsp;&nbsp;(举例:("zh","故宫"))
                </td>
            </tr>
            <tr>
                <td><label>语种:</label></td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="easyui-textbox">&nbsp;&nbsp;(举例:"en","en-GB")
                </td>
            </tr>
            <tr>
                <td><label>描述:</label></td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="easyui-textbox" multiline="true" style="height:50px;">&nbsp;&nbsp;(举例:("zh","关于故宫的历史和概况"))
                </td>
            </tr>
        </table>
        <h4>生存期</h4>
        <hr/>
        <table>
            <tr style="line-height:120%;">
                <td><label>贡献:</label></td>
                <td class="items-container">
                    <div class="items">
                        角色：<select class="easyui-combobox" name="dept" style="width:200px;">
                        <option>aitem1</option>
                        <option>bitem2</option>
                        <option>bitem3</option>
                        <option>ditem4</option>
                        <option>eitem5</option>
                    </select>
                        <br/>
                        实体:<input type="text" class="easyui-textbox"><a id="fieldHref" class="easyui-linkbutton"
                                                                        onclick="addField()">增加</a>
                    </div>
                </td>
                <td>
                    <a class="easyui-linkbutton" onclick="addMetaItems()">增加</a>
                <td>
                </td>
            </tr>
        </table>

        <h4>元元数据</h4>
        <hr/>
        <table>
            <tr style="line-height:120%;">
                <td><label>贡献:</label></td>
                <td class="items-container">
                    <div class="items">
                        角色：<select class="easyui-combobox" name="dept" style="width:200px;">
                        <option>aitem1</option>
                        <option>bitem2</option>
                        <option>bitem3</option>
                        <option>ditem4</option>
                        <option>eitem5</option>
                    </select>
                        <br/>
                        实体:<input type="text" class="easyui-textbox"><a class="easyui-linkbutton" onclick="addField()">增加</a>
                    </div>
                </td>
                <td>
                    <a class="easyui-linkbutton" onclick="addMetaItems()">增加</a>
                <td>
                </td>
            </tr>
            <tr>
                <td><label>元数据方案:</label></td><td>
                <input type="text" class="easyui-textbox">
            </td><td></td>
            </tr>
            <tr>
                <td><label>语种:</label></td><td>
                <input type="text" class="easyui-textbox">
            </td><td></td>
            </tr>
        </table>

        <h4>技术</h4>
        <hr/>
        <table>
            <tr style="line-height:120%;">
                <td><label>格式:</label></td>
                <td class="items-container">
                    <div class="items">
                        <select class="easyui-combobox" name="dept" style="width:200px;">
                            <option>aitem1</option>
                            <option>bitem2</option>
                            <option>bitem3</option>
                            <option>ditem4</option>
                            <option>eitem5</option>
                        </select>
                    </div>
                </td>
                <td>
                    <a class="easyui-linkbutton" onclick="addMetaItems()">增加</a>
                <td>
                </td>
            </tr>

        </table>
        <h4>教育</h4>
        <hr/>
        <table>
            <tr style="line-height:120%;">
                <td><label>学习资源类型:</label></td>
                <td class="items-container">
                    <div class="items">
                        <select class="easyui-combobox" name="dept" style="width:200px;">
                            <option>aitem1</option>
                            <option>bitem2</option>
                            <option>bitem3</option>
                            <option>ditem4</option>
                            <option>eitem5</option>
                        </select>
                    </div>
                </td>
                <td>
                    <a class="easyui-linkbutton" onclick="addMetaItems()">增加</a>
                <td>
                </td>
            </tr>

        </table>
        <h4>分类</h4>
        <hr/>
        <table>
            <tr style="line-height:120%;">
                <td><label>目的:</label></td>
                <td class="items-container">
                    <div class="items">
                        <select class="easyui-combobox" name="dept" style="width:200px;">
                            <option>aitem1</option>
                            <option>bitem2</option>
                            <option>bitem3</option>
                            <option>ditem4</option>
                            <option>eitem5</option>
                        </select>
                    </div>
                </td>
                <td>
                    <a class="easyui-linkbutton" onclick="addMetaItems()">增加</a>
                <td>
                </td>
            </tr>
            <tr style="line-height:120%;">
                <td><label>分类路径:</label></td>
                <td class="items-container" colspan="2">
                    <table>
                        <tr>
                            <td>来源:</td>
                            <td><input type="text" class="easyui-textbox"></td>
                        </tr>
                        <tr>
                            <td>分类单元:</td>
                            <td>
                                <table>
                                    <tr>
                                        <td>id</td>
                                        <td><input type="text" class="easyui-textbox"></td>
                                    </tr>
                                    <tr>
                                        <td>条目</td>
                                        <td><input type="text" class="easyui-textbox"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input class="easyui-linkbutton" value="提交"/>
        <input class="easyui-linkbutton" value="跳过"/>
    </div>
</div>

</body>
</html>
