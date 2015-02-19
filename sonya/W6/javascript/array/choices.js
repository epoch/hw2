/*Your top choices
Create an array to hold your top choices (colors, presidents, whatever).
For each choice, log to the screen a string like: "My #1 choice is blue."
Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice", 
picking the right suffix for the number based on what it is.
*/

var topColors = ['blue', 'red', 'black'];
  for (var i = 0; i < topColors.length; i++) {
    console.log('My #' + (i + 1) + ' choice is ' + topColors[i]);
  };

var topDogs = ['Bay', 'Willie', 'Ace', 'Bruce'];
  for (var i = 0; i < topDogs.length; i++) {
    var topDogsNum = i + 1;
    var topDogsNumSuffix;
    if (topDogsNum === 1) {
      topDogsNumSuffix = 'st';
    } else if (topDogsNum === 2) {
      topDogsNumSuffix = 'nd';
    } else if (topDogsNum === 3) {
      topDogsNumSuffix = 'rd';
    } else {
      topDogsNumSuffix = 'th';
    }
    console.log('My ' + topDogsNum + topDogsNumSuffix + ' choice is ' + topDogs[i]);
  };