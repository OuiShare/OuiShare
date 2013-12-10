$(window).load(function() {
    function language() {
        var lingua = $("#l18n").val();
        window.location = lingua;
    }
    $("#l18n").change(language);

    var imgArr = new Array( // relative paths of images
        '/assets/home/bg/welcome.jpg',
        '/assets/home/bg/welcome_red.jpg',
        '/assets/home/bg/welcome_blue.jpg'
    );

    var preloadArr = new Array();
    var i;

    /* preload images */
    for(i=0; i < imgArr.length; i++){
        preloadArr[i] = new Image();
        preloadArr[i].src = imgArr[i];
    }

    var currImg = 1;

    /* image rotator */
    function changeImg(){
        $('#welcome').animate({opacity: 0}, 1000, function(){
            $(this).css('background','url(' + preloadArr[currImg++%preloadArr.length].src +') top center no-repeat');
        }).animate({opacity: 1}, 1000);
    }

    $(".arrows .left").click(changeImg);
    $(".arrows .right").click(changeImg);
});
