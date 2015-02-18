// https://gist.github.com/wofockham/dbd3967ecd01a397abe9

// Create an array to hold your top choices (colors, presidents, whatever).
// For each choice, log to the screen a string like: "My #1 choice is blue."

my_array = ['choc seasalt', 'choc caramel', 'cookies and cream', 'choc lime']

for (var i = 0; i < my_array.length; i = i + 1) {

  console.log("My #"+ (i + 1) +" choice is " + my_array[i] + ".")

};

// Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice",
// picking the right suffix for the number based on what it is.

my_array_2 = ['choc seasalt', 'choc caramel', 'cookies and cream', 'choc lime', "choc orange"]

for (var i = 0; i < my_array_2.length; i = i + 1) {

  if(i === 0){
      var suffix = "st";
    } else if (i === 1){
      var suffix = "nd";
    }else if (i === 2){
      var suffix = "rd";
    }else {
      var suffix = "th";
    };
    console.log("My " + (i + 1) + suffix + " choice is " + my_array_2[i] + ".");
  };

