function createXhr(){
    if(window.XMLHttpRequest){
        var xhr = new XMLHttpRequest();
        return xhr;
    }else{
        var xhr = new ActiveXObject("Microsoft.XMLHTTP");
        return xhr;
    };
}