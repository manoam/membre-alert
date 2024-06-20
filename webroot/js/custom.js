$(document).ready(function () {
    $('.navbar-nav .nav-link').each(function() {
        var href = window.location.href;
        if ($(this).attr('href') === href) {
            $(this).addClass('active');
        }
    });
    
    $('.select2').select2({
        dropdownParent: $("body"),
        allowClear: true
    });
});