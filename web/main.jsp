<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/12/12 0012
  Time: 下午 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="css/main.css">
    <title>操作页</title>

</head>
<body style="background-color: #ffffff;">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="left.jsp"></jsp:include>
  <div class="main-container col-sm-10">
          <jsp:include page="awardinfo.jsp"></jsp:include>
        <iframe name="right" id="main-container" height="150%" width="100%" frameborder="0" src="twoside.jsp" scrolling="no"></iframe>

  </div>
</body>
</html>
