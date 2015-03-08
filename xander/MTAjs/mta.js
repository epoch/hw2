var lines = {
  'N': ["8th", "Union Square", "23rd", "28th", "34th", "Times Square"],
  'L': ["1st", "3rd", "Union Square", "6th", "8th"],
  '6': ["Astor Place", "Union Square", "23rd", "28th", "33rd", "Grand Central"]
};

var userInputCurrent = prompt('Where are you?');
var userInputDestination = prompt('Where are you going?');
var currentLine = userInputCurrent.slice(0,1);
var currentStation = userInputCurrent.slice(2);
var destinationLine = userInputDestination.slice(0,1);
var destinationStation = userInputDestination.slice(2);
var currentStartIndex;
var currentUnionSquare;
var destinationUnionSquare;
var destinationFinishIndex;
var stationsPassed;
var currentStationsPassed;
var destinationStationsPassed;
var changeLines;

if ( currentLine != 'L' && currentLine != 'N' && currentLine != '6') {
  console.log("That line doesn't exist! Please try again.");
  if (lines[currentLine].indexOf(currentStation) === -1 || lines[destinationLine].indexOf(destinationStation) === -1) {
      console.log("That station doesn't exist! Please try again.");
  }   
}

if (currentLine === destinationLine) {
  var startIndex = lines[currentLine].indexOf(currentStation);
  var finishIndex = lines[destinationLine].indexOf(destinationStation);
  changeLines = 'You will not be required to change lines on this journey.';
  
  if (startIndex < finishIndex) {
  stationsPassed = lines[currentLine].slice(startIndex, finishIndex); 
  } else {
    stationsPassed = lines[currentLine].slice(finishIndex, startIndex);  
  }
}

changeLines = 'You will need to change to line ' + destinationLine + ' at Union Square.';
currentStartIndex = lines[currentLine].indexOf(currentStation);
currentUnionSquare = lines[currentLine].indexOf("Union Square");
destinationUnionSquare = lines[destinationLine].indexOf("Union Square");
destinationFinishIndex = lines[destinationLine].indexOf(destinationStation); 
      
if (currentStartIndex < currentUnionSquare) {
  currentStationsPassed = lines[currentLine].slice(currentStartIndex, currentUnionSquare);
} else {
  currentStationsPassed = lines[currentLine].slice(currentUnionSquare, currentStartIndex);
  currentStationsPassed = currentStationsPassed.reverse();
}

if (destinationFinishIndex < destinationUnionSquare) {
  destinationStationsPassed = lines[destinationLine].slice(destinationFinishIndex, (destinationUnionSquare - 1));
  destinationStationsPassed = destinationStationsPassed.reverse();
} else {
  destinationStationsPassed = lines[destinationLine].slice((destinationUnionSquare + 1), destinationFinishIndex);
}
stationsPassed = currentStationsPassed.concat(destinationStationsPassed);
  
var numberOfStops = (stationsPassed.length);

console.log('You are travelling from ' + currentStation + ' station on Line ' + currentLine + ', to ' + destinationStation + ' station on Line ' + destinationLine + '. ' + changeLines + ' You will pass ' + numberOfStops + ' stations before you arrive at ' + destinationStation + ' station on Line ' + destinationLine + '.');

console.log('Your journey will encompass the following stops: ' + stationsPassed.join(', ') + '.')
