/*
- Add a script tag to the bottom of the page for your code.
Add an event listener to the button so that it calls a makeMadLib function when clicked.
In the makeMadLib function, retrieve the current values of the form input elements, 
make a story from them, and output that in the story div (like "Pamela really likes pink cucumbers.")
*/

var makeMadLib = function() {
  var noun = document.getElementById("noun").value;
  var adjective = document.getElementById("adjective").value;
  var person = document.getElementById("person").value;
  // console.log('noun', 'adjective', 'person');
  // debugger; like pry for JS
  var storyDiv = document.getElementById("story");
  storyDiv.innerHTML = [person, 'really likes', adjective, noun].join(' ');
  // person + " licked a " + adjective + " " + noun + "...so weird!";
}

var libButton = document.getElementById('lib-button');
libButton.addEventListener('click', makeMadLib);