var srcUrl = $('#id_baseUrl').val();

$(document).on('click', '.send-message', function(e) {
    $('.pipeline-large-loader-container').addClass('display');
    var dest = $(this).attr('data-bs-dest');
    $('#modal-label').text($(this).attr('data-bs-titre'));
    $('#modal-destinataire').val(dest);
    
    $.get(srcUrl+'/messageries/listMessage/'+dest, function(data) {
        $('.modal-message').html(data);
        $('#message-text').val('');
        $('#modalMessage').modal('show');
        $('.pipeline-large-loader-container').removeClass('display');
    });
});

$(document).on('submit', 'form#form-send-message', function (e) {

    e.preventDefault();
    $('.pipeline-large-loader-container').addClass('display');

    $.ajax({
        headers: {
            'X-CSRF-Token': csrfToken
        },
        url: srcUrl + 'Messageries/sendMessage',
        type: "POST",
        data: {
            "destinataire": $('#modal-destinataire').val(),
            "message": $('#message-text').val()
        },
        success: function (data) {
            $.get(srcUrl+'/messageries/listMessage/'+$('#modal-destinataire').val(), function(data) {
                $('#message-text').val('');
                $('.modal-message').html(data);
                $('.pipeline-large-loader-container').removeClass('display');
            });
        },
        error: function (data) {
            console.log('Erreur:', data.responseText);
        }
    });
});