<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2015/12/28
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
  <script language="javascript">
    function form_onsubmit(obj)
    {
      if(obj.username.value == "") {
        alert("请输入用户名");
        return false;
      }
      if(obj.password.value == "") {
        alert("请输入密码");
        return false;
      }
      return true;
    }
  </script>
  <link rel="stylesheet" type="text/css" href="css/login.css">
  <title>后台登陆</title>
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


<div id="login_top">
  <div id="welcome">
    网上通缉令管理系统
  </div>
</div>
<div id="login_center">
  <div id="login_area">
    <div id="login_form">

      <form action="<%=request.getContextPath() %>/login" method="post">
        <div id="login_tip">
          民警登录<!-- &nbsp;&nbsp;UserLogin -->
        </div>
        <div><input id="username" type="text" class="username" name="username"></div>
        <div><input id="password" type="password" class="pwd" name="password"></div>
        <div id="btn_area">
          <input type="submit" name="submit" id="sub_btn" value="登&nbsp;&nbsp;录" onclick=
                  "return form_onsubmit(this.form)">&nbsp;&nbsp;
          <%--<input type="text" class="verify">--%>
          <%--<img src="images/login/verify.png" alt="登录" width="80" height="40">--%>
        </div>
      </form>
      <br>
      <font color="red">${error }</font>

    </div>
  </div>
</div>
</body>
</html>
