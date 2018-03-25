<%@ page import="com.muyang.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>暮色森林的狼's博客</title>

    <!--JQuery相关资源-->
    <%--<link href="css/fullpage.css" rel="stylesheet">--%>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <!--AzUI相关资源-->
    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>
    <!-- UM相关资源 -->
    <link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="umeditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.js"></script>
    <script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
    <!--自写相关资源-->
    <link href="css/index.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/index.js"></script>
    <%--<script type="text/javascript" src="js/DivEffects.js"></script>--%>
    <%--<script type="text/javascript" src="js/slidemenu.js"></script>--%>
    <link href="css/slidemenu.css" type="text/css" rel="stylesheet">


    <%--<%@include file="AddJs.jsp"%>--%>
</head>
<body>


<%@include file="PopupMessage.jsp" %>

<%@include file="Sidebar.jsp"%>


<%--<div class="header">--%>
    <%--<div class="am-g">--%>
        <%--<p class="title">搭&nbsp&nbsp建&nbsp&nbsp区</p>--%>
        <%--<p>副标题就写这</p>--%>
    <%--</div>--%>
    <%--<hr />--%>
<%--</div>--%>
<div id="index_backgroup">
    <div id="index_head_portrait">
        <%
            int HeadPortrait = 0;
            if(hasUser)
            {
                HeadPortrait = user.getHeadPortrait();
            }
            out.print("<img style=\"width: 100%;height: 100%\" src=\"img/head_portrait/" + HeadPortrait + ".jpg\">");
        %>
    </div>
    <div id="index_blog_name">
        <p style="font-size: 1em;text-decoration : underline;">点击头像可获取更多信息</p>
        <%
            if (!hasUser)
            {
        %>
        <p style="font-size: 2em">暮&nbsp&nbsp色&nbsp&nbsp森&nbsp&nbsp林</p>
        <p style="font-size: 1em">一个毫无意义的<span style="font-size: 2em">个人博客</span></p>
        <p>话说你怎么进来的？</p>
        <p>既然进来了的话......</p>
        <p><s>不如<span style="font-size: 2em;cursor: pointer;" class="shortcut_register">注册个账号</span>试试？</s></p>
        <p>整个博客都在施工中，所以目前一片混乱</p>
        <%
            }
            else
            {
        %>
        <p style="font-size: 3em">欢迎~ ヾ(@^▽^@)></p>
        <p style="font-size: 2em"><%= user.getDisplay()%></p>
        <p> 接下来你想做什么？</p>
        <%
            }
        %>


    </div>
    <div id="index_bottombar_mainDiv">
        <div class="divButton DE_MouseEnter DE_OverTurn" id="index_1">
        <div class="mainButton" name="0" onclick="window.location.href = 'IntroduceMyself.jsp'">关于我</div>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
        </div>
        <div class="divButton DE_MouseEnter DE_OverTurn" id="index_2">
        <div class="mainButton" name="1" onclick="window.location.href = 'BlogProjectList'">个人项目</div>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
        </div>
        <div class="divButton DE_MouseEnter DE_OverTurn" id="index_3" onclick="window.location.href = 'Diary.jsp'">
        <div class="mainButton" name="2">摸鱼日志</div>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
        </div>
        <%--DE_MouseEnter DE_OverTurn--%>
        <div class="divButton DE_MouseEnter DE_OverTurn" id="index_4" onclick="">
        <div class="mainButton" name="3">天顶星科技</div>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
        <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
            <%--<div class="littleButton"></div>--%>
        </div>
    </div>
</div>
<%--<div id="project_region">--%>

<%--</div>--%>




<%--<div class="am-g" style="height: 800px;background-color: #cc0900">--%>
    <%--&lt;%&ndash;<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">&ndash;%&gt;--%>

        <%--&lt;%&ndash;<ul class="am-avg-sm-1 am-avg-md-2 am-avg-lg-2 am-thumbnails">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="titleLi">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="am-thumbnail divButton">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="mainButton" name="0">个人项目</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<li class="titleLi" >&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="am-thumbnail divButton">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="mainButton" name="1">日志</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="titleLi" >&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="am-thumbnail divButton">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="mainButton" name="2">天顶星科技</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="titleLi" >&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="am-thumbnail divButton">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="mainButton" name="3">空白区</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="littleButton"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>


        <%--<!--<h3>登录</h3>-->--%>
        <%--<!--<hr>-->--%>
        <%--<!--<div class="am-btn-group">-->--%>
            <%--<!--<a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a>-->--%>
            <%--<!--<a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a>-->--%>
            <%--<!--<a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a>-->--%>
        <%--<!--</div>-->--%>
        <%--<!--<br>-->--%>
        <%--<!--<br>-->--%>

        <%--<!--<form method="post" class="am-form">-->--%>
            <%--<!--<label for="email">邮箱:</label>-->--%>
            <%--<!--<input type="email" name="" id="email" value="">-->--%>
            <%--<!--<br>-->--%>
            <%--<!--<label for="password">密码:</label>-->--%>
            <%--<!--<input type="password" name="" id="password" value="">-->--%>
            <%--<!--<br>-->--%>
            <%--<!--<label for="remember-me">-->--%>
                <%--<!--<input id="remember-me" type="checkbox">-->--%>
                <%--<!--记住密码-->--%>
            <%--<!--</label>-->--%>
            <%--<!--<br />-->--%>
            <%--<!--<div class="am-cf">-->--%>
                <%--<!--<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">-->--%>
                <%--<!--<input type="submit" name="" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">-->--%>
            <%--<!--</div>-->--%>
        <%--<!--</form>-->--%>
        <%--<!--<hr>-->--%>
        <%--<!--<p>© 2014 AllMobilize, Inc. Licensed under MIT license.</p>-->--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--</div>--%>


<!--没有使用网格的内容-->
<!--<div class="am-container" style="background-color: #aaacac" id="mainPlane">-->
    <!--<p style="font-size: 50px;width: 300px;text-align: center" class="am-serif am-u-sm-3 am-u-sm-centered">搭&nbsp&nbsp建&nbsp&nbsp区</p>-->
<!--</div>-->

<!--<div class="am-g am-g-fixed">-->
    <!--<script type="text/plain" id="myEditor"></script>-->
    <!--<input type="button" value="发送" id="sendButton">-->
<!--</div>-->


    <!--<script type="text/javascript">-->
        <!--var um = UM.getEditor('myEditor');-->
    <!--</script>-->

<script src="js/jquery.rotate.min.js" type="text/javascript"></script>
<script src="js/jquery-shadow.js" type="text/javascript"></script>
</body>
</html>