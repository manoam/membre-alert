var srcUrl = $('#id_baseUrl').val();

$(document).ready(function () {
    var excel_imported_id = $('#excel_imported_id').val();
    var num_ligne_imported = $('#num_ligne_imported').val() >= 2 ? $('#num_ligne_imported').val() : 2;
    
    importAndSendSms(excel_imported_id, num_ligne_imported);
    
});

function importAndSendSms(idExcel, ligne) {
    var nombre_ligne = $('#nombre_ligne').val();
    $.ajax({
        url: srcUrl + 'ExcelImporteds/traitementParLigne/' + idExcel + '/' + ligne,
        type: "GET",
        success: function (data) {
            if (data.succes == 1) {
                $('.progress-percentage-span').text(data.rapport + '%');
                $('.progress-bar').addClass('w-' + data.rapport);
                $('.message').text(data.message);
            }
            
            if (ligne <= nombre_ligne) {
                
                importAndSendSms(idExcel, ligne+1);
            } else {
                editExcelImported(idExcel);
            }
        },
        error: function (data) {
            console.log('Erreur:', data.responseText);
        }
    });
}


function editExcelImported(idExcel) {
    $.ajax({
        headers: {
            'X-CSRF-Token': csrfToken
        },
        url: srcUrl + 'ExcelImporteds/editExcel/' + idExcel,
        type: "POST",
        data: {
            "status":"envoyer"
        },
        success: function (data) {
            window.location.href = $('#redirectUrl').val();
        },
        error: function (data) {
            console.log('Erreur:', data.responseText);
        }
    });
}