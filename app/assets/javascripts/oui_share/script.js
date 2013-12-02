$(window).load(function() {
    function language() {
        var lingua = $("#l18n").val();
        window.location = lingua;
    }
    $("#l18n").change(language);
});
