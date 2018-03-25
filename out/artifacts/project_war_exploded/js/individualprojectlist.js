$(function () {

    individualprojectlist_initialize();
    individualprojectlist_mouselisten();

});

function individualprojectlist_initialize()
{

}

function individualprojectlist_mouselisten()
{
    $(".projectList_project_image").mouseenter(function () {

        console.log("一个有趣的测试");
        project_image_shadow_show($(this));

    });

    $(".projectList_project_image").mouseleave(function () {

        project_image_shadow_hide($(this));

    });


}


function project_image_shadow_show(obj)
{
    obj.stop(true,false);
    obj.animate({
        boxShadow: "0 0 75px #ffffff"
    },100);
}

function project_image_shadow_hide(obj)
{
    obj.stop(true,false);
    obj.animate({
        boxShadow: "0 0 0 #ffffff"
    },100);
}