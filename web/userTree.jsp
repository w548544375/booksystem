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

<link rel="stylesheet" href="frame/css/bootstrap.min.css">
<link rel="stylesheet" href="css/sGame.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="frame/css/zTreeStyle.css">
<link rel="stylesheet" href="frame/css/jquery.dataTables.min.css">
<script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
<script type="text/javascript" src="frame/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="frame/js/jquery.form.js"></script>
<script type="text/javascript" src="frame/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
    var userId = null; //用户id
    var tableO = null; //输赢结果的table对象
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
            //treeNode.id
            userId = treeNode.id;
           // alert(userId);
            //重新加载table
            loadGroupResult("groupwin",tableO);
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

     tableO = loadGroupResult("groupwin",tableO);
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


   function loadGroupResult(id,tableObject){
       if (tableObject == null) {
           tableObject = $("#" + id).DataTable({
               "bAutoWidth": true,
               "columns": [{"data":"username"}, {"data":"bookcode"}, {"data":"period"}, {"data":"type"},
                   {"data":"money"}, {"data":"result"}, {"data":"backresult"},{"data":"booktime"}],
               "columnDefs":[{
                   "render":function(data,type,row){
                       var date = new Date();
                       date.setTime(data);
                       return date.toDateString();
                    },
                   "targets":7
               }],
               "bServerSide": true,
               "iDisplayLength": 25,
               //"bProcessing": true,
               "bFilter": false,
               "ordering":false,//禁用排序
               "sPaginationType":"full_numbers",
               "sAjaxSource": "/user/groupResult",//获取数据的url
               "fnServerData": retrieveData,
               "oLanguage": {                          //汉化
                   "sLengthMenu": "每页显示 _MENU_ 条记录",
                   "sZeroRecords": "没有检索到数据",
                   "sInfo": "第 _START_ 到第 _END_ 条数据/共有 _TOTAL_ 条记录",
                   "sInfoEmtpy": "没有数据",
                   "sProcessing": "加载数据...<i class=\"fa fa-spinner fa-pulse\"></i>",
                   "oPaginate": {
                       "sFirst": "首页",
                       "sPrevious": "前一页",
                       "sNext": "后一页",
                       "sLast": "尾页"
                   }
               }
           });
       }else{
           tableObject.draw();
       }
       return tableObject;
   }


  function retrieveData( sSource, aoData, fnCallback ) {
      aoData.push({"name":"ids","value":userId});
      console.log(aoData);
      $.ajax( {
          "type": "POST",
          "url": sSource,
          "dataType": "json",
          "data": aoData, //以json格式传递
          "success": function(resp) {
              fnCallback(resp); //服务器端返回的对象的returnObject部分是要求的格式
          }
      });
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

<!--table 显示自己以及下线订单-->
<div class="row" style="margin-top: 20px;">
    <div class="col-sm-11" style="margin-left: 6px;">
    <table class="display compact text-center" width="100%" cellspacing="0" id="groupbook">
        <thead>
            <tr>
              <td>下单帐号</td>
              <td>单号/时间</td>
              <td>期号</td>
              <td>明细</td>
              <td>金额</td>
              <td>可赢</td>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    </div>
</div>


<!--table 显示自己以及下线订单结果-->
<div class="row">
    <div class="col-sm-11" style="margin-left:6px;">
    <table class="display compact  text-center" width="100%" cellspacing="0" id="groupwin">
        <thead>
            <tr>
                <td>下单帐号</td>
                <td>单号</td>
                <td>期数</td>
                <td>明细</td>
                <td>金额</td>
                <td>退水</td>
                <td>结果</td>
                <td>时间</td>
            </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    </div>
</div>



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
