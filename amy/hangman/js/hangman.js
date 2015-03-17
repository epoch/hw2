console.log('hangman js');

$(document).ready(function(){

  var generateWord = function(event){
    event.preventDefault();
    $('.hangman').empty();
    $('.word').empty();

    console.log('Computer word is: ' + word);

    for (var i = 0; i < letters.length; i++) {
      letter = letters[i];
      letterDiv = $('<div></div>').addClass('letter-div');
      letterP = $('<p></p>').addClass('letter-p hide-letter').text(letter);
      letterDiv.append(letterP);
      letterDiv.appendTo($('.word'));
    };
  };

  var getLetter = function(event){
    event.preventDefault();
    $('.message').empty();

    var $letter = $('#letter').val();
    console.log ('letter is:' + $letter);

    // checks if the letter has alrady been used 
    if (_.contains(usedLetters, $letter) === false){
      letterDiv = $('<div></div>').addClass('used-letter-div');
      letterP = $('<p></p>').addClass('used-letter-p').text($letter);
      letterDiv.append(letterP);
      letterDiv.appendTo($('.used-letters'));  
      usedLetters.push($letter);
      console.log('used letters are: ' + usedLetters);

      checkLetterMatch();
      $('#letter').val('');
    }
    else{
      $('.message').append($('<p></p>').text("You've already chosen that letter"));
    };  
  };

  var checkLetterMatch = function(){
  
    $letter = $('#letter').val();
    console.log('checking letter: ' + $letter);

    if (_.contains(letters, $letter) === true){
      $( "p:contains(" + $letter + ")" ).removeClass('hide-letter');
      $('.message').append($('<p></p>').text('Good guess! Pick another letter or guess the word.'));
    }else{
      console.log('nope soz');
      $('.message').append($('<p></p>').text('Naww, try another letter.'));

    };

    checkIfWon();
    checkIfLost();

  };

  var checkIfWon = function(){

  }

  var checkIfLost = function(){

  }


  $('#letter-btn').on('click', getLetter);  
  $('#play-game-btn').on('click', generateWord);

});


// if used letters length is 26, no more turns, show answer


var words = ["waste",
 "donkey",
 "fat",
 "detailed",
 "cut",
 "powerful",
 "blushing",
 "second",
 "omniscient",
 "skirt",
 "box",
 "communicate",
 "milk",
 "face",
 "hobbies",
 "hour",
 "pack",
 "callous",
 "plug",
 "grate",
 "anxious",
 "breathe",
 "nonchalant",
 "manage",
 "pizzas",
 "toad",
 "dream",
 "multiply",
 "grateful",
 "psychedelic",
 "water",
 "loss",
 "rejoice",
 "flowers",
 "cent",
 "curved",
 "baby",
 "puncture",
 "side",
 "weight",
 "stretch",
 "hug",
 "duck",
 "telephone",
 "launch",
 "warm",
 "rhythm",
 "relieved",
 "mist",
 "jar",
 "vein",
 "energetic",
 "nasty",
 "quirky",
 "wealth",
 "symptomatic",
 "jumbled",
 "surprise",
 "crack",
 "vanish",
 "monkey",
 "phone",
 "snotty",
 "defiant",
 "slow",
 "duck",
 "telephone",
 "launch",
 "warm",
 "rhythm",
 "relieved",
 "mist",
 "jar",
 "vein",
 "energetic",
 "nasty",
 "quirky",
 "wealth",
 "symptomatic",
 "jumbled",
 "surprise",
 "crack",
 "vanish",
 "monkey",
 "phone",
 "snotty",
 "defiant",
 "slow",
 "hand",
 "representative",
 "rub",
 "annoy",
 "excited",
 "duck",
 "telephone",
 "launch",
 "warm",
 "rhythm",
 "relieved",
 "mist",
 "jar",
 "vein",
 "energetic",
 "nasty",
 "quirky",
 "wealth",
 "symptomatic",
 "jumbled",
 "surprise",
 "crack",
 "vanish",
 "monkey",
 "phone",
 "snotty",
 "defiant",
 "slow",
 "hand",
 "representative",
 "rub",
 "annoy",
 "excited",
 "ratty",
 "reproduce",
 "command",
 "lip",
 "foregoing",
 "eye",
 "duck",
 "telephone",
 "launch",
 "warm",
 "rhythm",
 "relieved",
 "mist",
 "jar",
 "vein",
 "energetic",
 "nasty",
 "quirky",
 "wealth",
 "symptomatic",
 "jumbled",
 "surprise",
 "crack",
 "vanish",
 "monkey",
 "phone",
 "snotty",
 "defiant",
 "slow",
 "hand",
 "representative",
 "rub",
 "annoy",
 "excited",
 "ratty",
 "reproduce",
 "command",
 "lip",
 "foregoing",
 "eye",
 "trousers",
 "rot",
 "snail",
 "meeting",
 "cautious",
 "tacit",
 "visitor",
 "coil",
 "point",
 "duck",
 "telephone",
 "launch",
 "warm",
 "rhythm",
 "relieved",
 "mist",
 "jar",
 "vein",
 "energetic",
 "nasty",
 "quirky",
 "wealth",
 "symptomatic",
 "jumbled",
 "surprise",
 "crack",
 "vanish",
 "monkey",
 "phone",
 "snotty",
 "defiant",
 "slow",
 "hand",
 "representative",
 "rub",
 "annoy",
 "excited",
 "ratty",
 "reproduce"]

var word = _.sample(words);

var letters = word.split('');

var usedLetters = [];
