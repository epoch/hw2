var top_choices = ["Del Piero", "Totti", "Cassano", "Pirlo", "Maldini"];

for (i = 0; i < 5; i++) {

  var suffix;
  if (i === 0) {
    suffix = "st";
  } else if (i === 1) {
    suffix = "nd";
  } else if (i === 2) {
    suffix = "rd";
  } else {
    suffix = "th";
  };


  console.log("My " + (i+1) + suffix + " choice is " + top_choices[i]);
};
