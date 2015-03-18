var movePixels = 3;
var movePixelsTop = -1;
var delayMs = 10;
var shufflePixels = 10;
var catTimer = null;

function catWalk() {
  var img = document.getElementsByTagName('img')[0];

  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';

  var currentTop = parseInt(img.style.top);
  img.style.top = (currentTop - movePixelsTop) + 'px';


  if (currentLeft > (window.innerWidth-img.width) || currentLeft < 0) {
    movePixels = -movePixels;
    img.style.left = (currentLeft + movePixels) + 'px';
    img.id = "mirror-cat";
  }

  if (currentTop > (window.innerHeight-img.height) || currentTop < 320) {
    movePixelsTop = -movePixelsTop;
    img.style.top = (currentTop - movePixelsTop) + 'px';
  }

  if (currentLeft === 0) {
    img.id = null;
  }
}
function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);
}

function stopCatWalk() {
  catTimer = window.clearInterval(catTimer);
}

function speedUp() {
  movePixels += 2;
}




function catShuffle() {

  var img = document.getElementsByClassName('corner')[0];
  var img2 = document.getElementsByClassName('corner')[1];

  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + shufflePixels) + 'px';

  var currentRight = parseInt(img2.style.right);
  img2.style.right = (currentRight + shufflePixels) + 'px';

  if (currentLeft > 200 || currentLeft < 0) {
    shufflePixels = -shufflePixels;
    img.style.left = (currentLeft + shufflePixels) + 'px';
  }
}

function startCatShuffle() {
  window.setInterval(catShuffle, 100);
}

startCatShuffle();


var startButton = document.getElementById('start-button');
startButton.addEventListener('click', startCatWalk);
// startButton.addEventListener('click', startCatShuffle);

var stopButton = document.getElementById('stop-button');
stopButton.addEventListener('click', stopCatWalk);

var speedButton = document.getElementById('speed-button');
speedButton.addEventListener('click', speedUp);


var moneyRaised = document.getElementById('money-raised');
var donations = 1374839;
moneyRaised.innerHTML += donations;


window.setInterval(function() {
  donations += 12345;
  moneyRaised.innerHTML = donations;
}, 500);
