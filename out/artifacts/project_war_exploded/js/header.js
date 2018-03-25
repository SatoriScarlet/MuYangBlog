$(function () {

    header_initialize();

    header_mouseover();
});

function header_initialize() {
    $(".header_menuItem > ul").hide();
}

function header_mouseover() {

    $(".header_menuItem").mouseenter(function () {
        $(this).css("background-color","#4e4e4e");
        $(this).children(".header_menuList").slideDown(200);
    });

    $(".header_menuItem").mouseleave(function () {
        $(this).css("background-color","#000000");
        $(this).children(".header_menuList").slideUp(200);
    });

    $(".header_meneSingle").mouseenter(function () {
        $(this).css("background-color","#4e4e4e");

    });

    $(".header_meneSingle").mouseleave(function () {
        $(this).css("background-color","#000000");

    });
}

