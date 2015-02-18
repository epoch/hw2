var img = document.getElementsByTagName('img')[0];
var startButton = document.getElementById('start-button');

img.style.position = 'absolute';
img.style.top = '100px';

var step = function() {
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft + 4;
  img.style.left = newLeft + 'px';
  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 1;
  img.style.top = newTop + 'px';
};

var watchKittyWalk = function() {
    window.setInterval(step, 50);
};

startButton.addEventListener('click', watchKittyWalk, false);
