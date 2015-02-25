var subway = {
  N: ['Times Square', '34th', '28th on N', '23rd on N', 'Union Square', '8th on N'],
  L: ['8th on L', '6th', 'Union Square', '3rd', '1st'],
  Six: ['Grand Central', '33rd', '28th on Six', '23rd on Six', 'Union Square', 'Astor Place']
}

$(document).ready(function() {

  var buildSelect = function(lines) {
    $.each(lines, function(line, stops) {
      var optgroup = $('<optgroup/>');
      optgroup.addClass(line).attr( 'label', line + ' Line' );

      $.each(stops, function(index, name) {
        var option = $('<option/>');
        option.addClass(name).html(name);
        optgroup.append(option);
      });

      $('#origin, #destination').append(optgroup);
    });
  }

  buildSelect(subway);

  var journey = {

    singleLineJourney: function (line, stop1, stop2, subway) {
      var numStops;
      var stop;
      var $line = subway[line];
      var $originStation = $line.indexOf(stop1);
      var $destinationStation = $line.indexOf(stop2);

      $('#origin-selection').html(line + ' Line - ' + stop1);
      $('#destination-selection').html(line + ' Line - ' + stop2);

      if ($originStation <= $destinationStation) {
        stops = $line.slice($originStation, $destinationStation + 1);
        numStops = (stops.length) - 1;

        var listStops = stops.join(', ');

        var $stopsHeading = $('<h3/>').html('Stops');
        var $namesOfStops = $('<p/>').html(listStops);
        var $numberOfStops = $('<p/>').html('Stops: ' + numStops);

        $('.stops').append($stopsHeading, $namesOfStops, $numberOfStops);

      } else {
        stops = $line.slice($destinationStation, $originStation + 1);
        stops.reverse();
        numStops = (stops.length) - 1;

        var listStops = stops.join(', ');
        
        var $stopsHeading = $('<h3/>').html('Stops');
        var $namesOfStops = $('<p/>').html(listStops);
        var $numberOfStops = $('<p/>').html('Stops: ' + numStops);

        $('.stops').append($stopsHeading, $namesOfStops, $numberOfStops);

      };
    },
    
    multiLineJourney: function (line1, line2, stop1, stop2, subway) {
      var numStops;
      var stops;
      var $originLine = subway[line1];
      var $destinationLine = subway[line2];
      var $originIntersect = $originLine.indexOf('Union Square');
      var $destinationIntersect = $destinationLine.indexOf('Union Square');
      var $originStation = $originLine.indexOf(stop1);
      var $destinationStation = $destinationLine.indexOf(stop2);

      $('#origin-selection').html($originLine + ' Line - ' + $originStation);
      $('#destination-selection').html($destinationLine + ' Line - ' + $destinationStation);

      if ($originStation < $destinationStation) {
        var $originStops = $originLine.slice($originStation, $originIntersect);
        var $destinationStops = $destinationLine.slice($destinationIntersect, $destinationStation + 1);

        stops = $.merge($originStops, $destinationStops);
        numStops = (stops.length) - 1;

        var listStops = stops.join(', ');

        var $stopsHeading = $('<h3/>').html('Stops');
        var $namesOfStops = $('<p/>').html(listStops);
        var $numberOfStops = $('<p/>').html('Stops: ' + numStops);

        $('.stops').append($stopsHeading, $namesOfStops, $numberOfStops);

      } else if ($originStation > $destinationStation) {
        var originStops = $originLine.slice($originIntersect, $originStation + 1);
        var destinationStops = $destinationLine.slice($destinationStation, $destinationIntersect);
        
        stops = $.merge(destinationStops, originStops);
        numStops = (stops.length) - 1; 
        stops.reverse();
        
        var listStops = stops.join(', ');
  
        var $stopsHeading = $('<h3/>').html('Stops');
        var $namesOfStops = $('<p/>').html(listStops);
        var $numberOfStops = $('<p/>').html('Stops: ' + numStops);

        $('.stops').append($stopsHeading, $namesOfStops, $numberOfStops);

        $(stops).each(function(index, val) {
          stopNames = val;
        });

      } else if ($originStation === $destinationStation) {
        var originStop = $originLine.slice($originStation, $originIntersect + 1);
        var destinationStop = $destinationLine.slice($destinationStation, $destinationIntersect);
        destinationStop.reverse(); 

        stops = $.merge(originStop, destinationStop);
        numStops = (stops.length) - 1; 

        var listStops = stops.join(', ');
        
        var $stopsHeading = $('<h3/>').html('Stops');
        var $namesOfStops = $('<p/>').html(listStops);
        var $numberOfStops = $('<p/>').html('Stops: ' + numStops);

        $('.stops').append($stopsHeading, $namesOfStops, $numberOfStops);
      };
    }
  }

  $('#submit').click(function( e ) {
    var origin = $('#origin').find(':selected');
    var destination = $('#destination').find(':selected');

    var $originLine = origin.parent().prop('class');
    var $originStop = origin.val();

    var $destinationLine = destination.parent().prop('class');
    var $destinationStop = destination.val(); 

    if ($originLine === $destinationLine) {
      var $singleLine = $originLine;
      journey.singleLineJourney($singleLine, $originStop, $destinationStop, subway);
    } else if ($destinationStop === 'Union Square'){
      var $singleLine = $originLine;
      journey.singleLineJourney($singleLine, $originStop, $destinationStop, subway);
    } else if ($originStop === 'Union Square'){
      var $singleLine = $destinationLine;
      journey.singleLineJourney($singleLine, $originStop, $destinationStop, subway);
    }
    else {
      journey.multiLineJourney($originLine, $destinationLine, $originStop, $destinationStop, subway);
    };

  });

});
