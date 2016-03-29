<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/16
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>

</head>
<body>

<script>
    function check(){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        if(username == "" || password == ""){
            alert("请填写完整");
            return false;
        }

        return true;
    }
</script>

<div class="templatemo-content col-1 light-gray-bg">

    <div class="templatemo-content-container">
        <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">通缉犯信息</h2>

            <form:form action="${pageContext.request.contextPath}/user_save" class="templatemo-login-form"
                       method="POST" enctype="multipart/form-data" modelAttribute="user"
                       onsubmit="return check()">

                <c:if test="${user.id != null}">
                    <form:hidden path="id" />
                </c:if>

                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="username">姓名</label>
                        <form:input class="form-control" id="username"  path="username" placeholder="必填"/>
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="password">密码</label>
                        <form:input class="form-control" id="password" path="password" placeholder="必填"/>
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
