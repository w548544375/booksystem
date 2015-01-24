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
  <title>今日已结</title>
  <link rel="stylesheet" href="css/main.css">
  <script type="text/javascript" src="frame/js/page.js"></script>
</head>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="left.jsp"></jsp:include>
<div class="main-container col-sm-10">
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
    <tr class="alert alert-danger">
      <td>订单号/时间</td>
      <td>下注期号</td>
      <td>订单明细</td>
      <td>下注金额</td>
      <td>退水金额</td>
    </tr>
    </thead>
    <tbody>
    <tr class="info">
      <td></td>
      <td>总计</td>
      <td>1笔</td>
      <td>10.0</td>
      <td>9.0</td>
    </tr>
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
    $.ajax({
      url:'/main/handledBook',
      data:{"page":page,"pagesize":pagesize},
      success:function(data){
        //console.log(data);
        $("tbody").html("");
        if(data == null){
          alert("网络错误");
          return;
        }
        var rows = data.Rows;
        var totalmoney =0;
        var totalawardmoney = 0;
        for(var j=0;j<rows.length;j++) {
          var row = rows[j];
          var tr = "<tr>" +
                  "<td>#"+row.bookcode+"/"+row.booktime+"</td>"+
                  "<td>"+row.bookperiod+"</td>"+
                  "<td>"+row.booktype+"</td>"+
                  "<td style='color:green;'>"+row.bookmoney+"</td>"+
                  "<td style='color:red;'>"+row.result+"</td>"+
                  "</tr>";
          totalmoney+= parseInt(row.bookmoney);
          totalawardmoney += parseFloat(row.result);

          $("tbody").append(tr);
        }
        var lastrow = "<tr><td></td><td>总计</td><td>"+rows.length+"笔</td>" +
                "<td style='color:green;'>"+totalmoney+"</td><td style='color:red;''>"+totalawardmoney+"</td>"+
                "</tr>";
        $("tbody").append(lastrow);
        $("#totalrows").text(data.totalrow);
        pageShow("pagination",data.totalpage,"loadPageData",data.pagenumber,pagesize);
      },
      error:function(err){}
    });
  }
</script>
</body>
</html>
