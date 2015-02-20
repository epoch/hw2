// jQuery newbie so comment overkill

$(document).ready(function () {
  // Find the container div in the html
  $container = $(".container");

  // Iterate over Lines
  $.each( LINES, function( key, value ) {

    // Create a <ul></ul> with the class being the key
    var $line = $('<ul/>').addClass(key);

    // Iterate of the line (eg: N-line)
    $.each(value, function( index, value ) {

      // Create a new <li> element
      var $li = $('<li/>');

      var stationID = value + '|' + key

      // Create a label
      var $label = $("<label>").attr({for: stationID}).text(value);

      // Create a radio button
      var $radioBtn = $('<input type="radio">').attr({id: stationID, value: stationID, name: 'startStation'});

      // The contents of <li> is a station (value)
      $li.append($radioBtn, $label);

      // Add the <li> to the <ul>
      $line.append($li);
    }); 
    $container.append($line);
  });

  var $buttonNext = $("<button>").attr('id', 'nextButton').text("Next");
  $container.append($buttonNext);


  $("#nextButton").click(function(){
    var value = $("input[name=startStation]:checked").val()      
    console.log(value)
  });

});
