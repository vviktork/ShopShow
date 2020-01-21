$(document).ready(function (){
    $("#exit1, #exit2").click(function () {
        window.location.href ='/logout';
    });
    $("#ok").click(function () {
        window.location.href ='/shop';
    });
    $("#back").click(function () {
       window.history.back();
    });
});