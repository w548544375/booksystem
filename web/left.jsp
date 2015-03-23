<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 上午 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/left1.css">
 <!-- <div class="col-xs-2 left-group custom-left">
      <ul class="list-group" style="margin-top: 100px;">
        <li class="list-group-item list-group-item-danger">请核对你的账户</li>
        <li class="list-group-item"><label>当前账户:</label><label id="sessionuser"><%= session.getAttribute("user") %></label></li>
        <li class="list-group-item"><label>最大额度:</label><label id="max">30000</label></li>
        <li class="list-group-item"><label>当前额度:</label><label id="curent">30009</label></li>
      </ul>
  </div> -->
<table border="0" cellpadding="0" cellspacing="1" class="t_list"
       width="210">
    <tbody>
    <tr>
        <td class="t_list_caption" colspan="2" style="color: #000000;">請覈對您的帳戶</td>
    </tr>
    <tr>
        <td class="t_td_caption_1" width="64" style="color: #000000;">會員帳戶</td>
        <td class="t_td_text" width="137" style="color: #000000;"><%= session.getAttribute("user") %></td>
    </tr>
    <tr>
        <td class="t_td_caption_1" style="color: #000000;">信用額度</td>
        <td class="t_td_text" id="max" style="color: #000000;">10000.0</td>
    </tr>
    <tr>
        <td class="t_td_caption_1" style="color: #000000;">可用金額</td>
        <td class="t_td_text" id="curent" style="color: #000000;">10000.0</td>
    </tr>
    <tr>
        <td class="t_list_caption" colspan="2" style="color: #000000;"><a
                href="javascript:void(0);"
                onclick="window.open(&#39;http://www.shishicai.cn/cqssc/touzhu/&#39;,&#39;重慶時時彩&#39;,&#39;width=488,height=183,directories=no,status=no,scrollbars=yes,resizable=yes,menubar=no,toolbar=no&#39;);">“重慶時時彩”開獎网</a></td>
    </tr>
    </tbody>
</table>
<br>
<div
        style="width: 210px; margin: 10px auto; color: red; text-align: center;float: left;">
    <b style="color: red;">重要通知</b>
</div>
<div style="clear: both;"></div>
<div
        style="width: 210px; margin: 20px auto; line-height: 28px; color: red; height: 100px;float: left;">
    <marquee width="210px" height="100px" scrolldelay="700"
             scrollamount="9" onmouseout="this.start()" onmouseover="this.stop()"
             style="POSITION: relative;color: red;" direction="up">
        版本已升級，新增加和值盤，請各位玩家仔細閱讀規則后購彩，祝君購彩愉快！！！ </marquee>
    </div>
  <!-- 第二组菜单-->
  <div style="clear:both;"></div>
  <%--<div class="col-xs-2 custom-col custom-left">--%>
    <%--<div class="list-group custom-list-group">--%>
      <%--<a url="twoside.jsp" class="list-group-item">双面盘</a>--%>
      <%--<a url="singleball.jsp"  class="list-group-item">单球1~5</a>--%>
      <%--<a url="orderball.jsp" class="list-group-item">第一球</a>--%>
      <%--<a url="orderball.jsp" class="list-group-item">第二球</a>--%>
      <%--<a url="orderball.jsp" class="list-group-item">第三球</a>--%>
      <%--<a url="orderball.jsp" class="list-group-item">第四球</a>--%>
      <%--<a url="orderball.jsp" class="list-group-item">第五球</a>--%>
    <%--</div>--%>
    <%--<div style="clear:both"></div>--%>
  <%--</div>--%>

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

