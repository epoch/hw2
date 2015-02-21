// jQuery newbie so comment overkill

$(document).ready(function () {

  // Object to store client choices
  var mtaClient = {};


  // Find the container div in the html
  $container = $(".container");

  // Create a div to hold menu items
  var $menu = $('<div/>').addClass("menu");

  // Iterate over Train Lines
  $.each( LINES, function( key, value ) {

    // Create a <ul></ul> with the class being the key
    var $subwayLine = $('<ul/>').addClass(key);

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
      $subwayLine.append($li);
    }); 
    $menu.append($subwayLine);
  });

  var $buttonNext = $("<button>").attr('id', 'nextButton').text("Next");
  $menu.append($buttonNext);
  $menu.addClass('animated fadeInRight');
  $container.append($menu);

  $("#nextButton").click(function(){
    var value = $("input[name=startStation]:checked").val().split('|')
    mtaClient.startStation = value[0];
    mtaClient.startLine = value[1];
    $menu.addClass('animated fadeOutLeft');
    console.log(mtaClient.startStation);
    console.log(mtaClient.startLine);
    // Remove $menu
    $container.empty();
  });

});
