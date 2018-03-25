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
        <p>
            <input type="button" value="前往注册" class="login_button" id="register">
        </p>
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
        </form>
    </div>

        <p>
            <input type="button" value="前往登录" class="login_button" id="login">
        </p>
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
                    <option value="1">头像1</option>
                    <option value="2">头像2</option>
                    <option value="3">头像3</option>
                    <option value="4">头像4</option>
                    <option value="5">头像5</option>
                    <option value="6">头像6</option>
                    <option value="7">头像7</option>
                    <option value="8">头像8</option>
                    <option value="9">头像9</option>
                    <option value="10">头像10</option>
                    <option value="11">头像11</option>
                    <option value="12">头像12</option>
                    <option value="13">头像13</option>
                    <option value="14">头像14</option>
                    <option value="15">头像15</option>
                    <option value="16">头像16</option>
                    <option value="17">头像17</option>
                    <option value="18">头像18</option>
                    <option value="19">头像19</option>
                    <option value="20">头像20</option>
                    <option value="21">头像21</option>
                    <option value="22">头像22</option>
                    <option value="23">头像23</option>
                    <option value="24">头像24</option>
                    <option value="25">头像25</option>
                    <option value="26">头像26</option>
                    <option value="27">头像27</option>
                    <option value="28">头像28</option>
                    <option value="29">头像29</option>
                    <option value="30">头像30</option>
                    <option value="31">头像31</option>
                    <option value="32">头像32</option>
                    <option value="33">头像33</option>
                    <option value="34">头像34</option>
                </select>
                <br><br><br>
            <p>
                <input type="button" value="注册" id="register_submit" class="login_button">
            </p>
            <p>
                <input type="reset" value="重写" class="login_button">
            </p>
        </form>
    </div>
</div>
</body>
</html>
