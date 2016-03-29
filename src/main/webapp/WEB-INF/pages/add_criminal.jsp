<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/9
  Time: 11:54
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



<script>

    function choose()
    {
        if(confirm("确认提交吗？"))
        {
            check();
        }
        else
        {
            return false;
        }
    }



    function check(){
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        var tel = document.getElementById("phone").value;
        if(title == "" || content == ""){
            alert("请填写完整");
            return false;
        }
        if(isNaN(tel)){
            alert("请输入电话号码");
            return false;
        }

        return true;
    }
</script>

<!-- Main content -->
<div class="templatemo-content col-1 light-gray-bg">

  <div class="templatemo-content-container">
    <div class="templatemo-content-widget white-bg">
      <h2 class="margin-bottom-10">通缉犯信息</h2>

      <form:form action="${pageContext.request.contextPath}/addOne" class="templatemo-login-form"
                 method="POST" enctype="multipart/form-data" modelAttribute="criminalInfo">
                 <%--onsubmit="return choose()">--%>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="phone">举报电话</label>
            <form:input class="form-control" id="phone" path="phone" placeholder="选填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="name">举报人姓名</label>
            <form:input class="form-control" id="name" path="name" placeholder="选填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="title">线索标题</label>
            <form:input class="form-control" id="title"  path="title" placeholder="必填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-12 form-group">
            <label class="control-label" for="content">线索描述</label>
            <form:textarea class="form-control" id="content" rows="3" placeholder="必填" path="content" />

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
