var movePixels = 2;
var delayMs = 36;
var catTimer = null;

var startButton = document.getElementById('start-button');
var stopButton = document.getElementById('stop-button');
var speedButton = document.getElementById('speed-button');

// var startButton = function(event) {
//   var start = document.getElementById('start-button').value;
// }

function catWalkRight() {

  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  var direction 
  if (currentLeft > (window.innerWidth - img.width)) {
    img.style.left = (currentLeft + movePixels) + 'px';
    
    img.className = "flipToLeft";
    img.style.left = (currentLeft - movePixels) + 'px';

put a condition in for both left and right to check and maybe a variable for which direction the cat goes

  }
}

// function catWalkLeft() {

//   var img = document.getElementsByTagName('img')[0];
//   img.className = "flipToLeft";
//   var currentRight = parseInt(img.style.right);
//   img.style.right = (currentRight + movePixels) + 'px'; 
//   if (currentRight > (window.innerWidth - img.width)) {
//     img.className = "flipToRight";
//     catWalkRight();
//   }
// }


function speedCatWalk() {
  movePixels = 5;
}

function startCatWalk() {
  if (catTimer === null) {
  catTimer = window.setInterval(catWalkRight, delayMs);
  }
}

function stopCatWalk() {
  clearInterval(catTimer);
}

startButton.addEventListener('click', startCatWalk);
stopButton.addEventListener('click', stopCatWalk);
speedButton.addEventListener('click', speedCatWalk);

