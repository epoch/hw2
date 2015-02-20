$(document).ready(function () {
  // Find the container div in the html
  $container = $(".container");

  // Iterate over Lines
  $.each( LINES, function( key, value ) {

    // Create a <ul></ul> with the class being the key
    var $line = $('<ul/>').addClass(key);

    // Iterate of the line (eg: N-line)
    $.each(value, function( index, value ) {

      // Creata a new <li> element
      var $li = $('<li/>');

      // The contents of <li> is a station (value)
      $li.html(value);

      // Add the <li> to the <ul>
      $line.append($li);
    }); 
    $container.append($line);
  });  
});
