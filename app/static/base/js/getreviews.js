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
    console.log("游记id是:"+travel_id);
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
