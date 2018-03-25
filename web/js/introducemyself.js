


$(function () {

    introducemyself_initialize();
    introducemyself_mouselisten();


});

function introducemyself_initialize() {

    //计算进度
    $(".IntroduceMyself_info_cover_text_line_div").each(function () {
        var number = $(this).children("span").html();
        $(this).prev().css("width",number);
    });
}

function introducemyself_mouselisten() {

    $(".IntroduceMyself_info_line_div").mouseenter(function () {

        // console.log("测试");
        // console.log($(this).next().html());
    });

}