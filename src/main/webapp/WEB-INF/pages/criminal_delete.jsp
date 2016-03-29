<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2015/12/30
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>


<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">

  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" href="css/Iframe.css" />
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen" />

</head>


<body>

<br><br>
<form id="searchform2" name="searchform2"
      method="post" action="<%=request.getContextPath() %>/criminal_really_delete">
  <div class="fieldcontainer">
    <input type="text" name="s2" id="s2" class="searchfieldjs" placeholder="请输入身份证号" tabindex="2">
    <input type="submit" name="search2btn" id="search2btn" value="">
  </div>
</form>

<br><br>

<c:if test="${empty requestScope.cri }">
  没有信息.
</c:if>

<div class="table_con">
  <c:if test="${!empty requestScope.cri }">
    <table>

      <tr class="tb_title">
        <td width="7%">姓名</td>
        <td width="7%">性别</td>
        <td width="19%">身份证号</td>
        <td width="7%">身高</td>
        <td width="7%">体重</td>
        <td width="15%">体态特征</td>
        <td width="13%">举报电话</td>
        <td width="7%">照片</td>
        <td width="18%">操作</td>
      </tr>

      <c:forEach items="${requestScope.cri }" var="emp">
        <tr>
          <td width="7%">${emp.criminalname}</td>
          <td width="7%">${emp.gender}</td>
          <td width="19%">${emp.num}</td>
          <td width="7%">${emp.height}</td>
          <td width="7%">${emp.weight}</td>
          <td width="15%">${emp.body}</td>
          <td width="13%">${emp.phone}</td>

          <c:if test="${emp.photo == null}">
            <td width="7%">无照片</td>
          </c:if>
          <c:if test="${emp.photo != null}">
            <td width="7%"><a href="<%=request.getContextPath() %>/showPhoto/${emp.photo}">${emp.photo}</a></td>
          </c:if>

          <td width="18%">
            <input class="bj_btn" type="button" value="编辑"
                   onClick="window.location.href='<%=request.getContextPath() %>/criminal_modify/${emp.id}'"/>
            <input class="del_btn" type="button" value="删除"
                   onClick="if(confirm('您确定删除这条记录？'))
                           {window.location.href='<%=request.getContextPath() %>/criminal_delete/${emp.id}'} "/>
          </td>
        </tr>
      </c:forEach>

    </table>
  </c:if>
</div>


</body>
</html>
