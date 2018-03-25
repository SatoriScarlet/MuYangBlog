
// var singleMainDiv = {
//     isOpen : false,
//     diary_singleMainDiv : null
// };

var speed = 300;

var diary_write_maindivIsOpen = false;

var diary_write_externalIsImport = false;
var diary_write_insideIsImport = false;
var diary_write_textIsImport = false;


var isAlterMode = false;
var alterDiaryId = 0;

$(function () {

    diary_initialize();
    diary_listenMouse();



});


function diary_initialize() {
    $(".diary_singleMainDiv > .diary_inside_message").hide();

    $("#diary_submit").hide();
    $("#diary_alter").hide();

}

function diary_listenMouse() {

    $(".diary_singleMainDiv").mouseenter(function () {

        var temp = $(this);
        $(".diary_singleMainDiv").each(function () {
            leave_diary_singleMainDiv($(this));
        });

        enter_diary_singleMainDiv(temp);

        // setTimeout(function () {
        // },300);

    });

    $(".diary_singleMainDiv").mouseleave(function () {
        var temp = $(this);
        leave_diary_singleMainDiv($(this));



        // setTimeout(function () {
        // },300);

    });

    $(".diary_singleMainDiv").click(function () {
        var temp = $(this);

        if(!temp.hasClass("diary_isOpen")) {
            open_diary_singleMainDiv(temp);
        }
        else{
            close_diary_singleMainDiv(temp);
        }

    });
    
    $("#diary_put_maindiv").mouseenter(function () {
        if(!diary_write_maindivIsOpen)
        {
            $(this).animate({
                "left" : "92%"
            },300);
        }
        else
        {
            $(this).animate({
                "left" : "67%"
            },300);
        }
    });

    $("#diary_put_maindiv").mouseleave(function () {
        if(!diary_write_maindivIsOpen) {
            $(this).animate({
                "left": "97%"
            }, 300);
        }
        else
        {
            $(this).animate({
                "left": "72%"
            }, 300);
        }
    });

    $("#diary_put_maindiv").click(function () {
        if(!diary_write_maindivIsOpen)
        {
            open_diary_write_maindiv();
        }
        else
        {
            close_diary_write_maindiv();
        }
    });

    $("#diary_write_external").blur(function () {

        show_diary_submit();

    });

    $("#diary_write_inside").blur(function () {

        show_diary_submit();

    });

    $("#diary_write_text").blur(function () {

        show_diary_submit();

    });

    $(".diary_alter_put").click(function () {

        var main = $(this).parent().parent();
        var id = main.children(".diary_id").text();
        var diary_external_message = main.children(".diary_external_message_source").text();
        var diary_inside_message = main.children(".diary_inside_message_source").text();
        var diary_text = main.children(".diary_text_source").html();

        open_diary_alter_maindiv(id,diary_external_message,diary_inside_message,diary_text);

    });

    $("#diary_submit").click(function () {
       $.ajax({
           url : "PutDiary",
           type : "post",
           data : {
               execute_code : 0,
               diary_external_message : $("#diary_write_external").val(),
               diary_inside_message : $("#diary_write_inside").val(),
               diary_text : $("#diary_write_text").val()
           },
           success : function (value) {
               if(value === "1")
               {
                   showPopupMessage("已发布并更新日志！");
                   setTimeout(function () {

                       window.location.href = window.location.href;
                       console.log(window.location.href);

                   },2000);
               }
               else
               {
                   showPopupMessage("未知的异常错误！");
               }
           },
           error : function () {
               showPopupMessage("未知的异常错误！");
           }
       })
    });

    $("#diary_alter").click(function () {
        $.ajax({
            url : "PutDiary",
            type : "post",
            data : {
                execute_code : 1,
                alterDiaryId : alterDiaryId,
                diary_external_message : $("#diary_write_external").val(),
                diary_inside_message : $("#diary_write_inside").val(),
                diary_text : $("#diary_write_text").val()
            },
            success : function (value) {
                if(value === "1")
                {
                    showPopupMessage("已更新日志！");
                    setTimeout(function () {

                        window.location.href = window.location.href;
                        console.log(window.location.href);

                    },2000);
                }
                else
                {
                    showPopupMessage("未知的异常错误！");
                }
            },
            error : function () {
                showPopupMessage("未知的异常错误！");
            }
        })
    });

    $(".diary_delete_put").click(function () {
        var main = $(this).parent().parent();
        var id = main.children(".diary_id").text();
        id = $.trim(id);
        $.ajax({
            url : "DeleteDiary",
            type : "post",
            data : {
                deleteDiaryId : id
            },
            success : function (value) {
                if(value === "1")
                {
                    showPopupMessage("已删除日志！");
                    setTimeout(function () {

                        window.location.href = window.location.href;
                        console.log(window.location.href);

                    },2000);
                }
                else
                {
                    showPopupMessage("未知的异常错误！");
                }
            },
            error : function () {
                showPopupMessage("未知的异常错误！");
            }
        })
    });

    $(".diary_page_number").click(function () {
        var number = $(this).text();
        number = $.trim(number);
        var tempurl = window.location.href;
        tempurl = tempurl.substring(0,tempurl.lastIndexOf("/"));
        window.location.href = tempurl + "/BlogDiary?pageNumber=" + number;
        console.log(window.location.href);

    });


    $("#diary_close").click(function () {

        close_diary_write_maindiv();
        if(isAlterMode)
        {
            isAlterMode = false;
            $("#diary_alter").fadeOut(200);
            $("#diary_write_external").val("");
            $("#diary_write_inside").val("");
            $("#diary_write_text").val("");
        }
        
    });
}

