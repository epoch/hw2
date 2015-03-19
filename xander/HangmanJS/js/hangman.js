var words = [
  'laptop',
  'bullet',
  'london',
  'soccer',
  'thrilling',
  'amazing',
  'sneakers',
  'international',
  'cardiovascular',
  'incremental',
  'presidential',
  'various',
  'incidentally',
  'fascinating',
  'greatly',
  'lately',
  'apart',
  'unknown',
  'thought'
];

var guess = 0;

$(document).ready(function() {

  var word = words[Math.floor(Math.random() * words.length)];
  console.log(word);

  var answerArray = [];
  for (var i = 0; i < word.length; i++) {
    answerArray += "_ ";
  }

  var alterAt = function(n, c, word) {
    return word.substr(0, n) + c + word.substr(n + 1, word.length);
  }

  $('.btn').on('click', function() {
    guess = this;
    debugger;
    console.log($(this).text());
  });

  $('#question').append(answerArray);
  var remainingLetters = word.length;

  while ( remainingLetters > 0 ) {

    if (guess === null) {
      break;
    } else if (guess.length != 1) {
      alert('Please enter a single letter.');
    } else {
      for (var j = 0; j < word.length; j++) {
        if (word[j] === guess) {
          answerArray[j] = guess;
          remainingLetters--;
        }
      }
    }
  };
  $('#answer').append(word);

});





