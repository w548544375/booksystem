<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/16 0016
  Time: 上午 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
  <link href="css/ball.css" rel="stylesheet" />
</head>
<body>
<div class="well well-lg">
  <div class="row">
    <div class="col-sm-2">
      <span class="text-left">重庆时时彩</span>
    </div>
    <div class="col-sm-4">
      <span style="color: red;">今天输赢:</span>
      <label style="color: red;">0.0</label>
    </div>
    <div class="col-sm-5">
      <span >第<strong class="lastperiod" style="color:red;"></strong>期开奖号码:</span>
          <span id="awardNumber">
            <em class="awardBall">?</em>
            <em class="awardBall">?</em>
             <em class="awardBall">?</em>
             <em class="awardBall">?</em>
             <em class="awardBall">?</em>
          </span>
    </div>
  </div>
  <!-- 第二排 -->
  <div class="row">
    <div class="col-sm-2">
      <span class="text-left"><strong class="curentperiod" style="color:green;"></strong></span>
      <label>期</label>
    </div>
    <div class="col-sm-3">
      <span style="color: blue;"><strong class="bookType"></strong></span>
    </div>
    <div class="col-sm-3">
      <label>距离封盘：</label><label id="lefttime"></label>
    </div>
    <div class="col-sm-3">
      <label>距离开奖:</label><label id="awardtime"></label>
    </div>
  <%--  <div class="col-sm-1">
      <label class="text-right">86秒</label>
    </div>--%>
  </div>
</div>
<script type="text/javascript">

  var curentLeftTime;
  var awardSecondsLeft;
  var awardSecondsOne;
  var awardSecondsTwo;
  var awardInterval;
  var leftInterval;
  $(document).ready(function(){
    //awardInterval=window.clearInterval(awardInterval);
    //leftInterval=window.clearInterval(leftInterval);
    firstRequest();
  });


  function secondRequest(period){
    $.ajax({
      url:'secondRequest',
      data:{"period":period},
      type:'get',
      success:function (data){
        console.log(data);
        if(data.status == -2){
          /**没有开奖的时候间隔2秒再次拉取数据*/
          setTimeout("secondRequest("+period+")",2000);
        }else{
         // awardInterval=window.clearInterval(awardInterval);
          $("#awardtime").html("00:00");
          /**获得开奖号码之后，要把拉去数据的时间置0*/
          awardSecondsTwo = 0;
          var numbers = data.winningNumber.split(" ");
          for(var number in numbers){
            //设置显示号码
           $(".awardBall").eq(number).html(numbers[number]);
          }
        }
      }
    });
  }

  //============获取开奖时间信息==============================================================
  function firstRequest()
  {
    $.ajax({
      url:'firstRequest',
      type:'get',
      dataType:'json',
      success:successFunc
    });
  }

  function successFunc(data){
   // $("#has").html(data.hasPeriodNum);
    //显示前一期
    $(".lastperiod").html(data.previousPeriod);
    //显示当前期
    $(".curentperiod").html(data.currentPeriod);
    curentLeftTime = data.secondsLeft;
   // leftInterval=setInterval("decreaseAwardTime();",1000);
    decreaseAwardTime();
    if(data.awardSecondsLeft == 0){
      /**上一期已经开奖*/
      secondRequest(data.previousPeriod);
      $("#awardtime").html("等待开奖");

     /* ("#awardNumber").find("em").each(function(){
          $(this).html("?");
      });*/
     // awardInterval=window.clearInterval(awardInterval);
    }else{
      /**上一期还未开奖*/
      awardSecondsLeft = data.awardSecondsLeft;//总共剩余开奖时间
      awardSecondsOne  = data.awardSecondsOne; //开奖倒计时
      awardSecondsTwo = data.awardSecondsTwo;  //开奖拉去数据时间
      for(var i=0;i<5;i++){
        $(".awardBall").html("?");
      }
      decreaseKai();

      //awardInterval = setInterval("decreaseKai();",1000);
      setTimeout("secondRequest("+data.previousPeriod+");",awardSecondsLeft);
    }
  }
  //============================================================================

  function formatTime(number){
    if(number < 0){
      return "00:00";
    }
    var minutes =Math.floor(number/(1000*60));
    var seconds = Math.floor((number/1000)%60);
    var minu = minutes > 9 ? minutes : "0"+minutes;
    var second = seconds > 9 ? seconds : "0"+seconds;
    return minu+":"+second;
  }

  function decreaseAwardTime(){
    if(curentLeftTime < 1000){
      //leftInterval=window.clearInterval(leftInterval);
      firstRequest();
      return;
    }
    curentLeftTime = curentLeftTime - 1000;
    $("#lefttime").html(formatTime(curentLeftTime));
    //console.log(curentLeftTime);
    //禁用所有input
    $(window.frames["right"].document).find(":text").each(function(){
      if($(this).attr("disabled")){
        $(this).val("");
        $(this).attr("disabled",false);
      }
    });
    setTimeout(decreaseAwardTime,999);
  }

//开奖时间倒计时
  function decreaseKai(){
    if(awardSecondsLeft > 0){
      $("#awardtime").html(formatTime(awardSecondsLeft));
      //console.log(curentLeftTime);
      awardSecondsLeft = awardSecondsLeft - 1000;
      setTimeout(decreaseKai,999);
      //禁用所有input
      $(window.frames["right"].document).find(":text").each(function(){
        if(!$(this).attr("disabled")){
          $(this).val("封盘");
          $(this).attr("disabled",true);
        }
      });
    }else{
      $("#awardtime").html("获取数据.."+formatTime(awardSecondsTwo));
      awardSecondsTwo = awardSecondsTwo -1000;
      if(awardSecondsTwo <0){
        $("#awardtime").html("等待下一期开奖");
      }
      setTimeout(decreaseKai,999);
    }

  }

</script>
</body>
</html>
