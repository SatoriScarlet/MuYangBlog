<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/8
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头部区域</title>

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/header.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/header.css">

</head>
<body>
    <div id="header_mainDiv">
        <ul id="header_menuBar">
            <li class="header_delimiter">
                |
            </li>
            <li class="header_menuItem" onclick="window.location.href = 'Index.jsp'">
                主页
            </li>
            <li class="header_delimiter">
                |
            </li>
            <li class="header_menuItem" onclick="window.location.href = 'IntroduceMyself.jsp'">
                关于我
            </li>
            <li class="header_delimiter">
                |
            </li>
            <li class="header_menuItem" onclick="window.location.href = 'BlogProjectList'">
                    个人项目
                <%--<ul class="header_menuList">--%>
                    <%--<li class="header_meneSingle" onclick="window.location.href = 'IndividualProject.jsp'">--%>
                        <%--Power--%>
                    <%--</li>--%>
                    <%--<li class="header_meneSingle" onclick="window.location.href = 'IndividualProject.jsp'">--%>
                        <%--Boom--%>
                    <%--</li>--%>
                    <%--<li class="header_meneSingle" onclick="window.location.href = 'IndividualProject.jsp'">--%>
                        <%--Full--%>
                    <%--</li>--%>
                <%--</ul>--%>

            </li>
            <li class="header_delimiter">
                |
            </li>
            <li class="header_menuItem" onclick="window.location.href = 'Diary.jsp'">
                    摸鱼日志
            </li>
            <li class="header_delimiter">
                |
            </li>
            <li class="header_menuItem">
                    有顶天科技
            </li>
            <li class="header_delimiter">
                |
            </li>
        </ul>
    </div>
    <div class="header_placeholder">
    </div>

</body>
</html>
