var img = document.getElementsByTagName('img')[0];
var startButton = document.getElementById('start-button');
var speedButton = document.getElementById('speed-button');
var stopButton = document.getElementById('stop-button');
var timer = null;
var speedFactor = 1;

img.style.position = 'absolute';
img.style.top = '100px';

var step = function() {
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft + 4;
  img.style.left = newLeft + 'px';
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 1;
  img.style.top = newTop + 'px';
  if (newLeft > (window.innerWidth-img.width)) {
  img.style.left = '0px';
  };
};

var watchKittyWalk = function() {
  if (!timer) {
  timer = window.setInterval(step, 50/speedFactor);
  }
};

var stopKittyWalk = function () {
  window.clearInterval(timer);
  timer = null;
};

var speedUpKitty = function () {
  speedFactor++;
  stopKittyWalk();
  watchKittyWalk();
}

startButton.addEventListener('click', watchKittyWalk, false);
speedButton.addEventListener('click', speedUpKitty, false);
stopButton.addEventListener('click', stopKittyWalk, false);
