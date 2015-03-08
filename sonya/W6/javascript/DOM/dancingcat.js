/*
var img = document.getElementsByTagName('img')[0];
img.style.position = 'absolute';
img.style.top = '0px';
var watchKittyFall = function() {
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 10;
  img.style.top = newTop + 'px';
};
window.setInterval(watchKittyFall, 1000);
*/

var movePixels = 8;
var delayMs = 80;
var catTimer = null;

function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';
  
  if (currentLeft > window.innerWidth-img.width) {
      movePixels = -8;
      img.id = 'mirror-cat';
  }
  if (currentLeft < 0) {
      movePixels = 8;
      img.id = null;
  }
}

function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);
}
// debugger;

function onStartClick() {
    startCatWalk();
}
var startButton = document.getElementById('start-button');
startButton.addEventListener('click', onStartClick);

function onStopClick() {
    window.clearInterval(catTimer);
}
var stopButton = document.getElementById('stop-button');
stopButton.addEventListener('click', onStopClick);

function onSpeedClick() {
  movePixels += 5;
  var speed = movePixels * (1000/50);
  document.getElementById('info').innerHTML = 'Current speed: ' + speed + ' px/second';
};

var speedButton = document.getElementById('speed-button');
speedButton.addEventListener('click', onSpeedClick);
