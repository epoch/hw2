console.log('hangman js');

$(document).ready(function(){

  var generateWord = function(event){
    // event.preventDefault();

    console.log('generate word running');
    // $('.hangman').empty();
    // $('.word').empty();

    word = _.sample(words);
    letters = word.split('')

    console.log('Computer word is: ' + word);

    for (var i = 0; i < letters.length; i++) {
      letter = letters[i];
      letterDiv = $('<div></div>').addClass('letter-div');
      letterP = $('<p></p>').addClass('letter-p hide-letter').text(letter);
      letterDiv.append(letterP);
      letterDiv.appendTo($('.word'));
    };
  };
  generateWord();

  var getLetter = function(event){
    console.log('get letter running');
    event.preventDefault();
    $('.message').empty();

    var $letter = $('#letter').val();
    console.log ('letter is:' + $letter);

    // checks if the letter has alrady been used 
    if (_.contains(usedLetters, $letter) === false){
 
      usedLetters.push($letter);
      console.log('used letters are: ' + usedLetters);

      checkLetterMatch();
      calcRemainingLetters();
      $('#letter').val('');
    }
    else{
      $('.message').append($('<p></p>').text("You've already chosen that letter"));
    };  
  };

  var calcRemainingLetters = function(){
    $('.remaining-letters').empty();

    var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
    remainingLetters = $(alphabet).not(usedLetters).get();
           // debugger;
    for (var i = 0; i < remainingLetters.length; i++) {
      letter = remainingLetters[i];
      letterDiv = $('<div></div>').addClass('remaining-letter-div');
      letterP = $('<p></p>').addClass('remaining-letter-p').text(letter);
      letterDiv.append(letterP);
      letterDiv.appendTo($('.remaining-letters')); 

    };


  }

  var checkLetterMatch = function(){
  
    $letter = $('#letter').val();
    console.log('checking letter: ' + $letter);

    if (_.contains(letters, $letter) === true){
      $( "p:contains(" + $letter + ")" ).removeClass('hide-letter');
      $('.message').append($('<p></p>').text('Good guess! Pick another letter or guess the word.'));
    }else{
      console.log('nope soz');
      wrongLetterCount++
      makeHangman();
      $('.message').append($('<p></p>').text('Naww, try another letter.'));

    };

    checkIfWon();
    checkIfLost();

  };

  var makeHangman = function(){
    console.log('makiing hngman');
    console.log('wrong letter count: ' + wrongLetterCount);

    if(wrongLetterCount === 1){
      $(".base").css("border-color", "red");
    }
    if(wrongLetterCount === 2){
      $('.left-bar').css("border-color", "red");
    }
    if(wrongLetterCount === 3){
      $('.top-bar').css("border-color", "red");
    }
    if(wrongLetterCount === 4){
    $('.side-bar').css("border-color", "red");
    }
    if(wrongLetterCount === 5){
      $('.noose').css("border-color", "red");
    }
    if(wrongLetterCount === 6){
      $('.head').css("border-color", "red");
    }
    if(wrongLetterCount === 7){
      $('.body').css("border-color", "red");
    }
    if(wrongLetterCount === 8){
      $('.arms').css("border-color", "red");
    }
    if(wrongLetterCount === 9){
      $('.l-leg').css("border-color", "red");
    }
    if(wrongLetterCount === 10){
      $('.r-leg').css("border-color", "red");
      userLoses();
    }

  }

  var checkIfWon = function(){

    // user wins if guesses all letters
    if ($('p').hasClass('hide-letter') === false){
      userWins();
    } 

  }

  var checkIfLost = function(){

    // user looes if turns exceed 10


  }

  var checkGuess= function(event){
    console.log('check guess running');
    event.preventDefault();
    console.log('checking word');

    guess = $('#word').val();

    debugger;

    if (guess === word) {
      userWins();
    }else{
      $('.message').append($('<p></p>').text('Wrong, try again!'));
    };

  }

  var userWins = function(){
    $('.message').append($('<p></p>').text('You win!'));
    $('.reset-content').empty();
    $('a').removeClass('hide');
  }

  var userLoses = function(){
    $('.message').append($('<p></p>').text('You lose. Play again?'));
    $('.reset-content').empty();
    $('a').removeClass('hide');
  }



  // event handlers
  $('#letter-btn').on('click', getLetter);  
  $('#word-btn').on('click', checkGuess);
  $('.play-again').on('click', function(){
    window.location.reload();
  });

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

var remainingLetters = [];

var wrongLetterCount = 0;


