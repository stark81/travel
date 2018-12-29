$(function(){
    $(".navTitle").click(function(){
        $(".navTitle").next().css({
            "height":"0",
            "overflow":"hidden",
            "padding":"0",
            "transition":"all 0.6s",
        });
        $(this).next().css({
            "visibility":"visible",
            "height":"auto",
            "padding":"0.1rem 0",
            "transition":"all 0.6s", 
        }) 
    });
    $('.navHidden li a').click(function(){
        $(".navTitle").next().css({
                "height":"0",
                "overflow":"hidden",
                "padding":"0",
                "transition":"all 0.6s",
            })
    });
    var url = window.location.href;
    $('.navHidden li a').each(function () {
        if (returnUrl($(this).attr('href'))== returnUrl(url)){
            $(".current").removeClass("current");
            $(this).css({"color":"white"});
            $(this).find("div").css({"background":"white"})
            $(this).parents(".navHidden").prev().addClass('current');
        }
    });
    //以下为截取url的方法
    function returnUrl(href){
        var number=href.lastIndexOf("/");
        suburl = href.substring(number+1).split("?")[0];
        // return href.substring(number+1);
        return suburl;
    }
    function returnFileName(href){
        var number1=href.lastIndexOf("/");
        var number2= href.substring(0,number1).lastIndexOf("/");
        return href.substring(number1,number2+1);
    }
    $(".current").next().css({
        "visibility":"visible",
        "height":"auto",
        "padding":"0.1rem 0",
    });
    var addr1 = $(".current").find("p").html();
    var addr2 = $(".current").next().find("p").html()
    var addr = "当前位置 : " + addr1 + " > " + "<span>" + addr2 + "</span>";
    $(".breadcrumb").html(addr)


})