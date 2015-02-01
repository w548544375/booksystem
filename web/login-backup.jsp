<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 上午 0:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="frame/css/bootstrap.min.css" />
  <style type="text/css">
    @import "css/login.css";
  </style>
    <title>登录</title>
</head>
<body>

  <div class="panel panel-primary col-sm-5 ">
    <div class="panel panel-heading " style="text-align: center;">
        <h3 class="panel-title">重庆时时彩</h3>
    </div><!-- title -->
    <div class="panel panel-body col-sm-12">
      <div class="form-horizontal well">
        <!-- 用户名-->
        <div class="form-group">
          <label for="username" class="col-sm-2 control-label">用户名:</label>
          <div class="col-sm-10   has-feedback">
            <input type="text" class="form-control" id="username" placeholder="请输入用户名" />
          <%--  <span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
          </div>
        </div> <!-- username form group -->

        <!-- 密码-->
        <div class="form-group">
          <label for="password" class="col-sm-2 control-label">密 码:</label>
          <div class="col-sm-10  has-feedback"><input type="password" class="form-control" id="password" />
            <%--<span class="glyphicon glyphicon-remove form-control-feedback"></span>--%>
          </div>

        </div><!-- password form group -->

        <!-- 验证码 -->
        <div class="form-group">
          <label for="code" class="col-sm-2 control-label">验证码</label>
          <div class="col-sm-5  has-error has-feedback"><input type="text" class="form-control" id="code"/>
            <span class="glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
          <div class="col-sm-5"><img class="form-control" src="generateValitorImg" /></div>

        </div>

        <!-- 登录按钮-->
        <div class="form-group">
          <div class="col-sm-offset-5 col-sm-10">
            <button id="login" class="btn btn-lg btn-primary">登录</button>
          </div>
        </div>

      </div>
    </div><!-- panelbody-->
  </div><!-- panel -->
  <script type="text/javascript">
    $(document).ready(function(){
      //验证图形码
      $("#code").blur(function(){
        var code = $(this).val();
          if(code == null || code == ""){
            $(this).parent(".has-success").removeClass("has-success").addClass("has-error");
            $(this).next(".glyphicon-ok").removeClass("glyphicon-ok").addClass("glyphicon-remove");
            return;
          }else
          {
            var obj = $(this);
            $.ajax({
              url:'login/validateCode',
              data:{"code":code},
              dataType:'json',
              type:'GET',
              success: function (data) {
                  if(data){
                    obj.parent(".has-error").removeClass("has-error").addClass("has-success");
                    obj.next(".glyphicon-remove").removeClass("glyphicon-remove").addClass("glyphicon-ok");
                  }else{
                    obj.parent(".has-success").removeClass("has-success").addClass("has-error");
                    obj.next(".glyphicon-ok").removeClass("glyphicon-ok").addClass("glyphicon-remove");
                  }
              },
              error:function(err){}
            });  //ajax
          } //end else
        }); //blur

        
      $("#login").on("click",function(){
        var username = $("#username").val();
        var password = $("#password").val();

        if( username =="" || password == "")
          return;

        if($("#code").parent(".has-error").length != 0){
          return;
        }

        $.ajax({
          url:'login/validateLogin',
          data:{"username":username,"password":password},
          type:'post',
          success:function(data){
            if(data == "suc"){
              //跳转
              window.location.href ="/main";
            }else{
              alert(data);
            }
          },
          error:function(err){
            console.log(err);
          }

        });
      });


    }); //ready
  </script>
  <div class="backlogin">

  </div>
</body>
</html>
