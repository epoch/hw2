var movePixels = 10;
var delayMs = 50;
var catTimer = null;

var startButt = document.getElementById('start-button');
var stopButt = document.getElementById('stop-button');

function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    img.style.left = '0px';
  }
}
function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);
}


var startButton 




function stopCatWalk() {
  window.clearInterval(catWalk, delayMs);
}


startButt.addEventListener('click', startCatWalk);
stopButt.addEventListener('click', stopCatWalk);
