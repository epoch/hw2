console.log('sup');

// SPEC/ideas:
// needs to look inside of select options, get the value and compare it to the lines object
// the above should work like it did with the prompt answers in the vanilla js version

// still have a dropdown for stations (both station and line should default to N)
// but when the station is changed, a different set of options should be entered
// keep them separate with a class

// need to throw up the right dropdown menu of stations, depending on the line value
// use a conditional for this

// have a directions div fill up when all of the data has be put in an evaluated and a button has been clicked
// e.g. go! or plan my journey

// use the current JS logic, and when it's working refactor it to jQ

var lines = {
    'N': ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],
    'L': ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6': ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

// need to tidy this up so it hides the others if you try to pick again
var showStations = function() {
  if ($('#start-line-dropdown option:selected').val() === "N") {
    $('.start-stations-n').css("visibility", "visible");
    $('body').css("background-color", "blue");
  } else if ($('#start-line-dropdown option:selected').val() === "L") {
    $('.start-stations-l').css("visibility", "visible");
    $('body').css("background-color", "red");
  } else {
    $('.start-stations-6').css("visibility", "visible");
    $('body').css("background-color", "yellow");
  }
};

var showStationsFinish = function() {
  if ($('#finish-line-dropdown option:selected').val() === "N") {
    $('.finish-stations-n').css("visibility", "visible");
    $('body').css("background-color", "blue");
  } else if ($('#finish-line-dropdown option:selected').val() === "L") {
    $('.finish-stations-l').css("visibility", "visible");
    $('body').css("background-color", "red");
  } else {
    $('.finish-stations-6').css("visibility", "visible");
    $('body').css("background-color", "yellow");
  }
};

var planRoute = function() {
  $('#info').append('<p>Planning route...</p>');
  $('#info').append('<p>start line = ' + $('#start-line-dropdown option:selected').val() + '</p>');
  $('#info').append('<p>start station = ' + $('.start-stations-n option:selected').val() + '</p>');
  $('#info').append('<p>finish line = ' + $('#finish-line-dropdown option:selected').val() + '</p>');
  $('#info').append('<p>finish station = ' +  + '</p>');


};

// gets the value of the selected item in the chosen dropdown
$(document).ready(function() {

  $('#show-stations').on('click', showStations);
  $('#show-stations-finish').on('click', showStationsFinish);
  $('#plan-route').on('click', planRoute);

});






// have it work so that when you change the stations, there is a button to recalculate the route, so you
// don't need to refresh to go again


// the function that is triggered upon the click needs to determine the value
// of the dropdown selection and then show the right stations
// i.e. if they chose n line then make the n like dropdown visible


// var currentLine, currentStation, destinationLine, destinationStation;

// do
//   currentLine = prompt("Which line are you on?");
// while (lines[currentLine] === undefined)

// do
//   currentStation = prompt("Which station are you at?");
// while (lines[currentLine].indexOf(currentStation) === -1);

// do
//   destinationLine = prompt("What is your destination line?");
// while (lines[destinationLine] === undefined)

// do
//   destinationStation = prompt("What is your destination station?");
// while (lines[destinationLine].indexOf(destinationStation) === -1);

// // covers the 'leaving from US but going to a different line or vice versa' error
// if (currentStation === "Union Square") {
//   currentLine = destinationLine;
// }
// if (destinationStation === "Union Square") {
//   destinationLine = currentLine;
// }

// var currentStationIndex = lines[currentLine].indexOf(currentStation)
// var destinationStationIndex = lines[destinationLine].indexOf(destinationStation)
// var currentLineUSIndex = lines[currentLine].indexOf("Union Square")
// var destinationLineUSIndex = lines[destinationLine].indexOf("Union Square")

// var totalStops;
// if (currentLine === destinationLine) {
//   totalStops = Math.abs(currentStationIndex - destinationStationIndex);
// } else {
//   var stopsToUnionSquare = Math.abs(currentStationIndex - currentLineUSIndex);
//   var stopsFromUnionSquare = Math.abs(destinationStationIndex - destinationLineUSIndex);
//   totalStops = stopsToUnionSquare + stopsFromUnionSquare;
// }

// if (totalStops === 0) {
//   console.log("You're already there, dummy.");
// } else {

//   console.log("Total stops: " + totalStops);
//   // single-line journey
//   if (currentLine == destinationLine) {
//     // if going forwards
//     console.log("Starting at " + currentStation);
//     if (currentStationIndex < destinationStationIndex) {
//       for (var i = currentStationIndex + 1; i < destinationStationIndex; i++) {
//         console.log("You will pass " + lines[currentLine][i]);
//       }
//     } else {
//       // else if going backwards
//       for (var i = currentStationIndex - 1; i > destinationStationIndex; i--) {
//         console.log("You will pass " + lines[currentLine][i]);
//       }
//     }
//     // 2 leg journey
//   } else {
//     console.log("Starting at " + currentStation);
//     // 1st leg forwards and backwards
//     if (currentStationIndex < currentLineUSIndex) {
//       for (var i = currentStationIndex + 1; i < currentLineUSIndex; i++) {
//         console.log("You will pass " + lines[currentLine][i]);
//       }
//     } else {
//       for (var i = currentStationIndex - 1; i > currentLineUSIndex; i--) {
//         console.log("You will pass " + lines[currentLine][i]);
//       }
//     }

//     console.log("Change at Union Square");

//     // 2nd leg forwards and backwards
//     if (destinationLineUSIndex < destinationStationIndex) {
//       for (var i = destinationLineUSIndex + 1; i < destinationStationIndex; i++) {
//         console.log("You will pass " + lines[destinationLine][i]);
//       }
//     } else {
//       for (var i = destinationLineUSIndex - 1; i > destinationStationIndex; i--) {
//         console.log("You will pass " + lines[destinationLine][i]);
//       }
//     }
//   }
//   console.log("You will end you journey at " + lines[destinationLine][destinationStationIndex]);
// }
