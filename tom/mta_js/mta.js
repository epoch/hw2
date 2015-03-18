var lines = {
    'N': ['Times Square', '34th', '28th', '23rd', 'Union Square', '3rd', '1st'],
    'L': ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6': ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

var currentLine, currentStation, destinationLine, destinationStation;

do
  currentLine = prompt("Which line are you on?");
while (lines[currentLine] === undefined)

do
  currentStation = prompt("Which station are you at?");
while (lines[currentLine].indexOf(currentStation) === -1);

do
  destinationLine = prompt("What is your destination line?");
while (lines[destinationLine] === undefined)

do
  destinationStation = prompt("What is your destination station?");
while (lines[destinationLine].indexOf(destinationStation) === -1);

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
  console.log("You're already there, dummy.");
} else {

  console.log("Total stops: " + totalStops);
  // single-line journey
  if (currentLine == destinationLine) {
    // if going forwards
    console.log("Starting at " + currentStation);
    if (currentStationIndex < destinationStationIndex) {
      for (var i = currentStationIndex + 1; i < destinationStationIndex; i++) {
        console.log("You will pass " + lines[currentLine][i]);
      }
    } else {
      // else if going backwards
      for (var i = currentStationIndex - 1; i > destinationStationIndex; i--) {
        console.log("You will pass " + lines[currentLine][i]);
      }
    }
    // 2 leg journey
  } else {
    console.log("Starting at " + currentStation);
    // 1st leg forwards and backwards
    if (currentStationIndex < currentLineUSIndex) {
      for (var i = currentStationIndex + 1; i < currentLineUSIndex; i++) {
        console.log("You will pass " + lines[currentLine][i]);
      }
    } else {
      for (var i = currentStationIndex - 1; i > currentLineUSIndex; i--) {
        console.log("You will pass " + lines[currentLine][i]);
      }
    }

    console.log("Change at Union Square");

    // 2nd leg forwards and backwards
    if (destinationLineUSIndex < destinationStationIndex) {
      for (var i = destinationLineUSIndex + 1; i < destinationStationIndex; i++) {
        console.log("You will pass " + lines[destinationLine][i]);
      }
    } else {
      for (var i = destinationLineUSIndex - 1; i > destinationStationIndex; i--) {
        console.log("You will pass " + lines[destinationLine][i]);
      }
    }
  }
  console.log("You will end you journey at " + lines[destinationLine][destinationStationIndex]);
}
