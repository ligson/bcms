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
    <link href="../../css/fillmeta.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../../js/admin/metadata/fillMeta.js"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'编辑元数据'" iconCls="icon-page_world">
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
    </div>
    <%--<table class="table table-striped">
        <thead>
        <tr>
            <th class="col-md-1">项</th>
            <th class="col-md-8">值</th>
            <th class="col-md-2">举例</th>
            <th class="col-md-1">+</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><label>字段1</label></td>
            <td>
                <input type="text" class="easyui-textbox" required="true">
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        <tr>
            <td><label>字段2</label></td>
            <td>
                <input type="text" class="easyui-datebox" required="true">
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        <tr>
            <td><label>字段3</label></td>
            <td>
                <select class="easyui-combobox" editable="false">
                    <option>xxxxxx</option>
                    <option>xxxxxx</option>
                    <option>xxxxxx</option>
                    <option>xxxxxx</option>
                </select>
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        <tr>
            <td><label>结构</label></td>
            <td>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>项</td>
                        <td>值</td>
                        <td>举例</td>
                        <td>+</td>
                    </tr>
                    </thead>
                    <tbody class="structureBody">
                    <tr>
                        <td><label>字段3</label></td>
                        <td>
                            <select class="easyui-combobox" editable="false">
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                            </select>
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    <tr>
                        <td><label>字段1</label></td>
                        <td>
                            <input type="text" class="easyui-textbox" required="true">
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    <tr>
                        <td><label>字段1</label></td>
                        <td>
                            <input type="text" class="easyui-textbox" required="true">
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        <tr>
            <td><label>结构</label></td>
            <td>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>项</td>
                        <td>值</td>
                        <td>举例</td>
                        <td>+</td>
                    </tr>
                    </thead>
                    <tbody class="structureBody">
                    <tr>
                        <td><label>字段3</label></td>
                        <td>
                            <select class="easyui-combobox" editable="false">
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                                <option>xxxxxx</option>
                            </select>
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    <tr>
                        <td><label>字段1</label></td>
                        <td>
                            <input type="text" class="easyui-textbox" required="true">
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    <tr>
                        <td><label>字段1</label></td>
                        <td>
                            <input type="text" class="easyui-textbox" required="true">
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        <tr>
            <td><label>关系</label></td>
            <td>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>项</td>
                        <td>值</td>
                        <td>举例</td>
                        <td>+</td>
                    </tr>
                    </thead>
                    <tbody class="structureBody">
                    <tr>
                        <td><label>类型</label></td>
                        <td>
                            <select class="easyui-combobox" editable="false">
                                <option>A是B的一部分</option>
                                <option>A是B的一部分</option>
                                <option>A是B的一部分</option>
                                <option>A是B的一部分</option>
                                <option>A是B的一部分</option>
                                <option>A是B的一部分</option>
                            </select>
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    <tr>
                        <td><label>资源</label></td>
                        <td>
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td>项</td>
                                    <td>值</td>
                                    <td>举例</td>
                                    <td>+</td>
                                </tr>
                                </thead>
                                <tbody class="structureBody">
                                <tr>
                                    <td><label>标识</label></td>
                                    <td>
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <td>项</td>
                                                <td>值</td>
                                                <td>举例</td>
                                                <td>+</td>
                                            </tr>
                                            </thead>
                                            <tbody class="structureBody">
                                            <tr>
                                                <td><label>类型</label></td>
                                                <td>
                                                    <input type="text" class="easyui-textbox" required="true">
                                                </td>
                                                <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                                                <td><a class="easyui-linkbutton">添加</a></td>
                                            </tr>
                                            <tr>
                                                <td><label>值</label></td>
                                                <td><input type="text" class="easyui-textbox" required="true"></td>
                                                <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                                                <td><a class="easyui-linkbutton">添加</a></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                                    <td><a class="easyui-linkbutton">添加</a></td>
                                </tr>
                                <tr>
                                    <td><label>描述</label></td>
                                    <td>
                                        <input type="text" class="easyui-textbox" required="true">
                                    </td>
                                    <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                                    <td><a class="easyui-linkbutton">添加</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
                        <td><a class="easyui-linkbutton">添加</a></td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <td>(xxxxxxxxxxxxxxxxxxxxxx)</td>
            <td><a class="easyui-linkbutton">添加</a></td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">
                <a class="easyui-linkbutton">提交</a>
                <a class="easyui-linkbutton">跳过</a>
            </td>
        </tr>
        </tfoot>
    </table>--%>

    <table toolbar="#tbr" fit="true" id="metaGrid" class="easyui-treegrid"
           url="../metadata/jsondata/fitmeta.json">
    </table>
    <div id="tbr">
        <a class="easyui-linkbutton" onclick="submitMetaForm()">提交</a>
        <a class="easyui-linkbutton">跳过</a>
    </div>
</div>

</body>
</html>
