<%--
  Created by IntelliJ IDEA.
  User: sexry
  Date: 1/24/15
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 	<html lang="en"> <!--<![endif]-->
<head>

  <!-- General Metas -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	<!-- Force Latest IE rendering engine -->
  <title>登录</title>
  <meta name="description" content="">
  <meta name="author" content="">
  <!--[if lt IE 9]>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <![endif]-->

  <!-- Mobile Specific Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

  <!-- Stylesheets -->
  <link rel="stylesheet" href="css/base.css">
  <link rel="stylesheet" href="css/skeleton.css">
  <link rel="stylesheet" href="css/layout.css">

</head>
<body>

<div class="notice" style="display:none;">
  <a href="" class="close">close</a>
  <p class="warn"></p>
</div>



<!-- Primary Page Layout -->

<div class="container" style="display:none;">

  <div class="form-bg">
    <form name="login" id="loginform" action="login/validateLogin" onsubmit="return getLoginResult();">
      <h2>登录</h2>
      <p><input type="text" name="username" placeholder="用户名"></p>
      <p><input type="password" name="password" placeholder="输入密码"></p>
      <p vertical-align: bottom;><input type="text" id="code" placeholder="输入验证码" style="width: 150px;margin-left: 25px;display: inline-block;"><img class="imagecode" src="generateValitorImg" /></p>
      <button type="submit" ></button>
      <form>
  </div>


  <p class="forgot">您是否忘记密码?<a href="#">联系管理员</a></p>


</div><!-- container -->

<!-- JS  -->
<script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
<script>window.jQuery || document.write("<script src='frame/js/jquery-2.1.1.min.js'>\x3C/script>")</script>
<script src="frame/js/app.js"></script>
<script src="frame/js/jquery.form.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    //初始化淡入
    $(".container").fadeIn(3000);
    //初始化提交form
    $("#loginform").ajaxForm();
    //关闭按钮点击
    $(".close").on("click",function(){
      $(".notice").slideUp(2000);
    });
    //验证图形码
    $("#code").blur(function(){
      var code = $(this).val();
      //如果验证码为空

      if(code == null || code == "") {
        noticeMessage("验证码不能为空");
      }else{
        $.ajax({
          url: 'login/validateCode',
          data: {"code": code},
          dataType: 'json',
          type: 'GET',
          success: function (data) {
              if(!data){
                noticeMessage("验证码错误");
              }
          }
        });
      }

    });
  });

 function getLoginResult(){
   //异步表格提交
   $("#loginform").ajaxSubmit(function(data){
      if(data!= "suc"){
        noticeMessage(data);
      }else{
        window.location.href="/main";
      }
   });
   return false;
 }

  //显示消息
  function noticeMessage(str){
  $(".warn").html(str);
  toggleError();
  setTimeout("toggleError();",3000);
  }


  //淡入淡出
  function toggleError(){
    $(".notice").fadeToggle(3000);
  }

</script>
<!-- End Document -->
</body>
</html>
