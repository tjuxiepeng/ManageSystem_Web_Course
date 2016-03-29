<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/16
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/IframePolice.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen" />
</head>
<body>

<br>

<c:if test="${empty requestScope.admin }">
    没有管理员信息.
</c:if>
<div class="table_con" id="admin">
    <c:if test="${!empty requestScope.admin }">
        <table>

            <tr class="tb_title">
                <td width="30%">管理员姓名</td>
                <td width="30%">密码</td>
                <td width="40%">操作</td>
            </tr>

            <c:forEach items="${requestScope.admin }" var="emp">
                <tr>
                    <td width="30%">${emp.username}</td>
                    <td width="30%">${emp.password}</td>

                    <td width="40%">
                        <input class="bj_btn" type="button" value="编辑"
                               onClick="window.location.href='<%=request.getContextPath() %>/admin_modify/${emp.id}'"/>
                        <input class="del_btn" type="button" value="删除"
                               onClick="if(confirm('您确定删除这条记录？'))
                                       {window.location.href='<%=request.getContextPath() %>/admin_delete/${emp.id}'} "/>
                        <input class="bj_btn" type="button" value="降级"
                               onClick="window.location.href='<%=request.getContextPath() %>/admin_down/${emp.id}'"/>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </c:if>
    <div class="add_cp">
        <a href="<%=request.getContextPath() %>/admin_add">+添加管理员</a>
    </div>
</div>


<br><br><br>

<c:if test="${empty requestScope.user }">
    没有普通警员信息.
</c:if>

<div class="table_con" id="user">
    <c:if test="${!empty requestScope.user }">
        <table>

            <tr class="tb_title">
                <td width="30%">警员姓名</td>
                <td width="30%">密码</td>
                <td width="40%">操作</td>
            </tr>

            <c:forEach items="${requestScope.user }" var="emp">
                <tr>
                    <td width="30%">${emp.username}</td>
                    <td width="30%">${emp.password}</td>

                    <td width="40%">
                        <input class="bj_btn" type="button" value="编辑"
                               onClick="window.location.href='<%=request.getContextPath() %>/user_modify/${emp.id}'"/>
                        <input class="del_btn" type="button" value="删除"
                               onClick="if(confirm('您确定删除这条记录？'))
                                       {window.location.href='<%=request.getContextPath() %>/user_delete/${emp.id}'} "/>
                        <input class="bj_btn" type="button" value="升级"
                               onClick="window.location.href='<%=request.getContextPath() %>/user_up/${emp.id}'"/>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </c:if>

    <div class="add_cp">
        <a href="<%=request.getContextPath() %>/user_add">+添加警员</a>
    </div>
</div>

</body>
</html>
