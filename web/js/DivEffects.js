$(function () {
    mouseListen_DivEffects();
});

//物体容器
var DE_Obj_List = [];

var DE_Name_Number = 0;

//封装一个鼠标监听器
function mouseListen_DivEffects() {
    $(".DE_MouseEnter").mouseenter(function () {
        var temp = $(this);
        if(hasByValue(temp))
        {
            return;
        }
        divEffectsJudge(temp,360);
    });
    $(".DE_MouseLeave").mouseleave(function () {

    });
    $(".DE_MouseClick").click(function () {
        
    });
}

//封装一个特效判断器
function divEffectsJudge(obj,i) {



    if(obj.hasClass("DE_OverTurn"))
    {
        console.log("测试");
        var shu = 0;
        var Name_Number = DE_Name_Number;
        DE_Name_Number += 1;
        DE_Obj_List.push(Name_Number);
        obj.addClass("DE_Name_" + Name_Number);
        var id = setInterval(function () {
            shu = shu + 1;
            // console.log(shu);
            obj.css("transform","rotateY(" + shu + "deg)");
            if(shu >= i)
            {
                removeByValue(DE_Obj_List,Name_Number);
                obj.removeClass("DE_Name_" + Name_Number);
                clearInterval(id);
            }
        },2);




    }
}

//删除数组元素的方法
function removeByValue(arr, val) {
    for(var i=0; i<arr.length; i++)
    {
        if(arr[i] === val) {
            arr.splice(i, 1);
            break;
        }
    }
}
//检测数组元素是否存在的方法
function hasByValue(val) {
    for(i = 0;i < DE_Obj_List.length;i ++)
    {
        if(val.hasClass("DE_Name_" + DE_Obj_List[i]))
        {
            console.log("找到该项");
            return true;
        }
    }
    console.log("没找到该项");
    return false;
}