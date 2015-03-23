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
  <link href="css/sGame.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/TopMenu.css">


    <title>header</title>
</head>
<body onload="hasPrivileges();">
<!--  <nav class="navbar navbar-fixed-top" role="navigation" style="background-image: url(images/TopMenu_Top.jpg);">
   <!-- <div class="container-fluid">
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
   <!--   <div class="collapse navbar-collapse" id="navbar-content">
        <ul class="nav navbar-nav">
          <li><a href="main.jsp">下注</a></li> <!-- 默认显示两面盘-->
       <!--   <li><a href="creditinfo.jsp">信用资料</a></li>
          <li><a href="bookdetail.jsp">下单明细</a></li>
          <li><a href="todayrecord.jsp">今日已结</a></li>
          <li><a href="history.jsp">历史记录</a></li>
          <li><a href="weeksrecord.jsp">两周报表</a></li>
          <li><a href="gamerule.jsp">游戏规则</a></li>
        </ul>
        <!-- 退出按钮 -->
      <!--  <button type="button" class="btn btn-danger navbar-btn" style="float: right;">退出登录</button>
      </div>
    </div><!-- container -->
    <table border="0" cellspacing="0" cellpadding="0" width="100%" height="108">
      <tr>
        <td valign="top" width="243px" style="border:none;">
          <table  border="0" cellspacing="0" cellpadding="0"  width="100%"
                  height="108">
            <tr><td background="images/TopLogo_60.jpg" style="width: 243px;height: 80px;border:none;">
              <object width="243"
                      height="80" id="top_c"
                      classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
                      codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,22,0">
                <param name="wmode" value="transparent">
                <param name="movie" value="/resources/Images/lx.swf">
                <param name="menu" value="false">
              </object>
            </td></tr>
            <tr><td style="background: url(images/TopMenu_Top2.jpg) bottom repeat-x">
              <img src="images/TopMenu_Top2.jpg" width="1" height="28">
            </td></tr>
          </table>
        </td>
        <td background="images/TopMenu_Top.jpg" style="border:none;">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" height="108">
            <tr>
              <td  height="43" style="border:none;">
                <table border="0" cellpadding="0" cellspacing="0" width="716">
                <tr>
                  <td align="right" style="border:none;">
                    <a href="main.jsp" class="T_a">下注</a> |
                    <a href="creditinfo.jsp" target="right" class="T_a">信用资料</a> |
                    <a href="bookdetail.jsp" target="right" class="T_a">下注明细</a> |
                    <a href="todayrecord.jsp" target="right" class="T_a">结算报表</a> |
                    <a href="history.jsp" target="right" class="T_a">历史开奖</a> |
                    <a href="weeksrecord.jsp" target="right" class="T_a">两周报表</a> |
                    <a href="gamerule.jsp" target="right" class="T_a">游戏规则</a> |
                    <a href="#" class="T_a" style="COLOR: #baff00" id="exit" target="_parent">退出</a> |
                    <a id="privilegesa" href="/user" target="right" class="T_a" style="display: none;">操作中心</a>
                  </td>
                </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td  height="36" style="border:none;">
                <table border="0" cellspacing="0"
                       cellpadding="0" width="716">
                  <tbody>
                  <tr>
                    <td height="37" width="1%" style="border:none;"><img
                            src="images/TopMenu_2Left.jpg" width="20"
                            height="37"></td>
                    <td width="64%" style="border:none;"><input style="CURSOR: hand"
                                           class="bST_1_s" onclick="gamechang(2);"
                                           onfocus="this.blur();" name="bST_2" value="重慶時時彩"
                                           type="button" id="ssc"></td>
                    <td width="35%" align="right" style="border:none;"></td>
                  </tr>
                  </tbody>
                </table>
              </td>
            </tr>
            <tr>
              <td height="29" style="border:none;">
                <div class="col-lg-10" style="background: url(/images/TopMenu_Top2.jpg) bottom repeat-x;height:29px;">
                  <table id="navball-click">
                    <tr>
                      <td style=" border:none;"> <a url="twoside.jsp" >双面盘</a></td>
                      <td style=" border:none;"><a url="singleball.jsp" >单球</a></td>
                      <td style=" border:none;"><a url="orderball.jsp" >第一球</a></td>
                      <td style=" border:none;"><a url="orderball.jsp" >第二球</a></td>
                      <td style=" border:none;"><a url="orderball.jsp" >第三球</a></td>
                      <td style=" border:none;"><a url="orderball.jsp" >第四球</a></td>
                      <td style=" border:none;"><a url="orderball.jsp" >第五球</a></td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
 <!-- </nav><!-- 导航条-->
  <script type="text/javascript">
    $(document).ready(function(){
      var pagename = pageName();
      $("[href='"+pagename+"']").attr("style","color:red;");

    $("#exit").on("click",function(){
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

   function hasPrivileges(){
     $.ajax({
       url:'/user/hasPrivileges',
       success:function(data){
         if(data){
           $("#privilegesa").show();
         }else{
           $("#privilegesa").hide();
         }
       }
     });
   }
  </script>
</body>
</html>
