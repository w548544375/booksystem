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
    <title>两周报表</title>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="frame/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/sGame.css">
  <link rel="stylesheet" href="css/main.css">
</head>
<body style="background-color: #ffffff;">
<div class="col-sm-10">
  <div class="table-responsive">
    <table class="table table-bordered text-center" id="lastweek">
        <thead>
          <tr class="info">
            <th  class="headback table-td" style="padding: 4px;">交易日期</th>
            <th class="headback table-td" style="padding: 4px;">订单笔数</th>
            <th class="headback table-td" style="padding: 4px;">下注金额</th>
            <th class="headback table-td" style="padding: 4px;">输赢结果</th>
            <th class="headback table-td" style="padding: 4px;">退水</th>
            <th class="headback table-td" style="padding: 4px;">退水结果</th>
          </tr>
        </thead>
      <tbody>

      </tbody>
    </table>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered text-center" id="curentweek">
      <thead>
      <tr class="info">
        <th  class="headback table-td" style="padding: 4px;">交易日期</th>
        <th class="headback table-td" style="padding: 4px;">订单笔数</th>
        <th class="headback table-td" style="padding: 4px;">下注金额</th>
        <th class="headback table-td" style="padding: 4px;">输赢结果</th>
        <th class="headback table-td" style="padding: 4px;">退水</th>
        <th class="headback table-td" style="padding: 4px;">退水结果</th>
      </tr>
      </thead>
      <tbody>

      </tbody>
    </table>
  </div>
  </div>
<script type="text/javascript">
  $(document).ready(function(){
    tableData("lastweek",1);
    tableData("curentweek",0);
  });

  function tableData(tableId,week){
    $.ajax({
      url:'/main/weekRecord',
      data:{'week':week},
      type:'post',
      success:function(data){
        var totalcount = 0;
        var totalbookmoney = 0;
        var totalresult = 0;
        var totalback = 0;
        var totalbackresult = 0;
        for(var key in data){
            var values = data[key];

            var tr = "<tr><td>"+key+"</td><td>"+values['daybookcount']+"</td><td>"+values['daymoney']+"</td><td>"+values['dayresult']+"</td><td>"+values['dayback']+"</td><td>"+values['daybackresult']+"</td></tr>";
            totalcount += parseInt(values['daybookcount']);
            totalbookmoney+= parseFloat(values['daymoney']);
            totalresult += parseFloat(values['dayresult']);
            totalback += parseFloat(values['dayback']);
            totalbackresult+=parseFloat(values['daybackresult']);
            $("#"+tableId+" tbody").append(tr);
        }
        var total = "<tr class=\"danger\"><td class=\"text-right\">总计</td><td>"+totalcount+"</td><td>"+totalbookmoney+"</td><td>"+totalresult+"</td><td>"+totalback+"</td><td>"+totalbackresult+"</td></tr>";
          $("#"+tableId+" tbody").append(total);
      }
    });
  }

</script>
</body>
</html>
