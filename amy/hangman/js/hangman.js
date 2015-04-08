// console.log('hangman js');

$(document).ready(function(){

  var generateWord = function(event){

    console.log('generate word running');
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

  var addLetter = function(){
    console.log('selecting letter');
    // debugger;
    $('#letter').val(this.innerHTML);
    // debugger;
  };

  var getLetter = function(event){
    console.log('get letter running');
    event.preventDefault();
    $('.message').empty();

    var $letter = $('#letter').val();
    console.log('letter is:' + $letter);

    // checks if the letter has alrady been used 
    if (_.contains(usedLetters, $letter) === false){
 
      usedLetters.push($letter);
      console.log('used letters are: ' + usedLetters);

      // debugger
      $letter = $('#letter').val();
      var lastSelected = $( "p:contains(" + $letter + ")" );

      $(lastSelected).parent().remove();
      checkLetterMatch();

      // calcRemainingLetters();

      $('#letter').val('');
    }
    else{
      $('.message').append($('<p></p>').text("You already chose '"+$letter+"'. Pick again."));
    };  
  };


  var calcRemainingLetters = function(){

    // $('.remaining-letters').remove();

    var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
    remainingLetters = $(alphabet).not(usedLetters).get();
    for (var i = 0; i < remainingLetters.length; i++) {
      letter = remainingLetters[i];
      letterDiv = $('<div></div>').addClass('remaining-letter-div');
      letterP = $('<p></p>').addClass('remaining-letter-p').text(letter);
      letterDiv.append(letterP);
      letterDiv.appendTo($('.remaining-letters')); 

    };
  }
  calcRemainingLetters();

  var checkLetterMatch = function(){
    // $(lastSelected).parent().remove();

    $letter = $('#letter').val();
    console.log('checking letter: ' + $letter);

    if (_.contains(letters, $letter) === true){
      $( "p:contains(" + $letter + ")" ).removeClass('hide-letter');
      $('.message').append($('<p></p>').text('Good choice! Pick another letter or guess the word.'));
    }else{
      console.log('nope soz');
      wrongLetterCount++
      $('.message').append($('<p></p>').text('Doh! Try another letter.'));
      makeHangman();
    };

    checkIfWon();
    checkIfLost();

  };

  var makeHangman = function(){
    console.log('makiing hngman');
    console.log('wrong letter count: ' + wrongLetterCount);

    // select the correct hangman part by the wrongLetterCount
    $('.hangman-'+wrongLetterCount).css("border-color", "red");

    if(wrongLetterCount === 10){
      userLoses();
    }
  }

  var checkIfWon = function(){
    // user wins if guesses all letters
    if ($('p').hasClass('hide-letter') === false && wrongLetterCount < 10){
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

    if (guess === word) {
      userWins();
    }else{
      $('.message').append($('<p></p>').text('Wrong, try again!'));
    };
  }

  var userWins = function(){
    $('.message').empty();
    $('.message').append($('<p></p>').text('You win!'));
    $('.reset-content').empty();
    $('a').removeClass('hide');
  }

  var userLoses = function(){
    $('.message').empty();
    $('.message').append($('<p></p>').text('You lose!'));
    $('.reset-content').empty();
    $('a').removeClass('hide');
  }


  // event handlers
  $('#letter-btn').on('click', getLetter); 
  $('.remaining-letter-p').on('click', addLetter) 
  $('#word-btn').on('click', checkGuess);
  $('#word-btn').on('keypress', function(){
      if(event.which != 13){
          return;
      }
      checkGuess();
  });
  $('.play-again').on('click', function(){
    window.location.reload();
  });

});

// game loop when you start it initializes certain things
// then the game is running
// and if you want to exit the game or save it then you break our of the loop
// so you have a bunch of steps in the game and while its running you are prompting them to 
// do someting 
// you break out of the loop when the user chooses to or they loose or win


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

// var lastSelected;

var wrongLetterCount = 0;


// to do:
// choose letters on click 
// words api
// css
// EATON are the most common letters in the english language


