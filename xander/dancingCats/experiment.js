var img = document.getElementById('walking-cat');
var imgWidth = parseInt(img.width, 10);
var docWidth = parseInt(document.width, 10);
var TWEEN_VALUE = 3;
var FRAMES_PER_SECOND = 60;

var currentTweenValue = TWEEN_VALUE;
var timerRight = null;

function getLeft() {
  return parseInt(img.style.left, 10);
}

function moveRight() {
  if (getLeft() < (docWidth - (imgWidth/2))) {
    img.style.left = getLeft() + currentTweenValue;
  }
  // wraparound
  else {
    img.style.left = -1 * (2 * imgWidth/3);
  }
}

function updateSpeed() {
  var speedEl = document.getElementById("currentSpeed");
  var speedAsCatLengthsPerSecond = parseInt(currentTweenValue, 10) / parseInt(TWEEN_VALUE, 10);
  // if moving...
  if (timerRight) {
    speedEl.innerText = speedAsCatLengthsPerSecond + " cat lengths per second";
  }
  else {
    speedEl.innerText = "0 cat lengths per second (will be " + speedAsCatLengthsPerSecond + " cats/sec upon start)";
  }
}

var stopRightCallback = function () {
  if (timerRight !== null) {
    clearInterval(timerRight);
    timerRight = null;
  }
  updateSpeed();
};

var moveRightCallback = function () {
  // only set new interval if doesn't already exist
  if (timerRight === null) {
    timerRight = setInterval(moveRight, 1000 / FRAMES_PER_SECOND);
  }
  updateSpeed();
};

var start = document.getElementById("start");
start.onclick = moveRightCallback;

var stop = document.getElementById("stop");
stop.onclick = stopRightCallback;

function increaseTween() {
  currentTweenValue = parseInt(currentTweenValue, 10) + parseInt(TWEEN_VALUE, 10);
  updateSpeed();
}

var faster = document.getElementById("faster");
faster.onclick = increaseTween;

function decreaseTween() {
  newTweenValue = parseInt(currentTweenValue, 10) - parseInt(TWEEN_VALUE, 10);
  if (newTweenValue < 0) {
    currentTweenValue = 0;
  }
  else {
    currentTweenValue = newTweenValue;
  }
  updateSpeed();
}

var slower = document.getElementById("slower");
slower.onclick = decreaseTween;
