//判断侧边栏是否打开
var siderbar = false;

$(function () {

    siderbar_Initialize();
    siderbar_MouseClick();

});

//封装一个初始化事件
function siderbar_Initialize() {

    //灰色板块默认关闭
    $(".greyCloth").hide();

}

function siderbar_MouseClick() {

    $("#sidebar").click(function () {
        siderbar_SidebarClick();
    });
}

//封装一个侧边栏点击事件
function siderbar_SidebarClick() {
    console.log("成功");
    var speed = 500;

    if(siderbar)
    {
        $(".greyCloth").fadeOut(speed);
        $(".sidebar_mainDiv").animate({
            "left" : "-" + parseInt($(".sidebar_mainDiv").css("width")) - 20 + "px"
        },speed);
        $("#sidebar").animate({
            "left" : "0%"

        },speed);
        siderbar = false;
    }
    else
    {
        $(".greyCloth").fadeIn(speed);
        $(".sidebar_mainDiv").animate({
            "left" : "0%"
        },speed);
        $("#sidebar").animate({
            "left" : $(".sidebar_mainDiv").css("width")

        },speed);
        siderbar = true;
    }
}