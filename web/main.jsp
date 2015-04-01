<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="css/main.css">
    <title>操作页</title>
</head>
<style type="text/css">
  #navball-click td{
    height: 29px;
    width: 50px;
    text-align: center;
    border:none;
  }

</style>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<div style="clear: both;"></div>
<div style="top:100px;">
<!--<div class="col-lg-2" style="background: url(/images/TopMenu_Top2.jpg) bottom repeat-x;height:29px;"></div>
  <div class="col-lg-10" style="background: url(/images/TopMenu_Top2.jpg) bottom repeat-x;height:29px;">
    <table id="navball-click">
      <tr>
        <td style=" border:none;"> <a url="twoside.jsp" >双面盘</a></td>
        <td style=" border:none;"><a url="singleball.jsp" >单球1~5</a></td>
        <td style=" border:none;"><a url="orderball.jsp" >第一球</a></td>
        <td style=" border:none;"><a url="orderball.jsp" >第二球</a></td>
        <td style=" border:none;"><a url="orderball.jsp" >第三球</a></td>
        <td style=" border:none;"><a url="orderball.jsp" >第四球</a></td>
        <td style=" border:none;"><a url="orderball.jsp" >第五球</a></td>
      </tr>
    </table>
  </div>
</div> -->
<jsp:include page="left.jsp"></jsp:include>
  <div class="main-container">
          <jsp:include page="awardinfo.jsp"></jsp:include>
        <iframe name="right" id="main-container" height="150%" width="1060" frameborder="0" src="twoside.jsp" scrolling="no"></iframe>
  </div>
  <div style="width: 100%; height: 23px; position: fixed; bottom: 0;background: url(images/bg.gif)" >
    <marquee direction="left" behavior="alternate" onMouseOut="this.start()" onMouseIn="this.stop()" style="font-size: 15px;
line-height: 1.7;
color: chocolate;">
      祝君赢得满堂彩！
    </marquee>
  </div>
<script type="text/javascript">
$(document).ready(function(){
  $("#navball-click a").on("click", function (e) {
    //只要点了左边下注的任意一个，导航栏激活下注标签
    $("#navbar-content .active").removeClass("active");
    $("#navbar-content li").first().addClass("active");
    //加载下注页面
    //加载下注页面
    var url = $(this).attr("url");
    var title = $(this).html();
    window.frames["main-container"].src = url;
    $(".bookType").text(title);
  });
});
</script>
</body>
</html>
