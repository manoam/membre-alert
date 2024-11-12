var srcUrl = $('#id_baseUrl').val();

$(document).ready(function () {
    var excel_imported_id = $('#excel_imported_id').val();
    var num_ligne_imported = $('#num_ligne_imported').val() >= 2 ? $('#num_ligne_imported').val() : 2;
    
    importAndSendSms(excel_imported_id, num_ligne_imported);
    
});

function importAndSendSms(idExcel, ligne, nombreError = 0) {
    nombreError = parseInt(nombreError);
    var nombre_ligne = parseInt($('#nombre_ligne').val());
    setTimeout(function () {
        $.ajax({
            url: srcUrl + 'ExcelImporteds/traitementParLigne/' + idExcel + '/' + ligne,
            type: "GET",
            success: function (data) {
                if (data.succes == 1 && data.status == "envoye") {
                    $('.progress-percentage-span').text(data.rapport + '%');
                    $('.progress-bar').addClass('w-' + data.rapport);
                    $('.message').text(data.message);
                    
                    if (ligne <= nombre_ligne + 1) {
                        importAndSendSms(idExcel, ligne+1);
                    } else {
                        editExcelImported(idExcel, "envoyer");
                    }
                } else {
                    if (nombreError < 3) {
                        importAndSendSms(idExcel, ligne, nombreError+1);
                    } else {
                        editExcelImported(idExcel, "erroner");
                    }
                }

            },
            error: function (data) {
                if (nombreError < 3) {
                    // console.log('Erreur:', data.responseText);
                    importAndSendSms(idExcel, ligne, nombreError+1);
                } else {
                    editExcelImported(idExcel, "erroner");
                }
            }
        });
    }, 2000);
}


function editExcelImported(idExcel, status) {
    $.ajax({
        headers: {
            'X-CSRF-Token': csrfToken
        },
        url: srcUrl + 'ExcelImporteds/editExcel/' + idExcel,
        type: "POST",
        data: {
            "status":status
        },
        success: function (data) {
            window.location.href = $('#redirectUrl').val();
        },
        error: function (data) {
            console.log('Erreur:', data.responseText);
        }
    });
}