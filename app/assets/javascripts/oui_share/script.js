$(document).foundation({
  orbit: {
    animation: 'slide',
    timer_speed: 1000,
    pause_on_hover: true,
    animation_speed: 500,
    navigation_arrows: false,
    bullets: false,
    next_on_click: true
  }
});

$(window).load(function() {
    function language() {
        var lingua = $("#l18n").val();
        window.location = lingua;
    }
    $("#l18n").change(language);

});
