<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>N号球</title>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="frame/js/postdata.js"></script>
  <link rel="stylesheet" href="frame/css/bootstrap.min.css">
  <link href="css/ball.css" rel="stylesheet" />
  <style type="text/css">
    span{
      color:red;
      font-weight: bold;
      font-family: Helvetica;
    }
    input{
      width: 50px;
    }
    thead{
      background:#f7ecb5;
    }
  </style>
</head>
<body>
<table class="table table-bordered text-center" id="singleball">
  <thead>
    <tr>
      <script type="text/javascript">
        for(var i=0;i<5;i++) {
          var td = "  <td>号</td><td>赔率</td> <td>金额</td>";
           $("tr").eq(0).append(td);
        }
      </script>
    </tr>
  </thead>
    <tbody>
        <script type="text/javascript">
          var k=0;
          for(var i=0;i<2;i++){
            var tr ="<tr>";
            for(var j=1;j<=5;j++){
              tr+="<td><em class=\"awardBall\">"+k+"</em></td>"+
                   "<td><span class='singlenumber''>9</span>"+
                   "<td><input type='text' name='"+k+"' style='width: 50px;'/> </td>";
              k=k+1;
            }
            tr+"</tr>";
            $("tbody").append(tr);
          }
        </script>
    </tbody>
</table>

<!--单求 -->
<table class="table table-bordered text-center" style="margin-bottom: 0px;" id="singleballdan">
  <tr>
    <td><label  name="description">大</label></td>
    <td><span class="sprice">1.9</span></td>
    <td><input type="text" /></td>
    <td><label  name="description">小</label></td>
    <td><span class="sprice">1.9</span></td>
    <td><input type="text" /></td>
    <td><label  name="description">单</label></td>
    <td><span class="sprice">1.9</span></td>
    <td><input type="text" /></td>
    <td><label name="description">双</label></td>
    <td><span class="sprice">1.9</span></td>
    <td><input type="text" /></td>
  </tr>
</table>
<!-- 总和 -->
<table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball6">
  <tr>
    <td><label name="description">总和大</label></td>
    <td><span class="tprice">1.9</span></td>
    <td><input type="text"/></td>
    <td><label  name="description">总和小</label></td>
    <td><span class=" tprice">1.9</span></td>
    <td><input type="text" /></td>
    <td><label class=" " name="description">总和单</label></td>
    <td><span class=" tprice">1.9</span></td>
    <td><input type="text"/></td>
    <td><label  name="description">总和双</label></td>
    <td><span class=" tprice">1.9</span></td>
    <td><input type="text" /></td>
  </tr>
  <tr>
    <td><label  name="description">龙</label></td>
    <td><span class=" long">1.9</span></td>
    <td><input type="text" /></td>
    <td><label  name="description">虎</label></td>
    <td><span class=" hu" >1.9</span></td>
    <td><input type="text" /></td>
    <td><label  name="description">和</label></td>
    <td><span class=" he">9.3</span></td>
    <td><input type="text" /></td>
  </tr>
</table>
<!-- 三球 前三-->
<table class="table table-bordered text-center" id="ball7">
  <thead>
    <tr><td colspan="15">前三</td></tr>
  </thead>
    <tr>
      <td><label name="description">豹子</label></td>
      <td><span class="baozi">70</span></td>
      <td><input type="text" /></td>
      <td><label name="description">顺子</label></td>
      <td><span class="baozi">70</span></td>
      <td><input type="text" /></td>
      <td><label name="description">对子</label></td>
      <td><span class="baozi">70</span></td>
      <td><input type="text" /></td>
      <td><label name="description">半顺</label></td>
      <td><span class="baozi">70</span></td>
      <td><input type="text" /></td>
      <td><label name="description">杂六</label></td>
      <td><span class="baozi">70</span></td>
      <td><input type="text" /></td>
    </tr>
</table>
<!--中三-->
<table class="table table-bordered text-center" id="ball8">
  <thead>
  <tr><td colspan="15">中三</td></tr>
  </thead>
  <tr>
    <td><label name="description">豹子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">顺子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">对子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">半顺</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">杂六</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
  </tr>
