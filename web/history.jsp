<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 上午 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>历史记录</title>
  <link rel="stylesheet" href="css/main.css">
  <link href="css/ball.css" rel="stylesheet" />
  <script type="text/javascript" src="frame/js/page.js"></script>
</head>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="left.jsp"></jsp:include>
<div class="main-container col-sm-10">
  <div class="table-responsive">
    <table class="table table-hover table-bordered" align="center" style="text-align: center;background: #ffffff;">
      <thead>
        <tr class="info">
          <td>期数</td>
          <td>开奖时间</td>
          <td>开出号码</td>
          <td colspan="3">总和</td>
          <td>龙虎</td>
          <td>前三</td>
          <td>中三</td>
          <td>后三</td>
        </tr>
      </thead>
      <tbody>

      </tbody>
    </table>

  </div>
  <div class="row">
    <div class="col-sm-5">
      <span>总共<label id="totalrows">1</label>条记录</span>
    </div>
    <div class="col-sm-7 text-right">
      <nav>
        <ul class="pagination pagination-sm" style="margin: 0px 0px;">
          <li class="disabled"><a href="#">&laquo;</a></li>
          <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>
  <script type="text/javascript">
    $(document).ready(function(){
      loadPageData(1,20);
    });


    function loadPageData(page,pagesize){
      $("tbody").html("");
      $.ajax({
        url:'/main/awardHistory',
        data:{"page":page,"pagesize":pagesize},
        success:function(data){
          if(data == null){
            alert("网络错误");
            return;
          }
          var rows = data.Rows;

          for(var i=0;i<rows.length;i++){
            var row = rows[i];

            var code = row.awardcode;
            var number = "";
            for(var j=0;j<code.length;j++){
              number += "<em class='awardBall'>"+code.charAt(j)+"</em>";
            }

            //总和大小的颜色
            var colorsize =  row.size.substr(2,row.size.length)=="大" ? "red" : "black";
            //
            var colordevity = row.odevity.substr(2,row.odevity.length) =="双" ? "red" : "black";

            var colordt = row.dt =="龙" ? "red" : "black";

            if(row.dt == "和")
                colordt = "green";


            var singlerow = "<tr>" +
                    "<td>"+row.period+"</td>"+
                    "<td>"+row.awardtime+"</td>"+
                    "<td>"+number+"</td>"+
                    "<td style='color:red;font-weight:bold;'>"+row.plusnumber+"</td>"+
                    "<td style='color:"+colorsize+";font-weight:bold;'>"+row.size.substr(2,row.size.length)+"</td>"+
                    "<td style='color:"+colordevity+";font-weight:bold;'>"+row.odevity.substr(2,row.odevity.length)+"</td>"+
                    "<td style='color:"+colordt+";font-weight:bold;'>"+row.dt+"</td>"+
                    "<td style='color:black;font-weight:bold;'>"+row.fthree+"</td>"+
                    "<td style='color:black;font-weight:bold;'>"+row.mthree+"</td>"+
                    "<td style='color:black;font-weight:bold;'>"+row.bthree+"</td>"+
                    "</tr>";
            //console.log(singlerow);
            $("tbody").append(singlerow);
          }
          $("#totalrows").text(data.totalrows);
          pageShow("pagination",data.totalpage,"loadPageData",data.pagenumber,pagesize);
        },
        error:function(err){

        }
      });
    }



  </script>


</body>
</html>
