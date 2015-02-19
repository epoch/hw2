var movePixels = 2;
var delayMs = 36;
var catTimer = null;

var startButton = document.getElementById('start-button');
var stopButton = document.getElementById('stop-button');
var speedButton = document.getElementById('speed-button');

// var startButton = function(event) {
//   var start = document.getElementById('start-button').value;
// }

function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px'; 
  if (currentLeft > (window.innerWidth-img.width)) {
  img.style.left = '0px';
  }
}

function speedCatWalk() {
  movePixels = 5;
}

function startCatWalk() {
  if (catTimer === null) {
  catTimer = window.setInterval(catWalk, delayMs);
  }
}

function stopCatWalk() {
  clearInterval(catTimer);
}

startButton.addEventListener('click', startCatWalk);
stopButton.addEventListener('click', stopCatWalk);
speedButton.addEventListener('click', speedCatWalk);