function enter_diary_singleMainDiv(temp) {
    // console.log("打开");
    if(!temp.hasClass("diary_isShow") && !temp.hasClass("diary_isOpen")) {
        temp.addClass("diary_isShow");
        temp.children(".diary_external_message").fadeOut(speed, function () {
            temp.children(".diary_inside_message").fadeIn(speed);
        });
    }
}

function leave_diary_singleMainDiv(temp) {
    // console.log("关闭");
    if(temp.hasClass("diary_isShow") && !temp.hasClass("diary_isOpen")){
        temp.removeClass("diary_isShow");
        temp.children(".diary_inside_message").fadeOut(speed,function () {
            temp.children(".diary_external_message").fadeIn(speed);
        });
    }
}

function open_diary_singleMainDiv(div) {

    // $(".diary_singleMainDiv").each(function () {
    //     close_diary_singleMainDiv($(this));
    // });
    div.addClass("diary_isOpen");
    div.children(".diary_inside_message").stop(true,true);
    div.children(".diary_external_message").stop(true,true);
    div.children(".diary_inside_message").slideUp(speed);
    div.children(".diary_external_message").slideUp(speed);
    div.animate({

        "height" : div.children(".diary_text").css("height")

    },speed);



}

function close_diary_singleMainDiv(div) {

    div.removeClass("diary_isOpen");
    div.children(".diary_inside_message").stop(true,true);
    div.children(".diary_external_message").stop(true,true);
    div.children(".diary_inside_message").slideDown(speed);
    div.children(".diary_external_message").slideUp(speed);
    div.animate({

        "height" : "70px"

    },speed);

}

function show_diary_submit() {

    if($("#diary_write_external").val() !== "")
    {
        diary_write_externalIsImport = true;
    }
    else
    {
        diary_write_externalIsImport = false;
    }

    if($("#diary_write_inside").val() !== "")
    {
        diary_write_insideIsImport = true;
    }
    else
    {
        diary_write_insideIsImport = false;
    }

    if($("#diary_write_text").val() !== "")
    {
        diary_write_textIsImport = true;
    }
    else
    {
        diary_write_textIsImport = false;
    }

    if(diary_write_externalIsImport && diary_write_insideIsImport && diary_write_textIsImport)
    {
        if(!isAlterMode)
        {
            $("#diary_submit").fadeIn(200);
        }
        else
        {
            $("#diary_alter").fadeIn(200);
        }
    }
    else
    {
        if(!isAlterMode)
        {
            $("#diary_submit").fadeOut(200);
        }
        else
        {
            $("#diary_alter").fadeOut(200);
        }
    }
}

function open_diary_write_maindiv() {
    $("#diary_put_maindiv").animate({
        "left" : "72%"
    },300);
    $("#diary_write_maindiv").animate({
        "left" : "75%"
    },300);
    diary_write_maindivIsOpen = true;
}

function close_diary_write_maindiv() {
    $("#diary_put_maindiv").animate({
        "left" : "97%"
    },300);
    $("#diary_write_maindiv").animate({
        "left" : "100%"
    },300);
    diary_write_maindivIsOpen = false;
}

function open_diary_alter_maindiv(id,txt1,txt2,txt3) {
    open_diary_write_maindiv();

    $("#diary_alter").fadeIn(200);
    $("#diary_submit").fadeOut(200);

    id = $.trim(id);
    txt1 = $.trim(txt1);
    txt2 = $.trim(txt2);
    txt3 = $.trim(txt3);
    $("#diary_write_external").val(txt1);
    $("#diary_write_inside").val(txt2);
    $("#diary_write_text").val(txt3);

    alterDiaryId = id;

    isAlterMode = true;

}