
/*
divButton  用于最外层的DIV ，规定整个按钮的大小，和位置
mainButton  用于中间的DIV，必须有个name   用于覆盖其他小DIV
littleButton   中间的小按钮，最多有12个
 */



var defaults = {
    trigger: "click",
    animation: "fade",
    isOpen: false,
    self: null,
    mainDiv: null,
    list: null,
    animationSpeed: "medium"
};

var defaList = [];


$(function () {


    initializeButton();

    listenMouse();


    // defaList[0].list[0].css("height","1000px");
    // defaList[1].list[0].css("height","1000px");
    // alert(defaList[0].mainDiv.attr("name"));
    // alert(defaList[1].mainDiv.attr("name"));

});

//封装一个初始化方法
function initializeButton() {



    var divList = $(".divButton");

    // alert(divList.length);

    var v1;
    var v2;
    for(i = 0;i < divList.length;i ++)
    {
        var m = divList.eq(i);

        var defa = $.extend({},defaults);
        defa.self = m;//最外圈DIV
        defa.mainDiv = m.children(".mainButton").eq(0);//主DIV，覆盖其他DIV
        defa.list = [];

        var clist = m.children(".littleButton");

        // alert(clist.length);
        for(f = 0;f < clist.length;f ++)//获取其他内部DIV
        {
            // alert(clist.eq(f).parents().css("left"));
            defa.list.push(clist.eq(f));
        }
        if(i === 0)
        {
            v1 = defa.list;
        }
        else
        {
            v2 = defa.list;
        }
        defaList.push(defa);
    }

}

//封装一个监听鼠标事件的方法
function listenMouse() {
    // for(i = 0;i < defaList.length;i ++)
    // {
    //     defaList[i].mainDiv.click(function () {
    //         alert(defaList[i].mainDiv);
    //         defaList[i].mainDiv.eq(0).css("height","500px");
    //     });
    // }

    $(".mainButton").click(function () {



        var m = findDivOfList($(this));

        if(m !== null)
        {
            // m.list[0].css("height","1000px");
            // m.isOpen = true;
            openOption(m);
        }
        else
        {
            alert("不成功");
        }

    });

}


//封装一个查找主DIV的方法
function findDivOfList(div) {
    for(i = 0;i < defaList.length;i ++)
    {
        // alert(defaList[i].mainDiv.attr("name"));
        if(defaList[i].mainDiv.attr("name") === div.attr("name"))
        {
            return defaList[i];
        }

    }
    return null;
}


//封装一个散开选项DIV的方法
function openOption(m) {
    // alert("成功" + m.mainDiv.attr("name"));
    // alert("成功" + m.self.css("left"));




    for(i = 0;i < m.list.length;i ++)
    {
        if(i === 0)
        {
            m.list[i].css("top","0");
            m.list[i].css("left","0")
            m.list[i].animate({
                "left" : "-35%"
            },500);
        }
        else if(i === 1)
        {
            m.list[i].css("top","35%");
            m.list[i].css("left","0");
            m.list[i].animate({
                "left" : "-35%"
            },500);
        }
        else if(i === 2)
        {
            m.list[i].css("top","70%");
            m.list[i].css("left","0");
            m.list[i].animate({
                "left" : "-35%"
            },500);
        }
        else if(i === 3)
        {
            m.list[i].css("top","70%");
            m.list[i].css("left","0");
            m.list[i].animate({
                "top" : "105%"
            },500);
        }
        else if(i === 4)
        {
            m.list[i].css("top","70%");
            m.list[i].css("left","35%");
            m.list[i].animate({
                "top" : "105%"
            },500);
        }
        else if(i === 5)
        {
            m.list[i].css("top","70%");
            m.list[i].css("left","70%");
            m.list[i].animate({
                "top" : "105%"
            },500);
        }
        else if(i === 6)
        {
            m.list[i].css("top","70%");
            m.list[i].css("left","70%");
            m.list[i].animate({
                "left" : "105%"
            },500);
        }
        else if(i === 7)
        {
            m.list[i].css("top","35%");
            m.list[i].css("left","70%");
            m.list[i].animate({
                "left" : "105%"
            },500);
        }
        else if(i === 8)
        {
            m.list[i].css("top","0");
            m.list[i].css("left","70%");
            m.list[i].animate({
                "left" : "105%"
            },500);
        }
        else if(i === 9)
        {
            m.list[i].css("top","0");
            m.list[i].css("left","70%");
            m.list[i].animate({
                "top" : "-35%"
            },500);
        }
        else if(i === 10)
        {
            m.list[i].css("top","0");
            m.list[i].css("left","35%");
            m.list[i].animate({
                "top" : "-35%"
            },500);
        }
        else if(i === 11)
        {
            m.list[i].css("top","0");
            m.list[i].css("left","0");
            m.list[i].animate({
                "top" : "-35%"
            },500);
        }
    }


}