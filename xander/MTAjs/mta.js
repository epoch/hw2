var lines = {
  'N': ["8th", "Union Square", "23rd", "28th", "34th", "Times Square"],
  'L': ["1st", "3rd", "Union Square", "6th", "8th"],
  '6': ["Astor Place", "Union Square", "23rd", "28th", "33rd", "Grand Central"]
};

var userInputCurrent = 'N-34th';
var userInputDestination = 'N-23rd';

var currentLine = userInputCurrent.slice(0,1);
var currentStation = userInputCurrent.slice(2);
var destinationLine = userInputDestination.slice(0,1);
var destinationStation = userInputDestination.slice(2);

if (currentLine === destinationLine) {
  var start_index = lines[currentLine].indexOf(currentStation);
  var finish_index = lines[destinationLine].indexOf(destinationStation);
  var stationsPassed;
  if (start_index < finish_index) {
    stationsPassed = lines[currentLine].slice(start_index, finish_index);
  }
  else {
    stationsPassed = lines[currentLine].slice(finish_index, start_index);
  }
  console.log(stationsPassed);
}
var changeLines = 'You will not be required to change lines on this journey.';

var current_start_index = lines[currentLine].indexOf(currentStation);
var current_union_square = lines[currentLine].indexOf("Union Square");
var destination_union_square = lines[destinationLine].indexOf("Union Square");
var destination_finish_index = lines[destinationLine].indexOf(destinationStation); 



