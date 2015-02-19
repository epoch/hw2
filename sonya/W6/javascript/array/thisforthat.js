/*
Write a function called randomThis() that picks a random "This" element from the array
Write a function called randomThat() that picks a random "That" element from the array
Write a function that prints a statement saying: 
"So.... your startup is basically like a like a this for that?" 
It should print a new statement each time the function is called.
*/

var _this = ["Brothel", "Bitcoin", "Taxi", "Bus driver"];
var _that = ["Handshake", "Crying Babies", "Virgins"];

var randomThis = function(){
  var rand = _this[Math.floor(Math.random() * _this.length)];
  console.log("So... your startup is basically like a " + rand + " for ");
};

randomThis()

var randomThat = function(){
  var rand = _that[Math.floor(Math.random() * _that.length)];
  console.log(rand);
};

randomThat();