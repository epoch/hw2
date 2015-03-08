/*
(In JS) Change the body tag's style so it has a font-family of "Arial, sans-serif".
(In JS) Replace each of the spans (nickname, favorites, hometown) with your own information.
Iterate through each li and change the class to "listitem". 
Add a style tag that sets a rule for "listitem" to make the color red.
Create a new img element and set its src attribute to a picture of you. 
Append that element to the page.
*/

console.log('hello world', document.body);

var body = document.body.style.fontFamily = 'Arial, sans-serif';
document.getElementById('nickname').innerHTML = 'Sox';
document.getElementById('favorites').innerHTML = 'Derby, Food, Javascript';
document.getElementById('hometown').innerHTML = 'The Brig';

var items = document.getElementsByTagName('li');
for (var i = 0; i < items.length; i++) {
  items[i].className = "listitem";
  // if there is already a class
  // items[i].className += " listitem";
};

var profilePic = document.createElement('img');
profilePic.src = 'https://pbs.twimg.com/media/B9_bNupIUAAEQ1D.jpg';
document.body.appendChild(profilePic);
