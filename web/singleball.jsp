<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单球1~5</title>
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
      width:50px;
    }
  </style>
</head>
<body>
<table class="table table-bordered text-center">
  <thead>
    <tr>
      <td colspan="3">第一球</td>
      <td colspan="3">第二球</td>
      <td colspan="3">第三球</td>
      <td colspan="3">第四球</td>
      <td colspan="3">第五球</td>
    </tr>
    <tr>
      <script type="text/javascript">
        for(var i=0;i<5;i++) {
          var td = "<td><label>号</label></td>" +
                  "<td><label>赔率</label></td>" +
                  "<td><label>金额</label></td>";
          $("tr").eq(1).append(td);
        }
      </script>
    </tr>
  </thead>
  <tbody>
    <script type="text/javascript">
      /**生成下注表格*/
      for(var j=0;j<10;j++){
        var tr = "<tr>";
        for(var k=0;k<5;k++){
           tr +=    "<td><em class=\"awardBall\">"+j+"</em></td>"+
                    "<td><span>9</span></td>"+
                    "<td><input class=ball"+(k+1)+" name='"+j+"' type=\"text\" /></td>";//"|"+j+
        }
        tr+="</tr>";
        $("tbody").append(tr);
      }
    </script>
  </tbody>
</table>
  <div class="text-center">
    <button class="btn btn-danger">下注</button>
    <button class="btn btn-warning">重填</button>
  </div>
</body>
<script type="text/javascript">
  $(document).ready(function(){
    //显示倍率
    initPrice();

    $("input[type='text']").attr("maxlength",4);
    //重填
    $(".btn-warning").on("click",function(){
      $("input[type='text']").val("");
    });

    //下注
    $(".btn-danger").on("click",function(){

      var value="";
      var noticemsg="";
      var totalmoney = 0;
      var printstr ="";
      for(var i=1;i<6;i++){
        var temp ="{"+i+"|";
        var p="";
        $(".ball"+i).each(function(){
            if($(this).val() != ""){
              p += $(this).attr("name")+"-"+$(this).val()+",";
              totalmoney+= parseInt($(this).val());
              noticemsg +="第"+i+"球:"+$(this).attr("name")+"号 @ "+$(this).val()+"\r\n";
              printstr += "第"+i+"球:"+$(this).attr("name")+"号 @ "+$(this).val()+"<br/>";
            }
        });
        temp +=p + "}&";

        if(!(p == "")){
          value += temp;
        }
      }

     postData(noticemsg,totalmoney,value,printstr);

    });


  });
  //显示赔率
  function initPrice(){
    $.ajax({
      url:'/main/initPrice',
      type:'get',
      dataType:'json',
      success: function (data) {
        var beilv = data[16].multiple;
        $("span").html(beilv);
       },
      error:function(err){
        alert("页面初始化出错，请重新登录.");
        console.log(err.error());
      }
    });
  }



</script>
</html>
