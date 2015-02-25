// Your top choices
// Create an array to hold your top choices (colors, presidents, whatever).

// For each choice, log to the screen a string like: "My #1 choice is blue."

var faveCities = ["Paris", "London", "Moscow", "Dublin", "Melbourne"]

for (var i = 0; i < faveCities.length; i++) {
  console.log("My #" + (i + 1) + " choice is " + faveCities[i]);
};

// Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice", picking the right suffix for the number based on what it is.

for (var i = 0; i < faveCities.length; i++) {
  if (i === 0) {
    console.log("My " + (i + 1) + "st choice is " + faveCities[i]);
  } else if (i === 1) {
    console.log("My " + (i + 1) + "nd choice is " + faveCities[i]);
  } else if (i === 2) {
    console.log("My " + (i + 1) + "rd choice is " + faveCities[i]);
  } else{
    console.log("My " + (i + 1) + "th choice is " + faveCities[i]);
  };
}