</table>
<!--后三-->
<table class="table table-bordered text-center" id="ball9">
  <thead>
  <tr><td colspan="15">后三</td></tr>
  </thead>
  <tr>
    <td><label name="description">豹子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">顺子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">对子</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">半顺</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
    <td><label name="description">杂六</label></td>
    <td><span class="baozi">70</span></td>
    <td><input type="text" /></td>
  </tr>
</table>
<div class="text-center">
  <button class="btn btn-danger">下注</button>
  <button class="btn btn-warning">重填</button>
</div>
<div id="printweb" hidden="hidden"></div>
</body>
<script type="text/javascript">
  $(document).ready(function(){
    initPrice();
    //重填
    $(".btn-warning").on("click",function(){
      $("input[type='text']").val("");
    });
    //设置最大输入个数
    $("input[type='text']").attr("maxlength",4);


    //提交订单
    $(".btn-danger").on("click",function(){
        var ballcode = 0;
        //第几球
          var ballnumber = $(".bookType",parent.document).text();
          if(ballnumber == "第一球"){
            ballcode = 1;
          }else if(ballnumber =="第二球"){
            ballcode =2 ;
          }else if(ballnumber == "第三球"){
            ballcode = 3;
          }else if(ballnumber == "第四球"){
            ballcode = 4;
          }else{
            ballcode == 5;
          }

        var printmessage = "";//显示的消息
        var printwebcontent ="";
        var totalmoney = 0;
        var value = "";
        var singleballvalue ="{"+ballcode+"|";
        //获取单球号码
        $("#singleball tbody").find(":text").each(function(){
            if($(this).val() != ""){
              singleballvalue += $(this).attr("name")+"-"+$(this).val()+",";
              printmessage+=ballnumber+":"+$(this).attr("name")+"号 @ "+$(this).val()+".00元\r\n";
              printwebcontent += ballnumber+":"+$(this).attr("name")+"号 @ "+$(this).val()+"<br/>";
              totalmoney+=parseInt($(this).val());
            }
        });


        //大小单双
        $("#singleballdan tbody").find(":text").each(function(){
          if($(this).val() != ""){
            var booktype = $(this).parent("td").prev().prev().find("label").text();
            singleballvalue += booktype+"-"+$(this).val()+",";
            printmessage +=booktype+"@"+$(this).val()+".00元\r\n";
            printwebcontent+=booktype+"@"+$(this).val()+".00元</br>";
            totalmoney+=parseInt($(this).val());
          }
            });
      singleballvalue+="}&";

        if(singleballvalue != "{"+ballcode+"|}&"){
          value+=singleballvalue;
        }

      //总大小单双  龙虎和
      for(var j=6;j<10;j++) {
        var llh = "{"+j+"|";
        $("#ball"+j+" tbody").find(":text").each(function () {
          if ($(this).val() != "") {
            var booktype = $(this).parent("td").prev().prev().find("label").text();
            llh += booktype + "-" + $(this).val() + ",";
            printmessage+=booktype+"@"+$(this).val()+".00元\r\n";
            printwebcontent +=booktype+"@"+$(this).val()+".00元<br/>";
            totalmoney+=parseInt($(this).val());
          }
        });
        llh += "}&";
        if (llh != "{" + j + "|}&") {
          value += llh;
        }
      }

        printwebcontent+="总计:"+totalmoney+".00元";
      //提交订单
      value = value.substr(0,value.length-1);
      console.log(value);
      postData(printmessage,totalmoney,value,printwebcontent);
    });
  });


  //显示赔率
  function initPrice(){
    $.ajax({
      url:'/main/initPrice',
      type:'get',
      dataType:'json',
      success: function (data) {
        //单球买号
          $(".singlenumber").html(data[16].multiple);
        //单球大小
        for(var i=0;i<data.length;i++){
          var multipleme = data[i];
          $("label[name='description']").each(function(){
            if($(this).text() == multipleme.type){
              $(this).parent("td").next().children('span').text(multipleme.multiple);
            }
          });
        }
      },
      error:function(err){
        alert("页面初始化出错，请重新登录.");
        console.log(err.error());
      }
    });
  }

</script>
</html>
