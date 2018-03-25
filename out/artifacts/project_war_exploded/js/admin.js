

var previous_top = 150;
var present_top = 230;
var next_top = 310;



$(function () {

    admin_initialize();
    admin_listen_mouse();

});


function admin_initialize() {

    if($(".boot_animation_previous_message") !== null)
    {
        $(".boot_animation_previous_message").show();
        $(".boot_animation_previous_message").css("top","" + previous_top + "px");
        $(".boot_animation_previous_message").css("transform","rotateX(65deg)");
        $(".boot_animation_previous_message").attr("name","65");
    }
    if($(".boot_animation_next_message") !== null)
    {
        $(".boot_animation_next_message").show();
        $(".boot_animation_next_message").css("top","" + next_top + "px")
        $(".boot_animation_next_message").css("transform","rotateX(-65deg)");
        $(".boot_animation_next_message").attr("name","-65");
    }
    if($(".boot_animation_present_message") !== null)
    {
        $(".boot_animation_present_message").show();
    }


    //启动动画
    // admin_boot_animation();
    //直接启动AI
    // open_AI();



}



function admin_boot_animation() {

    var list = $("#boot_animation > .boot_animation_message");

    var temp_number = 0;

    console.log("有：" + list.length + "个待执行动画");

    var animation_id = setInterval(function () {

        if(temp_number >= list.length + 2)
        {
            console.log("已停止");
            clearInterval(animation_id);
            //显示AI
            open_AI();
            return;
        }

        var present = null;
        var previous = null;
        var next = null;
        var next_new = null;

        for(i = 0;i < list.length;i ++)
        {
            if(list.eq(i).hasClass("boot_animation_present_message"))
            {
                present = list.eq(i);
                present.removeClass("boot_animation_present_message");
                admin_rotate_animation(present,65,100);
                present.animate({
                    top : "" + previous_top + "px"
                },100)
            }
            else if(list.eq(i).hasClass("boot_animation_previous_message"))
            {
                previous = list.eq(i);
                previous.removeClass("boot_animation_previous_message");
                previous.fadeOut(100,function () {
                    $(this).css("top","" + present_top +"px");
                });
            }
            else if(list.eq(i).hasClass("boot_animation_next_message"))
            {
                next = list.eq(i);
                next.removeClass("boot_animation_next_message");
                admin_rotate_animation(next,65,100);
                next.animate({
                    top : "" + present_top + "px"
                },100);

                if(i < list.length - 1)
                {
                    next_new = list.eq(i + 1);
                    admin_rotate_animation(next_new,-65,1);
                    next_new.css("top","" + next_top + "px");
                    next_new.fadeIn(100);
                }
            }
        }

        if(present !== null)
        {
            present.addClass("boot_animation_previous_message");
            present = null;
        }
        if(next !== null)
        {
            next.addClass("boot_animation_present_message");
            next = null;
        }
        if(next_new !== null)
        {
            next_new.addClass("boot_animation_next_message");
            next_new = null;
        }


        temp_number += 1;


    },2000);


}

function admin_rotate_animation(div,angle,time) {
    var temp_time = 0;

    var temp_angle = angle / time;

    var id = setInterval(function () {
        // div = $(".boot_animation_present_message");

        // console.log(div.css("transform"));
        // console.log(div.attr("name"));
        if(typeof(div.attr("name")) === "undefined")
        {
            div.attr("name","0")
        }
        var temp = parseFloat(div.attr("name"));
        temp += temp_angle;
        temp_time += 1;
        div.attr("name","" + temp)
        div.css("transform","rotateX(" + temp + "deg)");
        if(temp_time >= time)
        {
            clearInterval(id);
        }
    },1);
}

function admin_open_taskmanager() {


    $("#admin_control_panel").animate({
        left : "100px"
    },500);
    $("#AI_maindiv").animate({
        right : "250px"
    },500);
}

function admin_listen_mouse()
{  
    
}


