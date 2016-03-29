<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2015/12/31
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Visual Admin Dashboard - Preferences</title>
  <meta name="description" content="">
  <meta name="author" content="templatemo">
  <!--
  Visual Admin Template
  http://www.templatemo.com/preview/templatemo_455_visual_admin
  -->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
  <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

  <!-- JS -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>        <!-- Templatemo Script -->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body>


<script>

    function test(){
        document.getElementById("form").submit();
    }

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
        var name = document.getElementById("name").value;
        var cardId = document.getElementById("cardId").value;
        var height = document.getElementById("height").value;
        var weight = document.getElementById("weight").value;

        if(name == "" || cardId == "" || height == "" || weight == ""){
            alert("请填写完整");
            return false;
        }
        if(isNaN(cardId)||isNaN(height)||isNaN(weight)){
            alert("请填入正确的数字");
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

      <form:form action="${pageContext.request.contextPath}/criminal_add1" class="templatemo-login-form"
                 method="POST" enctype="multipart/form-data" modelAttribute="criminal"
              id="form">

        <c:if test="${criminal.id != null}">
          <form:hidden path="id" />
        </c:if>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="name">姓名</label>
            <form:input class="form-control" id="name"  path="criminalname" placeholder="必填"/>
          </div>
        </div>

        <c:if test="${criminal.gender == null}">
          <div class="row form-group">
            <div class="col-lg-12 form-group">
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r4" value="男">
                <label for="r4" class="font-weight-400"><span></span>男</label>
              </div>
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r5" value="女">
                <label for="r5" class="font-weight-400"><span></span>女</label>
              </div>
            </div>
          </div>
        </c:if>

        <c:if test="${criminal.gender == '男' }">
          <div class="row form-group">
            <div class="col-lg-12 form-group">
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r4" value="男" checked>
                <label for="r4" class="font-weight-400"><span></span>男</label>
              </div>
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r5" value="女">
                <label for="r5" class="font-weight-400"><span></span>女</label>
              </div>
            </div>
          </div>
        </c:if>

        <c:if test="${criminal.gender == '女'}">
          <div class="row form-group">
            <div class="col-lg-12 form-group">
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r4" value="男">
                <label for="r4" class="font-weight-400"><span></span>男</label>
              </div>
              <div class="margin-right-15 templatemo-inline-block">
                <input type="radio" name="sex" id="r5" value="女" checked>
                <label for="r5" class="font-weight-400"><span></span>女</label>
              </div>
            </div>
          </div>
        </c:if>



        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="cardId">身份证号</label>
            <form:input class="form-control" id="cardId" path="num" placeholder="必填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="height">身高</label>
            <form:input class="form-control" id="height" path="height" placeholder="必填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="weight">体重</label>
            <form:input class="form-control" id="weight" path="weight" placeholder="必填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-12 form-group">
            <label class="control-label" for="body">体态特征</label>
            <form:textarea class="form-control" id="body" rows="3" placeholder="选填" path="body"></form:textarea>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-6 col-md-6 form-group">
            <label for="phone">举报电话</label>
            <form:input class="form-control" id="phone" path="phone" placeholder="选填"/>
          </div>
        </div>

        <div class="row form-group">
          <div class="col-lg-12">
            <label class="control-label templatemo-block">上传照片</label>
            <!-- <input type="file" name="fileToUpload" id="fileToUpload" class="margin-bottom-10"> -->
            <input name="upLoadPhoto" type="file" id="photo" class="filestyle" data-buttonName="btn-primary" data-buttonBefore="true" data-icon="false"  />
            <p>选填</p>
          </div>
        </div>

        <c:if test="${criminal.photo != null}">
          <form:hidden path="photo" />
        </c:if>


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

