
//判断底部栏是否打开
var bottombar = false;

$(function () {

    index_Initialize();
    index_MouseClick();
    
});

//封装一个初始化事件
function index_Initialize() {

    setInterval(function () {
        $("#index_head_portrait").animate({

            boxShadow: "0 0 50px #e0e0e0"

        },1000).animate({

            boxShadow: "0 0 100px #e0e0e0"

        },1000);
    },2000);


}

//封装一个鼠标点击事件
function index_MouseClick() {

    $("#index_head_portrait").click(function () {
        index_HeadPortraitClick();
    });

    $(".shortcut_register").click(
        function () {
            siderbar_SidebarClick();
            clickCircleInput($("#registerCircleInput"));
        }
    );

    $(".mainButton").mouseenter(function () {
        index_mainButton_enter($(this));
    });

    $(".mainButton").mouseleave(function () {
        index_mainButton_leave($(this));
    });

}

//封装一个主页头像点击事件
function index_HeadPortraitClick() {
    var speed = 500;
    var minsize = 75;
    var maxsize = 150;

    $("#index_head_portrait").stop(true,true);
    if(bottombar)
    {
        $("#index_bottombar_mainDiv").animate({
            "top" : "150%"
        },speed);
        $("#index_head_portrait").animate({
            "top" : "20%",
            "left" : "50%",
            "height" : maxsize + "px",
            "width" : maxsize + "px"
        },speed);
        $("#index_blog_name").fadeIn(speed);
        bottombar = false;
    }
    else
    {
        $("#index_bottombar_mainDiv").animate({
            "top" : "40%"
        },speed);
        $("#index_head_portrait").animate({
            "top" : "40%",
            "left" : parseInt($("#index_bottombar_mainDiv").css("left")) + parseInt($("#index_bottombar_mainDiv").css("margin-left")) + minsize + "px",
            "height" : minsize + "px",
            "width" : minsize + "px"
        },speed);
        $("#index_blog_name").fadeOut(speed);
        bottombar = true;
    }


}

function index_mainButton_enter(obj) {
    obj.stop(true,false);
    obj.animate({
        top: "-10px",
        boxShadow: "10px 10px 25px #ffffff"
    },100);
}

function index_mainButton_leave(obj) {
    obj.stop(true,false);
    obj.animate({
        top: "0",
        boxShadow: "0 0 0px #ffffff"
    },100);
}