$(document).ready(function () {
  var $nLine = $('<ul/>').addClass('n-line');
  $.each(LINES.nLine, function( index, value ) {
    var $li = $('<li/>');
    $li.html(value);
    $nLine.append($li);
  });
  $container = $(".container");
  $container.append($nLine);
});
