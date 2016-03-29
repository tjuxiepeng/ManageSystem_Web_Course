<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2015/12/30
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>产品管理</title>
  <link rel="stylesheet" type="text/css" href="css/Iframe.css" />
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen" />

</head>

<body>

<br><br><br>

<c:if test="${empty requestScope.new_employees }">
  没有信息.
</c:if>

<div class="table_con">
  <c:if test="${!empty requestScope.new_employees }">
    <table>

      <tr class="tb_title">
        <td width="7%">标题</td>
        <td width="69%">内容</td>
        <td width="10%">联系电话</td>
        <td width="7%">姓名</td>
        <td width="7%">操作</td>
      </tr>

      <c:forEach items="${requestScope.new_employees }" var="emp">
        <tr>
          <td width="7%">${emp.title}</td>
          <td width="69%">${emp.content}</td>


          <c:if test="${emp.phone == null}">
            <td width="10%">无</td>
          </c:if>
          <c:if test="${emp.phone != null}">
            <td width="10%">${emp.phone}</td>
          </c:if>

          <c:if test="${emp.name == null}">
            <td width="7%">无</td>
          </c:if>
          <c:if test="${emp.name != null}">
            <td width="7%">${emp.name}</td>
          </c:if>


          <td width="7%">
            <input class="del_btn" type="button" value="删除"
                   onClick="if(confirm('您确定删除这条记录？'))
                           {window.location.href='<%=request.getContextPath() %>/new_criminal_drop/${emp.id}'} "/>
          </td>


        </tr>
      </c:forEach>

    </table>
  </c:if>
</div>

</body>
</html>

