<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>游戏规则</title>
  <link rel="stylesheet" href="css/main.css">
</head>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="left.jsp"></jsp:include>
<div class="main-container col-sm-10">
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h3 class="panel-title">游戏规则</h3>
    </div>
  </div>
  <div class="panel-body">
    <p>一、大（5、6、7、8、9 ） 小（0、1、2、3、4 )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>1.9</strong>倍</p>
    <p>二、单（1、3、5、7、9 ） 双（0、2、4、6、8 ）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>1.9</strong>倍</p>
    <p>三、总和大23（含23）以上，总和小22（含22）以下&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>1.9</strong>倍</p>
    <p>四、总和为单数，总和为双数 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>1.9</strong>倍</p>
    <p>五、单卖任意位数上的（0――9）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 赔率<strong>9</strong>倍</p>
    <p>六、龙（第一球大于第五球），虎（第一球小于第五球）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>1.9</strong>倍</p>
    <p>七、和（第一球和第五球的数字相同 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 赔率<strong>9</strong>倍</p>
    <p>八、豹子分为前豹子（前三位数字相同）、中豹（中间三位数相同）、后豹（后三位数字相同）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>70</strong>倍</p>
    <p>九、顺子分为前顺（前三位数字相连）、中顺（中间三位数相连）、后顺（后三位数相连）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>14</strong>倍</p>
    <p>十、对子分为前对（前三位数字任意两位数字相同）、中对（中间三位数字任意两位数字相同）
    <p>、后对（后三位数字任意两位数字相同&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 赔率<strong>3</strong>倍</p>
    <p>十一、半顺分为前半顺（前三位数字任意两位数相连）、中半顺（中间三位数字任意两位数相连）
    <p>、后半顺（后三位数字任意两位数相连）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;赔率<strong>3</strong>倍</p>

    <h4><b>温馨提示:</b></h4>
    <p>1.豹子不做为对子，顺子不做为半顺。</p>
    <p>2.顺子不看位置如:231、978都做为顺子。</p>
    <p>3.半顺不看位置如：182、746都做为半顺。</p>
    <p>4.杂六即不是豹子、顺子、半顺、对子、如159、759。</p>
  </div>
</div>
</body>
</html>
