var movePixels = 0;
var delayMs = 30;
var catTimer = null;

function catWalk() {
  var img = document.getElementsByClassName('moving-animal')[0];
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    movePixels = - Math.abs(movePixels);
    img.id = "mirror-cat";
  }
  else if (currentLeft < 1) {
    movePixels = Math.abs(movePixels);
    img.id = null;
  }
}

function startCatWalk() {
  var img = document.getElementsByClassName('moving-animal')[0];
  movePixels = 2;

  catTimer = window.setInterval(catWalk, delayMs);
  startButton.removeEventListener('click', startCatWalk);
  speedButton.addEventListener('click', speedCatWalk);
  stopButton.addEventListener('click', stopCatWalk);
}

function speedCatWalk() {
  movePixels += Math.abs(movePixels);
}

function stopCatWalk() {
  movePixels = 0;

  startButton.addEventListener('click', startCatWalk);
  stopButton.removeEventListener('click', stopCatWalk);
  speedButton.removeEventListener('click', speedCatWalk);
}

var startButton = document.getElementById('start-button');

var speedButton = document.getElementById('speed-button');

var stopButton = document.getElementById('stop-button');

startButton.addEventListener('click', startCatWalk);