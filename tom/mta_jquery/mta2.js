// list the stations available to the user for the chosen line (or each at a push)

var lines = {
  'N': ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],
  'L': ['8th', '6th', 'Union Square', '3rd', '1st'],
  '6': ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

$(document).ready(function() {

  var planRoute = function() {

    // emptys div so that new journeys replace old info, instead of just being added at the bottom
    $('#info').empty();
    $('#info').css("visibility", "visible");

    var currentLine, currentStation, destinationLine, destinationStation;

    currentLine = $('#start-line').val();
    currentStation = $('#start-station').val();
    destinationLine = $('#end-line').val();
    destinationStation = $('#end-station').val();

    // covers the 'leaving from US but going to a different line or vice versa' error
    if (currentStation === "Union Square") {
      currentLine = destinationLine;
    }
    if (destinationStation === "Union Square") {
      destinationLine = currentLine;
    }

    var currentStationIndex = lines[currentLine].indexOf(currentStation)
    var destinationStationIndex = lines[destinationLine].indexOf(destinationStation)
    var currentLineUSIndex = lines[currentLine].indexOf("Union Square")
    var destinationLineUSIndex = lines[destinationLine].indexOf("Union Square")

    var totalStops;
    if (currentLine === destinationLine) {
      totalStops = Math.abs(currentStationIndex - destinationStationIndex);
    } else {
      var stopsToUnionSquare = Math.abs(currentStationIndex - currentLineUSIndex);
      var stopsFromUnionSquare = Math.abs(destinationStationIndex - destinationLineUSIndex);
      totalStops = stopsToUnionSquare + stopsFromUnionSquare;
    }

    if (totalStops === 0) {
      $('#info').append("<p>You're already there, dummy.</p>");
    } else {

      $('#info').append("<p>Total stops: " + totalStops + "</p>");
      // single-line journey
      if (currentLine == destinationLine) {
        // if going forwards
        $('#info').append("<p>Starting at " + currentStation + "</p>");
        if (currentStationIndex < destinationStationIndex) {
          for (var i = currentStationIndex + 1; i < destinationStationIndex; i++) {
            $('#info').append("<p>You will pass " + lines[currentLine][i] + "</p>");
          }
        } else {
          // else if going backwards
          for (var i = currentStationIndex - 1; i > destinationStationIndex; i--) {
            $('#info').append("<p>You will pass " + lines[currentLine][i] + "</p>");
          }
        }
        // 2 leg journey
      } else {
        $('#info').append("<p>Starting at " + currentStation + "</p>");
        // 1st leg forwards and backwards
        if (currentStationIndex < currentLineUSIndex) {
          for (var i = currentStationIndex + 1; i < currentLineUSIndex; i++) {
            $('#info').append("<p>You will pass " + lines[currentLine][i] + "</p>");
          }
        } else {
          for (var i = currentStationIndex - 1; i > currentLineUSIndex; i--) {
            $('#info').append("<p>You will pass " + lines[currentLine][i] + "</p>");
          }
        }

        $('#info').append("<p>Change at Union Square</p>");

        // 2nd leg forwards and backwards
        if (destinationLineUSIndex < destinationStationIndex) {
          for (var i = destinationLineUSIndex + 1; i < destinationStationIndex; i++) {
            $('#info').append("<p>You will pass " + lines[destinationLine][i] + "</p>");
          }
        } else {
          for (var i = destinationLineUSIndex - 1; i > destinationStationIndex; i--) {
            $('#info').append("<p>You will pass " + lines[destinationLine][i] + "</p>");
          }
        }
      }
      $('#info').append("<p>You will end you journey at " + lines[destinationLine][destinationStationIndex] + "</p>");
    }
  };

  $('#plan-route').on('click', planRoute);

});