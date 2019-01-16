$(document).ready(function(e){
        // 获取屏幕宽度,并将其赋值给轮播图,以保障在每个分辨率上的电脑
        // 上都能让轮播图宽度与电脑宽度相等.
        var cWidth = $("body").width();
        $("#big-box img").css("width",cWidth);
        $('#big-box').kxbdSuperMarquee({
            distance:cWidth,//一次滚动的距离为电脑的宽度
            time:3,//停顿时间，单位为秒
            navId:'#big-boxNav', //导航容器ID，导航DOM:<ul><li>1</li><li>2</li><ul>,导航CSS:.navOn
            });
        $("#big-box").css("width",cWidth);
        $('.go-top').click(function(){
            $('body,html').animate({scrollTop:0})
            });

        $(".introduce").each(function(){
            var intr = $(this).html();
            if (intr.length>90){
                $(this).html(intr.substr(0,90)+" . . . ");
            };
        });

        $(".travelsItem li:nth-child(3n)").css({
            "margin-right":0,
        })

        $('#scenicItem').kxbdSuperMarquee({
            distance:405,//一次滚动的距离为电脑的宽度
            time:5,//停顿时间，单位为秒
            navId:'#scenicNav', //导航容器ID，导航DOM:<ul><li>1</li><li>2</li><ul>,导航CSS:.navOn
            });

        $(".travel_content>.article222>p>img").parent().css({
            "text-align":"center",
            "text-indent": "0",
        })
        
    });


