<%--
  Created by IntelliJ IDEA.
  User: sexry
  Date: 1/20/15
  Time: 01:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>操作中心</title>
</head>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="frame/css/zTreeStyle.css">
<script type="text/javascript" src="frame/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="frame/js/jquery.form.js"></script>
<script type="text/javascript">

  $(document).ready(function(){

      $("#adduserform").ajaxForm();
      $("#editpassword").ajaxForm();

    var setting = {
      async: {
        enable: true,
        url: "/user/tree",
        autoParam: ["id"]
      },
      callback :{
        onClick: zTreeOnClick
      }
      };
       var ztreeobj = $.fn.zTree.init($("#treeDemo"), setting);

        //数点击事件
        function zTreeOnClick(event, treeId, treeNode) {

        }



      $("#addUser").on('show.bs.modal',function(){
           $("#adduserform").clearForm();
           $("img").attr("src","generateValitorImg");
      });

      $("#addUser").on('hide.bs.modal',function(){
          $("img").attr("src","");
      });


      $("#editpassword").on('show.bs.modal',function(){
            $("#changepassword").clearForm();
      });

  });


  /**
   * 添加用户成功
   * */
  function showResult(){
      $("#adduserform").ajaxSubmit(function(message) {
          // 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
          if(message == "suc") {
              $("#adduserform").clearForm();
              $("#adduser").modal('hide');
              window.location.reload();
          }
          else{
              alert(message);
          }

      });
      return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
  }



  /**
   * 修改密码成功
   * */
  function showPasswordChange(){
      $("#changepassword").ajaxSubmit(function(message) {
          // 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容
          if(message == "suc") {
              $("#changepassword").clearForm();
              $("#editpassword").modal('hide');

          }
          else{
              alert(message);
          }

      });
      return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
  }


</script>
<div class="row">
    <div class="col-sm-2" style="margin-left:6px;">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title">用户列表</h3>
            </div>
            <div class="panel-body">
                <ul class="ztree" id="treeDemo"></ul>
            </div>
        </div>
    </div>
    <div class="col-sm-9">
       <div class="panel panel-warning">
           <div class="panel-heading">
               <h3 class="panel-title">个人中心</h3>
           </div>
           <div class="panel-body">
               <div class="btn-group" role="group" aria-label="...">
                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#adduser">下发帐号</button>
                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editpassword">修改密码</button>
                   <button type="button" class="btn btn-default">历史查询</button>
                   <button type="button" class="btn btn-default">未处理订单</button>
                   <button type="button" class="btn btn-default">已处理订单</button>
                   <div class="btn-group" role="group">
                       <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                         排行统计
                           <span class="caret"></span>
                       </button>
                       <ul class="dropdown-menu" role="menu">
                           <li><a href="#">下线下注排行</a></li>
                           <li><a href="#">下线输赢排行</a></li>
                           <li><a href="#">下线输赢</a></li>
                       </ul>
                   </div>
               </div>
           </div>
       </div>
     </div>
  </div><!-- row -->








<!-- modal -->

<!-- 下发帐号 -->
<div class="modal fade" id="adduser" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" role="form" action="user/addUser" method="post" id="adduserform" onsubmit="return showResult();">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">下发帐号</h4>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm" class="col-sm-2 control-label">重复密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="confirm" id="confirm" placeholder="重新输入密码">
                            </div>
                        </div>
                        <!-- 验证码 -->
                        <div class="form-group">
                            <label for="code" class="col-sm-2 control-label">验证码</label>
                            <div class="col-sm-5  has-error has-feedback">
                                <input type="text" class="form-control" name="code" id="code"/></span>
                            </div>
                            <div class="col-sm-5"><img class="form-control" src="generateValitorImg" /></div>
                        </div>
                        <!--  是否允许用户下发权限  -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                权限
                            </label>
                            <div class="col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="userprivileges" />
                                        是否给给他下发帐号的权限
                                    </label>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
                <div class="modal-footer text-center">
                    <button type="reset" class="btn btn-danger" >重置</button>
                    <button type="submit" class="btn btn-primary">下发帐号</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 修改密码-->
<div class="modal fade" id="editpassword" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="form-horizontal" id="changepassword" role="form" action="user/changePassword" onsubmit="return showPasswordChange();">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改密码</h4>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">原密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="oldpassword" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="newpassword" placeholder="重新输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="confirm" class="col-sm-2 control-label">重复密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="newconfirm" placeholder="重新输入密码">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer text-center">
                    <button type="reset" class="btn btn-danger" >重置</button>
                    <button type="submit" class="btn btn-primary">修改密码</button>
                    </div>
                </form>
            </div><!-- content-->
        </div> <!-- dialog -->
    </div>  <!--modal-->

</body>
</html>
