/**
 * Created by Ayush Agarwal on 23/12/14.
 */
$(document).ready(function () {
    $('#display, #AboutUs, #AboutUsSmall').hover(
        function () {
            $(this).addClass('visible');
            $('#AboutUs').show('slow');
            $('#AboutUsSmall').show('slow');
        },
        function () {
            $(this).removeClass('visible');
            if ($('#display, #AboutUs, #AboutUsSmall').hasClass('visible')) {
                return;
            }
            else {
                $('#AboutUs').hide('slow');
                $('#AboutUsSmall').hide('slow');
            }
        }
    );
});