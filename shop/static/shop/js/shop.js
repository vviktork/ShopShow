function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
};
$(document).ready(function (){
    $("#basket").click(function () {
        var checked = [];
        var csrftoken = getCookie('csrftoken');
        $('input:checkbox:checked').each(function() {
            checked.push($(this).val());
        });
        if ($.isEmptyObject(checked) === false) {
            $.ajax({
                url: '',
                type: 'POST',
                data: {
                    csrfmiddlewaretoken: csrftoken,
                    product: checked
                },
                success:function(){
                    window.location.href ='/pannier';
                },
                error:function(data){
                    alert('Сервер не доступен.');
                },
            });
            } else {
            alert('Нет выбранных товаров!!!');
        }
    });
    $("#exit").click(function () {
        window.location.href ='/logout';
    });
});
