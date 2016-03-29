<%--
  Created by IntelliJ IDEA.
  User: xiepeng
  Date: 2015/12/28
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>XXXXX有限公司管理后台</title>

  <link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />

  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/tendina.min.js"></script>
  <script type="text/javascript" src="js/common.js"></script>

</head>
<body>

<!--顶部-->
<div class="top">
  <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #fff">
    网上通缉令管理系统</span></div>
  <div id="ad_setting" class="ad_setting">
    <a class="ad_setting_a" href="javascript:; ">当前身份：${identity}</a>
    <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
      <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-signout glyph-icon"></i>
          <a href="<%=request.getContextPath() %>/logout">退出</a>
      </a> </li>
    </ul>
    <img class="use_xl" src="images/right_menu.png" />
  </div>
</div>



<!--顶部结束-->
<!--菜单-->
<div class="left-menu">
  <ul id="menu">
    <li class="menu-list">
      <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>通缉犯人员管理<s class="sz"></s></a>
      <ul>
        <li><a href="<%=request.getContextPath() %>/criminal_list" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>通缉犯列表</a></li>
        <li><a href="<%=request.getContextPath() %>/criminal_search" target="menuFrame"><i class="glyph-icon icon-chevron-right2"></i>注销通缉犯</a></li>
        <li><a href="<%=request.getContextPath() %>/criminal_report" target="menuFrame"><i class="glyph-icon icon-chevron-right3"></i>线索查询</a></li>
      </ul>
    </li>
    <li class="menu-list">
      <a style="cursor:pointer" class="firsta"><i  class="glyph-icon xlcd"></i>警务人员管理<s class="sz"></s></a>
      <ul>
        <li><a href="<%=request.getContextPath() %>/police_list" target="menuFrame"><i class="glyph-icon icon-chevron-right1"></i>警务人员列表</a></li>
      </ul>
    </li>
  </ul>
</div>

<!--菜单右边的iframe页面-->
<div id="right-content" class="right-content">
  <div class="content">
    <div id="page_content">
      <iframe id="menuFrame" name="menuFrame" src="<%=request.getContextPath() %>/criminal_list" style="overflow:visible;"
              scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
    </div>
  </div>
</div>
</body>
</html>
