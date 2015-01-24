<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 上午 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/left.css">
  <div class="col-xs-2 left-group custom-left">
      <ul class="list-group">
        <li class="list-group-item list-group-item-danger">请核对你的账户</li>
        <li class="list-group-item"><label>当前账户:</label><label id="sessionuser"><%= session.getAttribute("user") %></label></li>
        <li class="list-group-item"><label>最大额度:</label><label id="max">30000</label></li>
        <li class="list-group-item"><label>当前额度:</label><label id="curent">30009</label></li>
      </ul>
  </div>
  <!-- 第二组菜单-->
  <div style="clear:both"></div>
  <div class="col-xs-2 custom-col custom-left">
    <div class="list-group custom-list-group">
      <a url="twoside.jsp" class="list-group-item">双面盘</a>
      <a url="singleball.jsp"  class="list-group-item">单球1~5</a>
      <a url="orderball.jsp" class="list-group-item">第一球</a>
      <a url="orderball.jsp" class="list-group-item">第二球</a>
      <a url="orderball.jsp" class="list-group-item">第三球</a>
      <a url="orderball.jsp" class="list-group-item">第四球</a>
      <a url="orderball.jsp" class="list-group-item">第五球</a>
    </div>
    <div style="clear:both"></div>
  </div>
<div style="clear:both"></div>
    <script type="text/javascript">
      $(document).ready(function(){
       try{
          var user = "<%=session.getAttribute("user") %>";
          if(user == "null"){
            window.location.href = "/login";
          }
       }catch (error){
         console.log(error);
          window.location.href = "/login";
        }

        getcreditInfo();
        $(".custom-left a").on("click", function (e) {
          //只要点了左边下注的任意一个，导航栏激活下注标签
          $("#navbar-content .active").removeClass("active");
          $("#navbar-content li").first().addClass("active");
          //加载下注页面
          var url = $(this).attr("url");
          var title = $(this).html();
          window.frames["main-container"].src = url;
          $(".bookType").text(title);
        })
      });


      function getcreditInfo(){
        $.ajax({
          url:'/main/creditInfo',
          success:function(data){
            $("#max").text(data.max);
            $("#curent").text(data.curent);
          }
        });
      }
    </script>

