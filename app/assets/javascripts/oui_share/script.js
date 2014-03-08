$(document).foundation('orbit', {
    animation: 'slide',
    timer_speed: 6000,
    pause_on_hover: false,
    resume_on_mouseout: true,
    animation_speed: 500,
    slide_number: false,
    next_class: 'orbit-next',
    prev_class: 'orbit-prev',
    circular: true,
    variable_height: true,
    timer: true
});
$(document).foundation();

$(window).load(function() {
    function language() {
        var lingua = $(".l18n").val();
        window.location = lingua;
    }
    $(".l18n").change(language);

    $(".orbit-bullets li.active").prepend("<span class='active-bullet'></span>");

    $("#slideshow").on("orbit:after-slide-change", function(event, orbit) {
        $(".orbit-bullets li").html("");
        $(".orbit-bullets li.active").prepend("<span class='active-bullet'></span>");
    });

    var container = document.querySelector('.more-content ul');
    var column = document.querySelector('.more-content ul li');
    var msnry = new Masonry( container, column,  {
        // options
        columnWidth: column ,
        itemSelector: 'li'
    });

    $('#custom').click(function(){
        $('#value-custom').prop( "checked", true );
        $(this).val("");
    });

    $('input#email').click(function(){
        $(this).val("");
    });

    $(".dolar").hide();
    $("#currency .usd").click(function() {
        $("a.currency").html("$");
        $(".euro").hide();
        $(".dolar").show();
    });
    $("#currency .eur").click(function() {
        $("a.currency").html("€");
        $(".dolar").hide();
        $(".euro").show();
    });
});

jQuery(function () {
    jQuery("#custom").keydown(function(event) {
        // Allow: backspace, delete, tab and escape
        if ( event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 ||
             // Allow: Ctrl+A
             (event.keyCode == 65 && event.ctrlKey === true) ||
             // Allow: home, end, left, right
             (event.keyCode >= 35 && event.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if ( event.shiftKey|| (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 ) )
            {
                event.preventDefault();
            }
        }
    });
});

$(window).bind("load", function () {
    var footer = $("#footer");
    var pos = footer.position();
    var height = $(window).height();
    height = height - pos.top;
    height = height - footer.height();
    if (height > 0) {
        footer.css({
            'margin-top': height + 'px'
        });
    }
});
