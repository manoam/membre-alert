var srcUrl = $('#id_baseUrl').val();

$(document).on('click', '.send-message', function(e) {
    var dest = $(this).attr('data-bs-dest');
    $('#modal-label').text($(this).attr('data-bs-titre'));
    $('#modal-destinataire').val(dest);
    
    $.get(srcUrl+'/messageries/listMessage/'+dest, function(data) {
        $('.modal-message').html(data);
        $('#modalMessage').modal('show');
    });
});

$(document).on('submit', 'form#form-send-message', function (e) {

    e.preventDefault();
    $.ajax({
        headers: {
            'X-CSRF-Token': csrfToken
        },
        url: srcUrl + 'Messageries/sendMessage',
        type: "POST",
        data: {
            "destinataire": $('#destinataire').val(),
            "message": $('#message-text').val()
        },
        success: function (data) {
            $.get(srcUrl+'/messageries/listMessage/'+$('#destinataire').val(), function(data) {
                $('.message').html(data);
            });
        },
        error: function (data) {
            console.log('Erreur:', data.responseText);
        }
    });
});