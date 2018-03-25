<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/3/9
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag" uri="WEB-INF/tag.tld" %>
<html>
<head>
    <title>控制台AI</title>

    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>

    <link rel="stylesheet" href="css/ai.css"/>
    <script src="js/ai.js" type="text/javascript"></script>

</head>
<body>
<div id="AI_maindiv">
    <div id="AI_imgdiv">
    </div>
    <div id="AI_messagediv">
        <div id="AI_message_showdiv">
            <%
                if(hasUser)
                {
                    if(user.getUserPermission() == 500)
                    {
            %>
            <h3>欢迎回来~</h3>
            今天天气怎么样？<br>
            或许我之后会知道。<br>
            <%
                    }
                    else if(user.getUserPermission() == 495)
                    {
            %>
            <h3>正在获取紧急权限......</h3>
            很高兴见到你，<%=user.getDisplay()%><br>
            你已获取整个网站的控制权。<br>
             <%
                    }
                    else if(user.getUserPermission() == 16)
                    {
             %>
            <h3>管理员登录中......</h3>
            管理员，<%=user.getDisplay()%>，你的权限已经注册<br>
            需要我为你做些什么呢？<br>
            <%
                    }
                    else if(user.getUserPermission() == 1)
                    {
            %>
            <h3>读取用户数据......</h3>
            欢迎，<%=user.getDisplay()%><br>
            请问有什么需要帮助的？<br>
            <%
                    }
                }
                else
                {
            %>
            <h3>欢迎来到暮色的博客</h3>
            我是这里的临时管理者，<br>
            你有什么问题的话我或许可以解决。<br>
            <%
                }
            %>
        </div>
    </div>
    <div id="AI_inputdiv">
        <input type="button" value="打开任务管理模块" class="AI_input_button" id="AI_input_1">
        <input type="button" value="关闭AI" class="AI_input_button" id="AI_input_2">
        <input type="button" value="重新检索后台" class="AI_input_button" id="AI_input_3">
        <input type="button" value="测试按钮4" class="AI_input_button">
        <tag:UserPermission permissionList="<%= new int[]{500,495} %>" errorCode="1">
        <input type="button" value="切换至管理员后台" class="AI_input_button" id="AI_input_switch" onclick="window.location.href = 'Admin.jsp'">
        </tag:UserPermission>
        <%--<button id="AI_input_switch">切换至调试面板</button>--%>
    </div>
</div>
<script src="js/jquery.rotate.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.js" type="text/javascript"></script>
</body>
</html>
