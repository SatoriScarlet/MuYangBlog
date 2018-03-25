/*
id user 为用户名
id passwd 为密码

id user_message 为用户名提示信息
id passwd_message 为密码提示信息

id login_message 为所有提示信息的模板


state 中 1代表注册界面，2代表未登录界面，
 */


var login_userIsImport = false;
var login_passwdIsImport = false;

var register_userIsImport = false;
var register_passwdIsImport = false;
var register_passwd_repeatIsImport = false;
var register_displayerIsImport = false;

var state = 2;

var can_register = false;

$(function () {
    login_Initialize();
    login_mouseBlur();
    login_mouseClick();
});

function login_Initialize() {
    $(".login_message").hide();
    $("#login_submit").hide();
    $("#register_submit").hide();
    $("#loginComponent").hide();
    $("#registerComponent").hide();

}



//封装一个鼠标离开检测的事件
function login_mouseBlur() {
    $("#login_user").blur(function () {
        if($(this).val() === "")
        {
            $("#login_user_message").slideDown(300);
            login_userIsImport = false;
        }
        else
        {
            $("#login_user_message").slideUp(200);
            login_userIsImport = true;
        }
        showSubmitInput();
    });
    $("#login_passwd").blur(function () {
        if($(this).val() === "")
        {
            $("#login_passwd_message").slideDown(300);
            login_passwdIsImport = false;
        }
        else
        {
            $("#login_passwd_message").slideUp(200);
            login_passwdIsImport = true;
        }
        showSubmitInput();
    });

    $("#register_user").blur(function () {
        if($(this).val() === "")
        {
            $("#register_user_message").slideDown(300);
            register_userIsImport = false;
        }
        else
        {
            $("#register_user_message").slideUp(200);
            register_userIsImport = true;
        }
        showSubmitInput();
    });
    $("#register_passwd").blur(function () {
        if($(this).val() === "")
        {
            $("#register_passwd_message").slideDown(300);
            register_passwdIsImport = false;
        }
        else
        {
            $("#register_passwd_message").slideUp(200);
            register_passwdIsImport = true;
        }
        showSubmitInput();
    });
    $("#register_passwd_repeat").blur(function () {
        if($(this).val() === "" || $(this).val() !== $("#register_passwd").val())
        {
            $("#register_passwd_repeat_message").slideDown(300);
            register_passwd_repeatIsImport = false;
        }
        else
        {
            $("#register_passwd_repeat_message").slideUp(200);
            register_passwd_repeatIsImport = true;
        }
        showSubmitInput();
    });
    $("#register_displayer").blur(function () {
        if($(this).val() === "")
        {
            $("#register_displayer_message").slideDown(300);
            register_displayerIsImport = false;
        }
        else
        {
            $("#register_displayer_message").slideUp(200);
            register_displayerIsImport = true;
        }
        showSubmitInput();
    });
    $("#head_portrait").click(function () {
        $("#sidebar_head_portrait").css("height","100px");
        $("#sidebar_head_portrait").css("width","100px");
        $("#sidebar_head_portrait").attr("src","img/head_portrait/" + $(this).val() + ".jpg");


        showSubmitInput();
    });

}

//封装一个鼠标点击监听的方法
function login_mouseClick() {

    $(".login_Circle_Input").click(function () {
        clickCircleInput($(this));
    });

    $("#login_to_register").click(function () {
        clickCircleInput($("#registerCircleInput"));
    });

    $("#register_to_login").click(function () {
        clickCircleInput($("#loginCircleInput"));
    });

    $("#login_submit").click(function () {
        $.ajax({
            // url : "UserLogin?" + "login_user=" + $("#login_user").val() + "&login_passwd=" + $("#login_passwd").val(),
            url : "UserLogin",
            data : {
                login_user : $("#login_user").val(),
                login_passwd : $("#login_passwd").val()
            },
            type : "post",
            success : function (value) {
                if(value === "1")
                {
                    showPopupMessage("成功登陆！");
                    setTimeout(function () {
                        window.location.reload();

                    },2000);
                }
                else
                {
                    showPopupMessage("当前输入的账号或密码错误！");
                }

            }

        })
    });

    $("#register_submit").click(function () {
        $.ajax({
            // url : "UserRegister?" + "register_user=" + $("#register_user").val() + "&register_passwd=" + $("#register_passwd").val() + "&register_displayer=" + $("#register_displayer").val() + "&head_portrait=" + $("#head_portrait").val(),
            url : "UserRegister",
            data : {
                register_user : $("#register_user").val(),
                register_passwd : $("#register_passwd").val(),
                register_displayer : $("#register_displayer").val(),
                head_portrait : $("#head_portrait").val()
            },
            type : "post",
            success : function (value) {
                if(value === "1")
                {
                    showPopupMessage("成功注册！");
                    setTimeout(function () {
                        window.location.reload();
                    },2000);
                }
                else
                {
                    showPopupMessage("当前输入的账号或昵称已经存在！");
                }

            }

        })
    });
}

//封装一个显示登录按钮的方法
function showSubmitInput() {
    if(login_userIsImport && login_passwdIsImport)
    {
        $("#login_submit").fadeIn(300);
    }
    else
    {
        $("#login_submit").fadeOut(300);
    }
    if(register_userIsImport && register_passwdIsImport && register_passwd_repeatIsImport && register_displayerIsImport)
    {
        $("#register_submit").fadeIn(300);
    }
    else
    {
        $("#register_submit").fadeOut(300);
    }
}
//封装一个点击圆形按钮点击的事件
function clickCircleInput(CI) {

    if(!can_register && CI.attr("id") === "registerCircleInput")
    {
        showPopupMessage("很抱歉~目前暂未开放注册~不过你可以联系 <br> QQ 149089985 获取高级访问权限");
        return;
    }

    $(".login_Circle_Input").each(function () {

        $(this).show(500);
        $(this).text("");

        if(CI.attr("id") === $(this).attr("id"))
        {
            CI.animate({
                "marginTop" : "100%"
            },500,function () {
                CI.animate({
                    "width" : parseInt(CI.parent(".sidebar_mainDiv").css("height")) * 2 + "px",
                    "height" : parseInt(CI.parent(".sidebar_mainDiv").css("height")) * 2 + "px",
                    "margin" : (parseInt(CI.css("margin-top")) - parseInt(CI.parent(".sidebar_mainDiv").css("height"))) + "px" + " " + (parseInt(CI.css("margin-left")) - parseInt(CI.parent(".sidebar_mainDiv").css("height"))) + "px",
                    "borderRadius" : parseInt(CI.parent(".sidebar_mainDiv").css("height")) + "px"
                },500,function () {

                    $(".sidebar_component").each(function () {
                        $(this).hide();
                    });

                    if(CI.attr("id") === "loginCircleInput")
                    {
                        $("#loginComponent").fadeIn(500);
                    }
                    else if(CI.attr("id") === "registerCircleInput")
                    {
                        $("#registerComponent").fadeIn(500);
                    }
                });
            });
        }
        else
        {
            $(this).fadeOut(500);
        }
    }
    );






}