var img = document.getElementsByTagName('img')[0];
var startButton = document.getElementById('start-button');
var speedButton = document.getElementById('speed-button');
var stopButton = document.getElementById('stop-button');
var timer = null;
var speedFactor = 1;
var direction = 1;


img.style.position = 'absolute';
img.style.top = '100px';

var swapImage = function () {
  img.src = "conga_cat.gif";
  stopKittyWalk();
  window.setTimeout(watchKittyWalk, 3000);
}

var step = function() {
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft + 4 * direction;
  img.style.left = newLeft + 'px';
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 1 * direction;
  img.style.top = newTop + 'px';
  if (newLeft == (window.innerWidth - img.width) / 2 - 80) {
    swapImage();
  };
  if (newLeft > (window.innerWidth - img.width)) {
    direction = -1;
    img.id = "mirror-cat";
  } else if (newLeft == 0) {
    direction = 1;
    img.id = undefined;
  };
};

var watchKittyWalk = function() {
  if (!timer) {
  img.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif"
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
