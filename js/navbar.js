/**
 * Created by Ayush Agarwal on 23/12/14.
 */
$(document).ready(function () {
    $('#display, #AboutUs').hover(
        function () {
            $('#AboutUs').show();
        },
        function () {
            $('#AboutUs').hide();
        }
    );
    $('#display_small, #AboutUsSmall').hover(
        function () {
            $('#AboutUsSmall').show();
        },
        function () {
            $('#AboutUsSmall').hide();
        }
    );
});
