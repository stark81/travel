function getuemailpage(){
    var uid = $("[name=infoemail]").val();
    $.get("/getuemailpage",{uid:uid},function(data){
        $(".uemail1").html(data);
    });
};



function getunamepage(){
    var uid = $("[name=infoid]").val();
    $.get("/getunamepage",{uid:uid},function(data){
        $(".uname1").html(data);
    });
};
function getuphonepage(){
    var uid = $("[name=infophone]").val();
    $.get("/getuphonepage",{uid:uid},function(data){
        $(".uphone1").html(data);
    });
}
function getintroducepage(){
    var uid = $("[name=infointro]").val();
    $.get("/getintroducepage",{uid:uid},function(data){
        $(".infointr1").html(data);
    });
}

function getusercover(){
    var uid = $("[name='getimg']").val();
    $.get("/getusercover",{uid:uid},function(data){
        $(".userCover").attr("src","/static/uploads/user/"+data);
    })
}

function getreviewsCount(){
    $(".getreviews").each(function(){
        travel_id = $(this).children('[name="travel_id"]').val();
        $(this).addClass("revcurrent");
        $(".revcurrent").load('/getreviews',"travel_id="+travel_id,
        function(data){
            $(".revcurrent").html(data);
        });
        $(".revcurrent").removeClass("revcurrent");
    });
}

$(function(){
    $(".userinforeviewLi:odd").css({
        "margin-right":0,
    })
})

$(function(){
    function getreviews(){
        var uid = $("[name='gettravelreviews']").val();
        $.ajax({
            url:'/gettravelreviews',
            type:'get',
            data:"uid="+uid,
            dataType:'html',
            async:true,
            success:function(data){
                $("#showreviews").append(data);
            },
            error:function(){
                console.log("err")
            }
        })
    };
    getreviews();

    $("[name='addreviews']").click(function(){
        var uid = $("[name='getimg']").val();
        var travel_id = $("[name='postreviewsss']").val();
        var review_content = $("#reviewscontent").val();
        $.ajax({
            url:"/userpostreviews",
            type:"post",
            data:"uid="+uid+"&&travel_id="+travel_id+"&&review_content="+review_content,
            dataType:"html",
            async:true,
            success:function(data){
                $("#showreviews").html(data);
                $("#reviewscontent").val("");
            },
            error:function(){
                console.log("err")
            }
        })
    })
})



$(document).on("click",".delreview1",function delreview(){
    var review_id = $(this).prev().val()
    var travel_id = $("[name='gettravelreviews']").val();
    $.ajax({
        url:"/delreviews",
        type:"post",
        data:"review_id="+review_id+"&&travel_id="+travel_id,
        dataType:"html",
        async:true,
        success:function(data){
            $("#showreviews").html(data);
        },
        error:function(){
            console.log("err")
        }
    })
});

// 写游记功能的地区-景区级联
// function loadArea(){
//     $.ajax({
//         async:false,
//         url:'/loadarea',
//         type:'get',
//         dataType:'json',
//         success:function(data){
//         //<option value='1'>黑龙江</option>
//         var html = "";
//         $.each(data,function(i,obj){
//             html+="<option value='"+obj.id+"'>";
//             html+=obj.areaName;
//             html+="</option>";
//         });
//         $("#areaname").html(html);
//         }
//     });
// }

// function loadScenic(area_id){
//     $.ajax({
//         url:'/loadscenic',
//         data:"area_id="+area_id,
//         type:'get',
//         dataType:'json',
//         success:function(data){
//         //循环遍历data并构建成<option>并增加到#selCity中
//         var html = "";
//         $.each(data,function(i,obj){
//             html+="<option value='"+obj.id+"'>";
//             html+=obj.scenicname;
//             html+="</option>";
//         });
//         $("#scenicname").html(html);
//         }
//     });
// }
// $(function(){
//     loadArea();
//     $("#areaname").change(function(){
//         loadScenic(this.value);
//     });
//     loadScenic($("#areaname").val());
// })


// function checktravleempty(){
//     var title = $("[name='title']").val();
//     var cover = $("#cover").val();
//     var draft_content = CKEDITOR.instances.content.getData();
//     if(title==""||cover==""||draft_content==""){
//         $("[name='submit']").attr("disabled",true);
//         $("[name='submit']").css({
//             "cursor":"default",
//             "background":"#5b686b",
//         })
//     }else{
//         $("[name='submit']").attr("disabled",false);
//         $("[name='submit']").css({
//             "cursor":"pointer",
//             "background":"#00a6c9",
//         })
//     }
// }

$(function(){
    function checktravelcollected(){
        var uid = $("[name='collecttraveluid']").val();
        var travel_id = $("[name='collecttravelid']").val();
        $.ajax({
            url:"/checktravelcollected",
            type:"get",
            data:"uid="+uid+"&&travel_id="+travel_id,
            async:true,
            success:function(data){
                if(data=="1"){
                    $(".collectTravel").css({
                        "display":"inline-block"
                    })
                    $(".dotravelcollected").css({
                        "display":"none"
                    })
                }else{
                    $(".dotravelcollected").css({
                        "display":"inline-block"
                    })
                    $(".collectTravel").css({
                        "display":"none"
                    })
                    
                }
            },
        })
    };
    checktravelcollected();

    $(".dotravelcollected").on("click",function(){
        var uid = $("[name='collecttraveluid']").val();
        var travel_id = $("[name='collecttravelid']").val();
        $.ajax({
            url:"/collecttravel",
            type:"post",
            data:"uid="+uid+"&&travel_id="+travel_id,
            async:true,
            success:function(data){
                checktravelcollected()
            },
        })
    });
    $(".collectTravel").on("click",function(){
        var uid = $("[name='collecttraveluid']").val();
        var travel_id = $("[name='collecttravelid']").val();
        $.ajax({
            url:"/cancelcollecttravel",
            type:"post",
            data:"uid="+uid+"&&travel_id="+travel_id,
            async:true,
            success:function(data){
                checktravelcollected()
            },
        })
    });
})

$(function(){
    var url = window.location.href;
    $('.leftNav li a').each(function () {
        if (returnHref($(this).attr('href')) == returnUrl(url) ){
            $(".currentLi").removeClass("currentLi");
            $(this).parent().addClass('currentLi');
        }
    });
    if(returnUrl(url) != "tourism_sircle" &&
        returnUrl(url) != "allscenics" &&
        returnUrl(url) != "alltravels" &&
        returnUrl(url) != "aboutus"
    ){
        $("#firstnav").addClass("currentLi");
    }

    
//以下为截取url的方法
    function returnHref(href){
        var a_href=href.split("/")[1];
        return a_href
    }
    function returnUrl(url){
        var a_href = url.split("/")[3];
        return a_href
    }
    
})
$(function(){
    var url = window.location.href;
    $("#aboutul th a").each(function(){
        if(returnuserHref($(this).attr('href')) == returnuserUrl(url) ){
            $(".userSelected").removeClass("userSelected");
            $(this).addClass("userSelected");
        }
    });
    function returnuserHref(href){
        var userHref = href.split("/")[2];
        return userHref;
    };
    function returnuserUrl(url){
        var userUrl = url.split("/")[4];
        return userUrl
    }
})

$(function(){
    $("[name='title']").change(function(){
        checktravleempty();
    });
    $("#cover").change(function(){
        checktravleempty();
    });
    var editor = CKEDITOR.instances.content;
    editor.on("change",function(){
        checktravleempty();
   });

    $(".close").click(function(){
        $(this).parent().css({
            "height":"0",
            "overflow":"hidden",
            "transition":"all 0.2s"
        });
});

})

