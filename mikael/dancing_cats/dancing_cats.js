var img = document.getElementsByTagName('img')[0];
var fwd = true;
var watch = null;
var pixels = 10;

var changeImage = function () {
  img.src = "cat.gif";
  stopCat();
  window.setTimeout(startCat, 2000);
}

function movingCat() {
  var goLeft = parseInt(document.getElementsByTagName('img')[0].style.left);
  if (document.getElementsByTagName('img')[0].style.left === Math.round(window.innerWidth / 20) * 10 - 120 + 'px') {
    changeImage();
  };
  if (fwd && (goLeft > (window.innerWidth-document.getElementsByTagName('img')[0].width))) {
    fwd = false;
  }
  if (!fwd && (goLeft <= 0)) {
    fwd = true;
  }
  if (fwd) {
    document.getElementsByTagName('img')[0].style.left = (goLeft + 10) + 'px';
  } else {
    document.getElementsByTagName('img')[0].style.left = (goLeft - 10) + 'px';
  }
}

function startCat() {
  if (!watch) {
  img.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif"
  watch = window.setInterval(movingCat, 50);
  }
}

function start() {
  document.getElementById('start-button').addEventListener('click', startCat);
};

function stopCat() {
  window.clearInterval(watch);
  watch = null;
}

function stop() {
  document.getElementById('stop-button').addEventListener('click', stopCat);
};

var accelerateCat = function () {
  pixels += 5;
  var speed = pixels * (1000/50);
}

function accelerate() {
  document.getElementById('accelerate-button').addEventListener('click', accelerateCat);
};
