var baseUrl = $('#id_baseUrl').val();
/*
 * Script pour lancer la lecture des messages dans le modem.
 */
setInterval(function () {
    $.get(baseUrl + 'messageries/readMessage');
}, 2000);


/*
 * Script pour checker le status du modem.
 */
var statusModem = null;

setInterval(function () {
    $.ajax({
        url: baseUrl + 'messageries/checkModem',
        type: "GET",
        success: function(data) {
            if (data.status != statusModem) {
                statusModem = data.status;
                if (data.status) {
                    var html = '<i class="fa fa-check" style="font-size:15px;color:green"></i><span class="ms-1">Connecté</span>';
                } else {
                    var html = '<i class="fa fa-warning" style="font-size:15px;color:red"></i><span class="ms-1">Non connecté</span>';
                }

                $('.modem-status').html(html);
            }
        },
        cache: true
    });
}, 2000);
