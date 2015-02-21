// MTA Lab
// Objective:

// Apply your knowledge of JavaScript to solve a problem we've already tackled in Ruby.
// Activity

// Create a program that models a simple subway system.

// The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
// Hints:

// Get the program to work for a single line before trying to tackle multiple lines.
// Don't worry about user input. Start off by just hardcoding your stop and line choices in local variables. You CAN use prompt() to read user input if you wish but we'll be redoing MTA with actual form inputs later. At this stage we're more interested in finding the routes than giving annoying the user with popups.
// Remember, you've done this in Ruby before. Look at your code and figure out how to do it in JavaScript.
// Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
// Make subway lines are keys in a hash, while the values are an array of all the stops on each line.
// The key to the lab is finding the index positions of each stop.
// Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)
// BIG HINT: Look through the Javascript array methods to see what's available to help you: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array


console.log('MTA Navigator');

var subway = {
  "Line N": ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  "Line L": ["8th", "6th", "Union Square", "3rd", "1st"],
  "Line 6": ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

// Storing values for calculation of route
var from_line = "Line L";
var from_station = "8th";
var to_line = "Line N";
var to_station = "Times Square";

// Turning stations into indexes
var from_station_index = subway[from_line].indexOf(from_station);
var to_station_index = subway[to_line].indexOf(to_station);

// Turning transfer intersections into indexes
var from_transfer_index = subway[from_line].indexOf("Union Square")
var to_transfer_index = subway[to_line].indexOf("Union Square")


// Creating arrays for each leg of the trip




// Calculate number of stops for all possible scenarios
if (from_station === to_station) {
  console.log("No need to travel! You are already at " + to_station + " station.");

} else if (from_line === to_line) {
  
  var total_stops = from_station_index > to_station_index ? from_station_index - to_station_index : to_station_index - from_station_index
  console.log("You will travel on the same line from " + from_station + " to " + to_station + ". You have a total of " + total_stops + " stop(s) to travel.")

  var stations = subway[from_line].slice(from_station_index, (to_station_index + 1))

  // if (from_station_index > to_station_index) {
  //   var total_stops = from_station_index - to_station_index
  //   var ordered_stations = stations
  // } else {
  //   var total_stops = to_station_index - from_station_index
  //   var ordered_stations = stations.reverse();
  // }

  

  // var stations = subway[from_line].slice(from_station_index, (to_station_index + 1))

  // var ordered_stations = from_station_index > to_station_index ? stations : stations.reverse();

  // console.log("Stations:")
  // for (var i = 0; i < total_stops + 1; i++){
  //   console.log(ordered_stations[i])
  // }

} else if (from_line != to_line && from_station_index === from_transfer_index) {
  
  var total_stops = to_station_index > to_transfer_index ? to_station_index - to_transfer_index : to_transfer_index - to_station_index
  console.log("You will have a total of " + total_stops + " stop(s) before disembarking at " + to_station + ".")
  
  var stations = subway[to_line].slice(to_transfer_index, (to_station_index + 1))

  // var ordered_stations = to_station_index > to_transfer_index ? stations : stations

  // console.log("Stations:")
  // for (var i = 0; i < total_stops + 1; i++){
  //   console.log(ordered_stations[i])
  // }
} else if (from_line != to_line && to_station_index == to_transfer_index) {
  var total_stops = from_station_index > to_transfer_index ? from_station_index - to_transfer_index : to_transfer_index - from_station_index
  console.log("You will have a total of " + total_stops + " stop(s) before disembarking at " + to_station + ".")

  // var stations = subway[to_line].slice(from_station_index, (to_transger_index + 1))
  // console.log("Stations:")
  // for (var i = 0; i < total_stops + 1; i++){
  //   console.log(stations[i])
  // }
} else {
  var first_leg = from_station_index > from_transfer_index ? from_station_index - from_transfer_index : from_transfer_index - from_station_index
  // var first_leg_stations = subway[from_line].slice(from_transfer_index, (from_station_index + 1))
  
  var second_leg = to_station_index > to_transfer_index ? to_station_index - to_transfer_index : to_transfer_index - to_station_index
  // var second_leg_stations = subway[to_line].slice(to_transfer_index, (to_station_index + 1))

  var total_stops = first_leg + second_leg
  console.log("You will have " + first_leg + " stop(s) before transferring at Union Square. After boarding your second train, you will have " + second_leg + " more stop(s) before disembarking at " + to_station + "station.")

  // var stations = first_leg_stations.concat(second_leg_stations)
  // console.log("Stations:")
  // for (var i = 0; i < total_stops + 1; i++){
  //   console.log(stations[i])
  // }
}
