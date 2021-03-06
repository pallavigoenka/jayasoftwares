/**
 * Created by Ayush Agarwal on 19/12/14.
 */

$(document).ready(function () {
    $('#AboutUs').hide();
    $('#AboutUsSmall').hide();
    $('.navbar-fixed-top').hide();
    $('#trigger').waypoint(function () {
        $('.navbar-fixed-top').fadeIn('fast');
        $('#gotop').fadeIn('slow');
    });
    $('#gotop').hide();
    $('.navigator').waypoint(function () {
        $('.navbar-fixed-top').fadeOut('fast');
        $('#gotop').fadeOut('fast');
    });
    // navigation click actions
    var url = document.URL;
    if (url.indexOf("about.html") == -1) {
        $('#AboutUs li a, #AboutUsSmall li a').removeClass('scroll-link').removeAttr('data-id');
    }
    if (url.indexOf("about.html#") != -1) {
        $('.navbar-fixed-top').fadeIn('fast');
        $('#gotop').fadeIn('fast');
    }
    $('.scroll-link').on('click', function (event) {
        event.preventDefault();
        var sectionID = $(this).attr("data-id");
        scrollToID('#' + sectionID, 750);
    });
    // scroll to top action
    $('.scroll-top').on('click', function (event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0}, 'slow');
    });
});
// scroll function
function scrollToID(id, speed) {
    var offSet = 50;
    var targetOffset = $(id).offset().top - offSet;
    var mainNav = $('#main-nav');
    $('html,body').animate({scrollTop: targetOffset}, speed);
}
if (typeof console === "undefined") {
    console = {
        log: function () {
        }
    };
}