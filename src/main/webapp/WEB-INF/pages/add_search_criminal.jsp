<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/9
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

  <!-- JS -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>        <!-- Templatemo Script -->

</head>
<body>

<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">

  <div class="templatemo-content-container">
    <div class="templatemo-content-widget white-bg">
      <h2 class="margin-bottom-10">通缉犯信息</h2>

      <form:form action="${pageContext.request.contextPath}/searchCommit" class="templatemo-login-form"
                 method="POST" enctype="multipart/form-data" modelAttribute="searchCondition">

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="name" style="font-size: 20px">通缉犯姓名</label>
            <form:input class="form-control" id="name" path="name" placeholder="选填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="num" style="font-size: 20px">通缉犯身份证号</label>
            <form:input class="form-control" id="num" path="num" placeholder="选填"/>
          </div>
        </div>

        <label for="height" style="font-size: 20px">身高</label>
        <div id="height">

          <div class="row form-group">
            <div class="col-lg-6 col-md-6 form-group">
              <form:input class="form-control" id="minHeight"  path="minHeight" placeholder="最小值"/>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-lg-6 col-md-6 form-group">
              <form:input class="form-control" id="maxHeight"  path="maxHeight" placeholder="最大值"/>
            </div>
          </div>

        </div>

        <br>
        <label for="weight" style="font-size: 20px">体重</label>
        <div id="weight">

          <div class="row form-group">
            <div class="col-lg-6 col-md-6 form-group">
              <form:input class="form-control" id="minWeight"  path="minWeight" placeholder="最小值"/>
            </div>
          </div>

          <div class="row form-group">
            <div class="col-lg-6 col-md-6 form-group">
              <form:input class="form-control" id="maxWeight"  path="maxWeight" placeholder="最大值"/>
            </div>
          </div>

        </div>


        <div class="form-group text-right">
          <button type="submit" class="templatemo-blue-button">Update</button>
          <button type="reset" class="templatemo-white-button">Reset</button>
        </div>

      </form:form>
    </div>

  </div>
</div>
</div>

</body>
</html>
