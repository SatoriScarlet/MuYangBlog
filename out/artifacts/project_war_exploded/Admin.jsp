<%@ page import="com.muyang.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/25
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag" uri="WEB-INF/tag.tld" %>
<html>
<head>
    <title>管理员页面</title>

    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>

    <link rel="stylesheet" href="css/admin.css"/>
    <script src="js/admin.js" type="text/javascript"></script>
</head>
<body>
    <tag:UserPermission permissionList="<%= new int[]{500,495,16} %>" errorCode="2">
    </tag:UserPermission>




    <%@include file="Header.jsp"%>
    <%@include file="Sidebar.jsp"%>
    <%@include file="PopupMessage.jsp"%>
    <%@include file="AI.jsp"%>

    <div id="boot_animation">
        <div class="boot_animation_message boot_animation_next_message">

        </div>
        <div class="boot_animation_message">
            —————唤醒O5成员—————
        </div>
        <div class="boot_animation_message">
            ————启动TT2加速协议————
        </div>
        <div class="boot_animation_message">
            ————注射RX-8咖啡因————
        </div>
        <div class="boot_animation_message">
            ————封装失效性异常————
        </div>
        <div class="boot_animation_message">
            ———检查第二、第三发电机———
        </div>
        <div class="boot_animation_message">
            ——无关人员进行B级记忆消除——
        </div>
        <div class="boot_animation_message">
            ——“落锤”机动特遣队已部署——
        </div>
        <div class="boot_animation_message">
            ————Size安保等级升级————
        </div>
        <div class="boot_animation_message">
            ——“SCP-2000”预热——
        </div>
        <div class="boot_animation_message">
            —————欢迎回来：<%= user.getDisplay() %>—————
        </div>
    </div>


    <div id="admin_control_panel">

    </div>


    <script>

        //启动动画
        <%

        boolean isPlayAdminAnimate = false;

        Cookie[] cookieslist = request.getCookies();

        for(Cookie cookie:cookieslist)
            {
                if(cookie.getName().equals("PlayAdminAnimate") && cookie.getValue().equals("1"))
                    {
                        isPlayAdminAnimate = true;
                    }
            }

        if(isPlayAdminAnimate)
            {
        %>
        //直接启动AI
        open_AI();
        <%
            }
        else
            {
        %>
        //直接启动动画
        admin_boot_animation();
        <%
            Cookie cookie_temp = new Cookie("PlayAdminAnimate","1");
            System.out.println("今日后台检查已经完成");
            response.addCookie(cookie_temp);
            }
        %>
    </script>


</body>
</html>
