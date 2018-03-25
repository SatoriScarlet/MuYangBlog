$(function () {

    annotationmessage_initialize();
    annotationmessage_mouselisten();

});

function annotationmessage_initialize() {
    
}

function annotationmessage_mouselisten() {

    $(".AnnotationMessage_icon_div").mouseenter(function () {

        annotationmessage_show_text_div($(this));

    });
    $(".AnnotationMessage_icon_div").mouseleave(function () {

        annotationmessage_hide_text_div($(this));

    });

}

function annotationmessage_show_text_div(obj) {
    var temp_div = obj.children(".AnnotationMessage_text_div");
    temp_div.stop(true,false);
    var window_width = $(window).width();
    var window_height = $(window).height();
    if(window_width - obj.offset().left - parseInt(obj.css("width")) - parseInt(temp_div.css("width")) >= 0 && window_height - obj.offset().top - parseInt(obj.css("height")) - parseInt(temp_div.css("height")) >= 0)
    {
        console.log("我觉得可以");
        temp_div.css("left",obj.css("width"));
        temp_div.css("top",obj.css("height"));
    }
    else
    {
        console.log("我觉得不妥");
        if(parseInt(temp_div.css("width")) <= obj.offset().left && parseInt(temp_div.css("height")) <= obj.offset().top)
        {
            console.log("我觉得可以");
            temp_div.css("left","-" + parseInt(temp_div.css("width")));
            temp_div.css("top","-" + parseInt(temp_div.css("height")));
        }
        else
        {
            console.log("我觉得不妥");
            if(window_width - obj.offset().left - parseInt(obj.css("width")) - parseInt(temp_div.css("width")) >= 0 && parseInt(temp_div.css("height")) <= obj.offset().top)
            {
                console.log("我觉得可以");
                temp_div.css("left",obj.css("width"));
                temp_div.css("top","-" + parseInt(temp_div.css("height")));
            }
            else
            {
                console.log("我觉得不妥");
                if(parseInt(temp_div.css("width")) <= obj.offset().left && window_height - obj.offset().top - parseInt(obj.css("height")) - parseInt(temp_div.css("height")) >= 0)
                {
                    console.log("我觉得可以");
                    temp_div.css("left","-" + parseInt(temp_div.css("width")));
                    temp_div.css("top",obj.css("height"));
                }
                else
                {
                    console.log("我觉得不妥");
                    temp_div.css("left",obj.css("width"));
                    temp_div.css("top",obj.css("height"));
                }
            }
        }
    }

    // console.log(window_height);
    // console.log(obj.offset().left);
    // console.log(obj.css("width"));
    // console.log(temp_div.css("width"));

    temp_div.fadeIn(300);
}

function annotationmessage_hide_text_div(obj) {
    var temp_div = obj.children(".AnnotationMessage_text_div");
    temp_div.stop(true,false);
    temp_div.fadeOut(300);
}