<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>两面盘</title>
  <script type="text/javascript" src="frame/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="frame/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="frame/js/postdata.js"></script>
  <script type="text/javascript" src="frame/js/inputlimit.js"></script>
  <link rel="stylesheet" href="frame/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/sGame.css">
</head>
<body>
  <!-- 单球买 -->
  <div id="balls" style="border-radius: 4px;width: 80%;">
    <!-- 第一球 -->
    <div class="panel">
      <div class="panel-heading">
          <div class="panel-title">
            <p class="text-center" style="margin: 0px;">第一球</p>
          </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
          <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball1">
            <tr>
              <td><label name="description">大</label></td>
              <td><label class=" sprice" style="color: red;">1.9</label></td>
              <td><input type="text"  onkeyup="digitOnly(this)"/></td>
              <td><label name="description">小</label></td>
              <td><label class=" sprice" style="color: red;">1.9</label></td>
              <td><input type="text"  onkeyup="digitOnly(this)"/></td>
              <td><label name="description">单</label></td>
              <td><label class=" sprice" style="color: red;">1.9</label></td>
              <td><input type="text"  onkeyup="digitOnly(this)"/></td>
              <td><label name="description">双</label></td>
              <td><label class=" sprice" style="color: red;">1.9</label></td>
              <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            </tr>
          </table>
      </div>
    </div>

    <!-- 第二球 -->
    <div class="panel">
      <div class="panel-heading">
        <div class="panel-title">
          <p class="text-center" style="margin: 0px;">第二球</p>
        </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
        <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball2">
          <tr>
            <td><label name="description">大</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">小</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">单</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">双</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
        </table>
      </div>
    </div>

    <!-- 第三球 -->
    <div class="panel">
      <div class="panel-heading">
        <div class="panel-title">
          <p class="text-center" style="margin: 0px;">第三球</p>
        </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
        <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball3">
          <tr>
            <td><label name="description">大</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">小</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">单</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label class=" " name="description">双</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
        </table>
      </div>
    </div>

    <!-- 第四球 -->
    <div class="panel">
      <div class="panel-heading">
        <div class="panel-title">
          <p class="text-center" style="margin: 0px;">第四球</p>
        </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
        <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball4">
          <tr>
            <td><label name="description">大</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">小</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">单</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">双</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
        </table>
      </div>
    </div>
    <!-- 第五球 -->
    <div class="panel">
      <div class="panel-heading">
        <div class="panel-title">
          <p class="text-center" style="margin: 0px;">第五球</p>
        </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
        <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball5">
          <tr>
            <td><label name="description">大</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">小</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">单</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">双</label></td>
            <td><label class=" sprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
        </table>
      </div>
    </div>
    <!-- 总和 -->
    <div class="panel">
      <div class="panel-heading">
        <div class="panel-title">
          <p class="text-center" style="margin: 0px;">总和</p>
        </div>
      </div><!-- heading -->
      <div class="panel-body" style="padding: 0px;">
        <table class="table table-bordered text-center" style="margin-bottom: 0px;" id="ball6">
          <tr>
            <td><label name="description">总和大</label></td>
            <td><label class=" tprice" style="color: red;">1.9</label></td>
           <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">总和小</label></td>
            <td><label class=" tprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label class=" " name="description">总和单</label></td>
            <td><label class=" tprice" style="color: red;">1.9</label></td>
           <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">总和双</label></td>
            <td><label class=" tprice" style="color: red;">1.9</label></td>
            <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
          <tr>
            <td><label name="description">龙</label></td>
            <td><label class=" long" style="color: red;">1.9</label></td>
     <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">虎</label></td>
            <td><label class=" hu" style="color: red;">1.9</label></td>
             <td><input type="text"  onkeyup="digitOnly(this)"/></td>
            <td><label name="description">和</label></td>
            <td><label class=" he" style="color: red;">9.3</label></td>
             <td><input type="text"  onkeyup="digitOnly(this)"/></td>
          </tr>
        </table>
      </div>
    </div>
    <div class="text-center">
      <button id="startbook" class="inputs ti">下注</button>
      <button id="reset" class="inputs ti">重填</button>
    </div>
  </div><!-- balls -->
  <script type="text/javascript">
    $(document).ready(function(){
      $("input[type='text']").attr("maxlength",4);
        initPrice();
        //重置
        $("#reset").on("click",function(){
          $("input").val("");
        });

        //下注
         $("#startbook").on("click",function(){

           var noticeMsg = "";
           var totalmoney = 0;
           var printstr = "";
           var data="";
              for(var i=1;i<=6;i++){
                if(i < 6)
                var temp ="第"+i+"球:";
                else
                var temp ="总和:";
                //第几球，第多少号
                var book ="{"+i+"|";

                var notnullnumber = 0;
                $("#ball"+i +" :text").each(function(){
                    if($(this).val() != ""){
                          notnullnumber++;
                          var booktype = $(this).parent("td").prev().prev().find("label").text();
                          var multipel = $(this).parent("td").prev().find("label").text();
                          var bookmount = $(this).val();
                          book+=booktype+"-"+bookmount+",";
                          temp += booktype+"@"+bookmount+",";
                          totalmoney += parseInt(bookmount);
                           printstr +=booktype+"@"+bookmount+"<br/>";
                    }
                });
                book+="}&";
                temp+="\r\n";
                if(notnullnumber >0) {
                  data += book;  //订单格式 {第几号球|类型-金额},
                  noticeMsg += temp;
                }
              }
             // console.log(data);
             // console.log(noticeMsg);

              postData(noticeMsg,totalmoney,data,printstr);

         });
    });


    //显示赔率
    function initPrice(){
      $.ajax({
        url:'/main/initPrice',
        type:'get',
        dataType:'json',
        success: function (data) {
            for(var i=0;i<data.length;i++){
              var multipleme = data[i];
              $("label[name='description']").each(function(){
                if($(this).text() == multipleme.type){
                  $(this).parent("td").next().children('label').text(multipleme.multiple);
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
</body>
</html>
