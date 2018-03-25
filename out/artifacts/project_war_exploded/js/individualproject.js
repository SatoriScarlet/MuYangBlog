
var speed = 300;

$(function () {

    individualproject_initialize();
    individualproject_mouselisten();


});

function individualproject_initialize() {

    $(".project_button_inside_message").hide();

    $(".project_intro_text").hide();

    $(".project_plan_text").hide();
}


function individualproject_mouselisten() {

    $(".project_button").mouseenter(function () {

            var temp = $(this);

            if (!temp.hasClass("project_isOpen")) {
                temp.children(".project_button_external_message").fadeOut(speed, function () {

                    temp.children(".project_button_inside_message").fadeIn(speed);
                });

            }
        }

    );

    $(".project_button").mouseleave(function () {

            var temp = $(this);

            if (!temp.hasClass("project_isOpen")) {
                temp.children(".project_button_inside_message").fadeOut(speed, function () {

                    temp.children(".project_button_external_message").fadeIn(speed);
                });

            }
        }
    );
    $(".project_can_open").click(function () {
        var temp = $(this);

        if(!temp.hasClass("project_isOpen")) {
            open_project_button(temp);
        }
        else{
            close_project_button(temp);
        }

    });

    $(".project_plan_button").click(function () {

        var temp = $(this).parent("");

        if(!temp.hasClass("project_isOpen"))
        {
            open_project_plan_button(temp);
        }
        else
        {
            close_project_plan_button(temp);

        }
    });

}


function open_project_button(div) {

    div.addClass("project_isOpen");
    div.children(".project_button_inside_message").stop(true,true);
    div.children(".project_button_external_message").stop(true,true);
    div.children(".project_button_inside_message").slideUp(speed);
    div.children(".project_button_external_message").slideUp(speed);
    div.animate({

        "height" : div.children(".project_intro_text").css("height"),
        "width": "60%"

    },speed,function () {
        div.children(".project_intro_text").show();
    });

}

function close_project_button(div) {

    div.removeClass("project_isOpen");
    div.children(".project_intro_text").hide();
    div.children(".project_button_inside_message").stop(true,true);
    div.children(".project_button_external_message").stop(true,true);
    div.children(".project_button_inside_message").slideDown(speed);
    div.children(".project_button_external_message").slideUp(speed);
    div.animate({

        "height" : "40px",
        "width": "10%"

    },speed);

}

function open_project_plan_button(div) {

    var new_speed = speed + 200;

    div.addClass("project_isOpen");
    var temp1 = div.children(".project_plan_button");
    var temp2 = div.children(".project_plan_text");
    if(temp2.css("max-height") === "none")
    {
        temp2.css("max-height",temp2.css("height"));

    }
    temp2.css("width","0");
    temp2.css("height",parseInt(div.css("height")) / 2 + "px");
    temp1.stop(true,true);
    temp2.stop(true,true);

    temp2.show();

    temp1.rotate({
        animateTo : 360,
        duration : new_speed
    });



    temp2.animate({
        "width" : "80%"
    },new_speed / 2,function () {
        div.animate({
            "height" : parseInt(temp2.css("max-height")) + 50 + "px"
        },new_speed / 2);
        temp2.animate({
            "height" : temp2.css("max-height")
        },new_speed / 2);
    });


}

function close_project_plan_button(div) {

    var new_speed = speed + 200;

    div.removeClass("project_isOpen");
    var temp1 = div.children(".project_plan_button");
    var temp2 = div.children(".project_plan_text");
    temp1.stop(true,true);
    temp2.stop(true,true);
    temp1.rotate({
        animateTo : 0,
        duration : new_speed
    });

    div.animate({
        "height" : "100px"
    },new_speed / 2);
    temp2.animate({
        "height" : "50px"
    },new_speed / 2,function () {
        temp2.animate({
            "width" : "10%"
        },new_speed / 2,function () {
            temp2.hide();

        });

    });


}