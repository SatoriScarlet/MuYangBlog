<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/3
  Time: 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录和注册</title>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link href="css/login.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div class="sidebar_mainDiv">
        <div class="login_Circle_Input" id="loginCircleInput">
            登&nbsp&nbsp&nbsp录
        </div>
        <div class="login_Circle_Input" id="registerCircleInput">
            注&nbsp&nbsp&nbsp册
        </div>



    <div class="sidebar_component" id="loginComponent">
        <form action="UserLogin" method="post">
            <br>
            <p style="font-size: 30px">登录：</p>
            <p>用户名</p>
            <p>
                <input type="text" name="login_user" id="login_user" class="login_input">
            <p class="login_message" id="login_user_message">用户名不能为空！你是⑨嘛？</p>
            </p>
            <br>
            <p>密码</p>
            <p>
                <input type="password" name="login_passwd" id="login_passwd" class="login_input">
            <p class="login_message"  id="login_passwd_message">密码真的真的不能为空啊！</p>
            </p>
            <br><br><br>
            <p>
                <input type="button" value="登录" id="login_submit" class="login_button">
            </p>
            <p>
                <input type="reset" value="重写" class="login_button">
            </p>
            <p>
                <input type="reset" value="前往注册" class="login_button" id="login_to_register">
            </p>
        </form>
    </div>


    <div class="sidebar_component" id="registerComponent">
        <form action="UserRegister" method="post">
            <br>
            <p style="font-size: 30px">注册：</p>
            <p>用户名</p>
            <p>
                <input type="text" name="register_user" id="register_user" class="login_input">
            <p class="login_message" id="register_user_message">用户名不能为空！你是⑨嘛？</p>
            </p>
            <br>
            <p>密码</p>
            <p>
                <input type="password" name="register_passwd" id="register_passwd" class="login_input">
            <p class="login_message"  id="register_passwd_message">密码真的真的不能为空啊！</p>
            </p>
            <br>
            <p>确认密码</p>
            <p>
                <input type="password" name="register_passwd_repeat" id="register_passwd_repeat" class="login_input">
            <p class="login_message"  id="register_passwd_repeat_message">输两次密码你是怎么做到不一样的？？？</p>
            </p>
            <br>
            <p>昵称</p>
            <p>
                <input type="text" name="register_displayer" id="register_displayer" class="login_input">
            <p class="login_message"  id="register_displayer_message">取个有趣点的名字吧~</p>
            <br>
            <p>选择头像</p>
            <p>
                <select name="head_portrait" id="head_portrait" class="login_input">
                    <%
                        int temp_i = 1;

                    %>
                    <%
                        while(temp_i <= 34)
                        {
                            %>
                            <option value="<%=temp_i%>">头像<%=temp_i%></option>
                            <%
                            ++temp_i;
                        }

                    %>
                </select>
                <br><br><br>
            <p>
                <input type="button" value="注册" id="register_submit" class="login_button">
            </p>
            <p>
                <input type="reset" value="重写" class="login_button">
            </p>
            <p>
                <input type="reset" value="前往登录" class="login_button" id="register_to_login">
            </p>
        </form>
    </div>
</div>
</body>
</html>
