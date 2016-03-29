<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/16
  Time: 16:41
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

<h4>您的身份是：警员</h4>
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
        </td>
      </tr>
    </c:forEach>

  </table>
  </c:if>
</body>
</html>
