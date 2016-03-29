<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/9
  Time: 18:22
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

    <style>
        body{text-align:center;width:100%;}

        .fenye{ margin:0 auto}
        .fenye ul{ float:left; margin-left:32px; }
        .fenye ul li{ float:left; margin-left:5px;padding: 4px 6px; border:1px solid #ccc;  font-weight:bold; color:#999;}
        .fenye ul li a{ color:#999;}
        /*.fenye ul li.xifenye{ width:38px; text-align:center; float:left; position:relative;}*/
        .fenye ul li .xab ul{ margin-left:0; padding-bottom:0;}
        .fenye ul li .xab ul li{ border:0; padding:4px 0px; color:#999; width:34px; margin-left:0px; text-align:center;}
    </style>
</head>

<body>

<br><br><br>

<c:if test="${empty requestScope.employees }">
  没有信息.
</c:if>

<div class="table_con">
  <c:if test="${!empty requestScope.employees }">
    <table>

      <tr class="tb_title">
        <td width="7%">姓名</td>
        <td width="7%">性别</td>
        <td width="19%">身份证号</td>
        <td width="7%">身高</td>
        <td width="7%">体重</td>
        <td width="33%">体态特征</td>
        <td width="13%">举报电话</td>
        <td width="7%">照片</td>
      </tr>

      <c:forEach items="${requestScope.employees }" var="emp">
        <tr>
          <td width="7%">${emp.criminalname}</td>
          <td width="7%">${emp.gender}</td>
          <td width="19%">${emp.num}</td>
          <td width="7%">${emp.height}</td>
          <td width="7%">${emp.weight}</td>
          <td width="33%">${emp.body}</td>
          <td width="13%">${emp.phone}</td>

          <c:if test="${emp.photo == null}">
            <td width="7%">无照片</td>
          </c:if>
          <c:if test="${emp.photo != null}">
            <td width="7%"><a href="<%=request.getContextPath() %>/showPhoto/${emp.photo}">${emp.photo}</a></td>
          </c:if>

        </tr>
      </c:forEach>

    </table>
  </c:if>
</div>

<div class="fenye">
    <ul>
        <c:if test="${requestScope.isFirst != 'yes'}">
            <li id="down">
                <a href='<%=request.getContextPath() %>/new_criminal_search?tag=first'>首页</a>
            </li>
        </c:if>
        <c:if test="${requestScope.isFirst == 'yes'}">
            <li>
                首页
            </li>
        </c:if>

        <c:if test="${requestScope.isFirst != 'yes'}">
            <li id="down">
                <a href='<%=request.getContextPath() %>/new_criminal_search?tag=last'>上一页</a>
            </li>
        </c:if>
        <c:if test="${requestScope.isFirst == 'yes'}">
            <li>
                上一页
            </li>
        </c:if>

        <li class="xifenye" id="xifenye">
            ${curr}/${total}
        </li>



        <c:if test="${requestScope.isLast != 'yes'}">
            <li id="down">
                <a href='<%=request.getContextPath() %>/new_criminal_search?tag=next'>下一页</a>
            </li>
        </c:if>
        <c:if test="${requestScope.isLast == 'yes'}">
            <li>
                下一页
            </li>
        </c:if>



        <c:if test="${requestScope.isLast != 'yes'}">
            <li id="down">
                <a href='<%=request.getContextPath() %>/new_criminal_search?tag=end'>尾页</a>
            </li>
        </c:if>
        <c:if test="${requestScope.isLast == 'yes'}">
            <li>
                尾页
            </li>
        </c:if>


    </ul>

</div>


</body>
</html>
