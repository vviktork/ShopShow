$(document).ready(function (){
    $("#confirm").click(function () {
        alert('Заказ передан на оформление.');
    });
    $("#cancel").click(function () {
        window.location.href ='/shop';
    })
});