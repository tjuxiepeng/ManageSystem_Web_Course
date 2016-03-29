<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2016/1/9
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>举报</title>

  <link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />

  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/tendina.min.js"></script>
  <script type="text/javascript" src="js/common.js"></script>

</head>
<body>

<!--顶部-->
<div class="top">
  <div style="float: left">
    <span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #fff">举报系统</span></div>

</div>



<!--顶部结束-->
<!--菜单-->
<div class="left-menu">
  <ul id="menu">
    <li class="menu-list">
      <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>操作<s class="sz"></s></a>
      <ul>
        <li><a href="<%=request.getContextPath() %>/search" target="menuFrame">
          <i class="glyph-icon icon-chevron-right1"></i>查询</a></li>
        <li><a href="<%=request.getContextPath() %>/addOne" target="menuFrame">
          <i class="glyph-icon icon-chevron-right2"></i>我要举报</a></li>

      </ul>
    </li>

  </ul>
</div>

<!--菜单右边的iframe页面-->
<div id="right-content" class="right-content">
  <div class="content">
    <div id="page_content">
      <iframe id="menuFrame" name="menuFrame" src="<%=request.getContextPath() %>/addOne"
              style="overflow:visible;" scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
    </div>
  </div>
</div>
</body>
</html>

