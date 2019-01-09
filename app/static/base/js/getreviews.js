$(function(){
    $(".getreviews").each(function(){
        travel_id = $(this).children('[name="travel_id"]').val();
        $(this).addClass("revcurrent");
        $(".revcurrent").load('/getreviews',"travel_id="+travel_id,
        function(data){
            $(".revcurrent").html(data);
        });
        $(".revcurrent").removeClass("revcurrent");
    });
})

$(function(){
    var uid = $("[name=infoid]").val();
    $.get("/getunamepage",{uid:uid},function(data){
        $(".uname1").html(data);
    });
})
$(function(){
    var uid = $("[name=infoemail]").val();
    $.get("/getuemailpage",{uid:uid},function(data){
        $(".uemail1").html(data);
    });
})
$(function(){
    var uid = $("[name=infophone]").val();
    $.get("/getuphonepage",{uid:uid},function(data){
        $(".uphone1").html(data);
    });
})
$(function(){
    var uid = $("[name=infointro]").val();
    $.get("/getintroducepage",{uid:uid},function(data){
        $(".infointr1").html(data);
    });
})

