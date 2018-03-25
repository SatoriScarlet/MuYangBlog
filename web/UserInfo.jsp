<%@ page import="com.muyang.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/3
  Time: 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>

    <link href="css/userinfo.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/userinfo.js" type="text/javascript"></script>
</head>



<body>
<div class="sidebar_mainDiv">
    <div class="sidebar_userinfo">
        <br>
        <br>
        <br>
        <%
            out.print("<div id=\"user_head_portrait\" style=\"width: 150px;height: 150px\"><img style=\"width: 100%;height: 100%\" src=\"img/head_portrait/" + user.getHeadPortrait() + ".jpg\"></div>");
        %>
        <br>
        <hr style="background-color: #1b1b1b;height: 1px;width: 80%;min-width: 200px;margin: 0px auto">
        <h2><%out.print(user.getDisplay());%></h2>
        <br>
        ID :
        <%
            out.print(user.getUserid());
        %>
        <br>
        <br>
        <br>
        <input type="button" value="登出" style="background-color: #a2311b;color: #FFFFFF;" id="loginout">
    </div>


</div>
</body>
</html>
