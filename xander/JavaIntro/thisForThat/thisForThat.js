var Products = ['LinkedIn', 'Facebook', 'Tumblr', 'Yelp', 'Twitter', 'Tinder', 'Snapchat', 'WhatsApp', 'Dropbox', 'Google'];
var Users = ['Entrepreneurs', 'Politicians', 'Couples', 'Pilots', 'Waitstaff', 'Baristas', 'Project Managers', 'Venture Capitalists'];

var randomThis = function(prod) {
  return prod[Math.floor(Math.random() * prod.length)];
}

var randomThat = function(use) {
  return use[Math.floor(Math.random() * use.length)];
}

var first = randomThis(Products);
var second = randomThis(Users);

var randomStatement = function(first, second) {
   console.log('So....your startup is basically a ' + first + ' for ' + second + '?');
}

randomStatement(first, second)