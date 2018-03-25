$(function () {

    userLoginOut();




});

//封装一个登出方法

function userLoginOut() {
    $("#loginout").click(function () {

        $.ajax({
            url : "UserLoginOut",
            type : "post",
            success : function (value) {
                if(value === "1")
                {
                    showPopupMessage("你已经登出~");
                    setTimeout(function () {
                        window.location.reload();

                    },2000);
                }
                else
                {
                    showPopupMessage("你当前尚未登录！");
                }

            }
        });

        });
}