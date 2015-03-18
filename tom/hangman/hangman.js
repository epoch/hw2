// Need to use regular expressions to check the validity of a string
// Needs to make be able to search for multiple cases of the same letter
// Needs a way to check if the user has won.

// Might be a better idea to go through this whole problem again using the
// underscores as a design thing and actually having the work there but hidden
// with a CSS class that can be toggled.


// Array containing possible game words.
var dictionary = ['cat', 'blue', 'pizza', 'football'];
var gameWord;

// wordArray = ['t', 'o', 'm'];

var incorrectGuessLimit = 8;
var incorrectGuessCount = 0;
var incorrectGuesses = [];

// Chooses a random word from the dictionary.
var selectWord = function() {
  gameWord = dictionary[Math.floor(Math.random() * dictionary.length)];
}

// Draws the necessary amount of underscores for the gameWord.
var drawUnderscores = function() {
  for (var i = 0; i < gameWord.length; i++) {
    $('#underscores').append($('<span>_ </span>'));
  }
}

// Checks the user's guess against the gameWord.
var checkGuess = function() {
  var guess = $('#guess-input').val();

  if ($letterArray.indexOf(guess) === -1) {
    hangMan();
  } else {
    drawLetter();
  }
}

// Draws a correct guess on the gameboard.
var drawLetter = function() {

  // function drawLetters(string){
  //   return string.replace(/ /g, "\\$&");
  // }



  var guess = $('#guess-input').val();
  // var index = $letterArray.indexOf(guess);
  // var $span = $('span')[index];
  // $span.innerHTML = guess + ' ';

  // go through the array of spans
  // replace a span's innerHTML with guess if the index of guess is equal to that span's index in the loop.

  // Not working...
  if ($letterArray.indexOf(guess) != -1) {
    // debugger;
    var index = $letterArray.indexOf(guess);
    var $spanArray = $('span');
    var $span = $('span')[index];

    for (var i = 0; i < $spanArray; i++) {
      if (index === $spanArray[i]) {
        $spanArray[i].innerHTML = guess + ' ';
      }
      // $spanArray[i].replace('_', guess);
    }

    // $span.innerHTML = guess + ' ';
  }
}

// Draws part of the stickman for an incorrect guess.
var hangMan = function() {
  // Code to draw some of the hangman here. Start with crosses for now.
  var $cross = $('<span>&#10007;</span>');
  $('#crosses').append($cross);

  var guess = $('#guess-input').val();

  // Stops incorrect guesses being added twice.
  if (incorrectGuesses.indexOf(guess) === -1) {
    incorrectGuesses.push(guess)
    $('#incorrect-guesses').append(guess + ' ');
  }
  incorrectGuessCount = incorrectGuessCount + 1;
  gameOver();
}

// Tells the user they've lost when the incorrect guess limit is reached (and the hangman is drawn).
var gameOver = function() {
  if (incorrectGuessCount === incorrectGuessLimit) {
    $('#guess-input').remove();
    $('#submit').remove();
    $('#incorrect-guesses').append($('<h1>YOU LOSE</h1>'));
  }
}


$(document).ready(function() {

  selectWord();
  // Word array here is global so that it can be seen in other functions.
  $letterArray = gameWord.split('');
  drawUnderscores();

  $('#submit').on('click', function(e) {
    e.preventDefault();
    checkGuess();
    $('#guess-input').val('').focus();
  });

});
