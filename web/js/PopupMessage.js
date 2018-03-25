$(function () {
    //提示框默认关闭
    closePopupMessage();

    clickPopupMessage();

});

//封装一个提示框点击方法
function clickPopupMessage() {
    $("#PopupMessage_CloseButton").click(function () {
        closePopupMessage();
    });
}
//封装一个显示提示框的方法
function showPopupMessage(text) {

    $("#PopupMessage_MessageDiv").html(text);
    $("#PopupMessage_MainDiv").fadeIn(500);

}
//封装一个关闭提示框的方法
function closePopupMessage() {
    $("#PopupMessage_MainDiv").fadeOut(500);
}