$(function() {
  $('.navigation').click(function() {
    // this removes the underline class from all other ".navigation" links.
    $('.navigation').removeClass('currentlyActive');

    // this makes the one that was clicked underlined
    $(this).addClass('currentlyActive');
  });
});
