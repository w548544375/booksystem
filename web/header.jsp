<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 上午 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="frame/css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/header.css" />
    <title>header</title>
</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-content">
            <span class="sr-only">时时彩</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">时时彩</a>
        </div><!--  导航头部 -->

      <!-- 导航内容 -->
      <div class="collapse navbar-collapse" id="navbar-content">
        <ul class="nav navbar-nav">
          <li><a href="main.jsp">下注</a></li> <!-- 默认显示两面盘-->
          <li><a href="creditinfo.jsp">信用资料</a></li>
          <li><a href="bookdetail.jsp">下单明细</a></li>
          <li><a href="todayrecord.jsp">今日已结</a></li>
          <li><a href="history.jsp">历史记录</a></li>
          <li><a href="weeksrecord.jsp">两周报表</a></li>
          <li><a href="gamerule.jsp">游戏规则</a></li>
          <li><a href="user">操作中心</a></li>
        </ul>
        <!-- 退出按钮 -->
        <button type="button" class="btn btn-danger navbar-btn" style="float: right;">退出登录</button>
      </div>
    </div><!-- container -->
  </nav><!-- 导航条-->
  <script type="text/javascript">
    $(document).ready(function(){
      var pagename = pageName();
      $("[href='"+pagename+"']").parent("li").addClass("active");

    $(".navbar-btn").on("click",function(){
      if(confirm("确定要退出登录?")) {
        $.ajax({
          url: '/main/logOut',
          success: function (data) {
            window.location.href = "/login";
          },
          error: function (err) {
          }
        });
      }
      });
    });
    //获取当前页面的名字
    function pageName()
    {
      var strUrl=location.href;
      var arrUrl=strUrl.split("/");
      var strPage=arrUrl[arrUrl.length-1];
      return strPage;
    }


  </script>
</body>
</html>
