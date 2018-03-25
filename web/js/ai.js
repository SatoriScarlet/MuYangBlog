
$(function () {

    ai_initialize();
    ai_listen_mouse();

});

function ai_initialize() {
    
}

function ai_listen_mouse() {
    $("#AI_input_1").click(function () {
        AI_admin_open_taskmanager();
    });
    $("#AI_input_2").click(function () {
        close_AI();
    });
    $("#AI_input_3").click(function () {
        reset_rotate_animate();
    });
}

function open_AI() {
    
    $("#AI_maindiv").slideDown(1000);
    $("body").animate({
        backgroundColor : "#ffffff"
    },1000);
}

function close_AI() {
    change_AI_message("系统正在下线————");

    setTimeout(function () {
        $("#AI_maindiv").slideUp(1000);
        $("body").animate({
            backgroundColor : "#000000"
        },1000)
    },1000);
}

function hide_AI() {
    $("#AI_maindiv").slideUp(1000);
    $("body").animate({
        backgroundColor : "#000000"
    });
}



function change_AI_message(text) {
    $("#AI_message_showdiv").html(text);
}


function reset_rotate_animate() {
    if(typeof admin_boot_animation === "function")
    {
        change_AI_message("正在重新检索后台");
        hide_AI();
        setTimeout(function () {
            admin_boot_animation();
        },1000);
    }
    else
    {
        change_AI_message("糟糕，没找到后台检索程序，或许你不在管理员界面.....");
    }
}

function AI_admin_open_taskmanager() {
    if(typeof admin_open_taskmanager === "function")
    {
        change_AI_message("已打开后台管理界面......正在为你统计相关数据......");
        admin_open_taskmanager();
    }
    else
    {
        change_AI_message("糟糕，没找到后台管理界面，或许你不在管理员界面.....");
    }
}