<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/11
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>侧边栏</title>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/sidebar.js"></script>
    <link href="css/siderbar.css" rel="stylesheet">
</head>
<body>
<!--这是侧边栏-->
<!--要不然这里写登录？-->
<div style="position: fixed;top: 50px;left: 0px;height: 75px;width: 100px;z-index: 9999" id="sidebar">
    <img id="sidebar_head_portrait" style="width: 100%;height: 100%;cursor: pointer;" src="img/sidebar_button.png">

</div>

<div class="greyCloth"></div>
<%!
    User user = null;
    boolean hasUser = false;
%>
<%
    if(session.getAttribute("User") != null)
    {
        user = (User) session.getAttribute("User");
        hasUser = true;
    }
    else
    {
        user = null;
        hasUser = false;
    }
%>

<%
    if(hasUser)
    {
%>
<%--<jsp:include page="UserInfo.jsp" flush="true">--%>
<%--<jsp:param name="i" value="${50}"/>--%>

<%--</jsp:include>--%>

<%@include file="UserInfo.jsp" %>
<%
    }
    else
    {
%>
<%--<jsp:include page="LoginAndRegister.jsp" flush="true" />--%>
<%@include file="LoginAndRegister.jsp" %>
<%
    }
%>
</body>
</html>
