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
    $(".dotravelcollected").on("click",function(){
        var travel_id = $("[name='collecttravelid']").val();
        $.ajax({
            url:"/collecttravel",
            type:"post",
            data:"travel_id="+travel_id,
            async:true,
            success:function(data){
                $(".infotext").css({
                    "display":"block",
                });
                setTimeout(function(){
                    window.location.reload();
                },1500);
            },
        })
    });
    $(".collectTravel").on("click",function(){
        var travel_id = $("[name='collecttravelid']").val();
        $.ajax({
            url:"/cancelcollecttravel",
            type:"post",
            data:"travel_id="+travel_id,
            async:true,
            success:function(data){
                $(".infotext").css({
                    "display":"block",
                });
                setTimeout(function(){
                    window.location.reload();
                },1500);
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

// 取消关注，需要传入被关注者的id
function dontfocuse(focus_id){
    $.ajax({
        url:"/lost_focus",
        type:"post",
        data:"focus_id="+focus_id,
        async:true,
        success:function(data){
            $(".infotext").css({
                "display":"block",
            })
            setTimeout(function(){
                window.location.reload();
            },1500);
        }
    })
}

// function is_friend(focus_id){
//     $.ajax({
//         url:'/check_is_friend',
//         data:"focus_id="+focus_id,
//         type:'get',
//         async:true,
//         success:function(data){
//             if(data==1){
//                 return true;
//             }else{
//                 return false;
//             }
//         }
//     })
// }

$(function(){
    $(".checkfriend").each(function(){
        $(".checkfriendLi").removeClass("checkfriendLi");
        $(this).addClass("checkfriendLi");
        var focus_id = $(this).children("[name='check_is_friend']").val();
        $.ajax({
            url:'/check_is_friend',
            data:"focus_id="+focus_id,
            type:'get',
            async:false,
            success:function(data){
                if(data==1){
                    $(".checkfriendLi").children(".change").html("取关");
                    $(".checkfriendLi").children(".change").addClass("focus_change");
                    $(".checkfriendLi").children(".change").click(function(){
                        dontfocuse(focus_id);
                    })
                }else{
                    $(".checkfriendLi").children(".change").html("关注");
                    $(".checkfriendLi").children(".change").click(function(){
                        follow(focus_id);
                    })
                }
            }
        })
    })
})

// 关注用户，需要传入被关注者的id
function follow(focus_id){
    $.ajax({
        url:"/get_focus",
        type:"post",
        data:"focus_id="+focus_id,
        async:true,
        success:function(data){
            $(".infotext").css({
                "display":"block",
            });
            setTimeout(function(){
                window.location.reload();
            },1500);
        }
    })
}

$(function(){
    $("#focused").click(function(){
        var focus_id = $("[name='focus_id']").val();
        dontfocuse(focus_id);
    });
    $("#focus").click(function(){
        var focus_id = $("[name='focus_id']").val();
        follow(focus_id);
    })
})

$(function(){
    $(".getnums").each(function(){
        var getuserid = $(this).prev().val();
        $(this).children("label").addClass("current_travelnum");
        // focus.html页面用于获取用户的游记数量
        $.ajax({
            url:'/gettravelnums',
            type:"get",
            async:false,
            data:'getuserid='+getuserid,
            success:function(data){
                $(".current_travelnum").html(data+"篇游记");
                $(".current_travelnum").removeClass("current_travelnum");
            }
        });
    })
})

$(function(){
    $(".getnums").each(function(){
        var getuserid = $(this).prev().val();
        $(this).children("span").addClass("current_span");
        $(this).children("a").addClass("current_a")
        // focus.html页面用于获取用户的评论数量
        $.ajax({
            url:"/getuserreviewnums",
            type:"get",
            data:"getuserid="+getuserid,
            async:false,
            success:function(data){
                $(".current_span").html(data+"条评论");
                $(".current_span").removeClass("current_span");
            }
        });
        // focus.html页面用于获取用户的粉丝数量
        $.ajax({
            url:"/getuserfocusers",
            type:"get",
            data:"getuserid="+getuserid,
            async:false,
            success:function(data){
                $(".current_a").html(data+"个关注者");
                $(".current_a").removeClass("current_a");
            }
        })
    })
})
$(function(){
    $("#message").click(function(){
        $("#message-box").css({
            "display":"block",
        })
        var height0 = $("body").height();
        $("body").css({
            "height":height0,
            "overflow":"hidden"
        })
    });
    $("#cancelmessage").click(function(){
        $("#message-box").css({
            "display":"none",
        });
        $("body").css({
            "height":"auto",
            "overflow":"auto"
        })
    })
})

function domessage(user_id){
    var content = $(".message").val();
    $.ajax({
        url:"/domessage",
        type:"post",
        data:"user_id="+user_id+"&&content="+content,
        async:true,
        success:function(data){
            $("#sendmessageok").html(data);
            setTimeout(function(){
                window.location.reload();
            },1500)
        }
    })
}

function delmessage(message_id){
    $.ajax({
        url:"/delmessage",
        data:"message_id="+message_id,
        type:"post",
        async:false,
        success:function(data){
            $(".infotext").css({
                "display":"block"
            });
            setTimeout(function(){
                window.location.reload();
            },1500)
        }
    })
}

function mark_read(){
    $(".unread").each(function(){
        var message_id = $(this).prev().val();
        $.ajax({
            url:"/mark_as_read",
            data:"message_id="+message_id,
            type:"post",
            async:true,
        })
    })
}

function check_unread_message_numbers(){
    $.ajax({
        url:"/getunreadcount",
        type:"get",
        async:true,
        success:function(data){
            if(data != "0"){
                $("#checkunreadmessage").html(data);
                $("#checkunreadmessage").css({
                    "display":"inline-block"
                })
            }
        }
    })
}

function get_unread_number(){
    $.ajax({
        url:"/getunreadcount",
        type:"get",
        async:true,
        success:function(data){
            if(data != "0"){
                $("#a_unread_count").html(data);
                $("#a_unread_count").css({
                    "display":"inline-block"
                })
            }
        }
    })
}

// 确认是否要删除游记，函数需要传入被删除游记的id和标题
function makesuredeleteTravel(travel_id){
    $("#deltravel").css({
        "display":"block",
    });
    var height = $("body").height();
    $("body").css({
        "height":height,
        "overflow":"hidden"
    });
    $("[name='travel_id_delete']").val(travel_id);
}
// 取消删除
function canceldeleteTravel(){
    $("#deltravel").css({
        "display":"none",
    });
    $("body").css({
        "height":"auto",
        "overflow":"auto"
    });
}
// 确定删除游记
function do_delete_travel(){
    var travel_id = $("[name='travel_id_delete']").val();
    $.ajax({
        url:"/deletetravel",
        data:"travel_id="+travel_id,
        type:"post",
        async:true,
        success:function(data){
            $("#deltravel-box h3").html(data);
            $("#deltravel-box h3").css({
                "color":"red"
            })
            setTimeout(function(){
                window.location.reload();
            },1000)
        }
    })
}

function showdeleteReview(review_id){
    $("#deltravelreview").css({
        "display":"block",
    });
    var height = $("body").height();
    $("body").css({
        "height":height,
        "overflow":"hidden"
    });
    $("[name='review_id_delete']").val(review_id);
}

function canceldeleteReview(){
    $("#deltravelreview").css({
        "display":"none",
    });
    $("body").css({
        "height":"auto",
        "overflow":"auto"
    });
}

function do_delete_review(){
    var review_id = $("[name='review_id_delete']").val();
    $.ajax({
        url:"/userinfdeletereviews",
        data:"review_id="+review_id,
        type:"post",
        async:true,
        success:function(data){
            $("#deltravelreview-box h3").html(data);
            $("#deltravelreview-box h3").css({
                "color":"red"
            })
            setTimeout(function(){
                window.location.reload();
            },1000)
        }
    })
}




// 请注意，由于下面这个函数中存在ck编辑器加载报错的问题，
// 所以要确保下面这个函数在所有用户自己书写的js的最下面，
// 如果以后要添加js代码，请在上面进行书写。
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



// 请注意，由于上面这个函数中存在ck编辑器加载报错的问题，
// 如果你要添加js代码，请在上面这个函数的上面进行书写。