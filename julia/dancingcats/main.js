var movePixels = 8;
var delayMs = 60;
var catTimer = null;

var startBtn = document.getElementById('start-button');
var speedBtn = document.getElementById('speed-button');
var stopBtn = document.getElementById('stop-button');

function catLeftWalk() {
    var img = document.getElementsByTagName('img')[0];
    var currentLeft = parseInt(img.style.left);

    img.style.left = (currentLeft + movePixels) + 'px';

    if (currentLeft > (window.innerWidth - img.width)) {
        movePixels = 10;
        window.clearInterval(catTimer);
        catTimer = window.setInterval(catRightWalk, delayMs);
  }
}

function catRightWalk() {
    var img = document.getElementsByTagName('img')[0];
    var currentLeft = parseInt(img.style.left);
    img.setAttribute("class", "flip");
    
    img.style.left = (currentLeft -= movePixels) + 'px';

    if (currentLeft <= 0) {
        img.removeAttribute("class", "flip");
        window.clearInterval(catTimer);
        catTimer = window.setInterval(catLeftWalk, delayMs);
  }
}


// var catDance = function () {
//     var img = document.getElementsByTagName('img')[0];
//     img.src = "http://mtv.mtvnimages.com/uri/mgid:file:http:shared:mtv.com/news/wp-content/uploads/2014/08/dancing-cat-gif-5.gif";
//     movePixels = 0;
//     window.setTimeout(startCatWalk, 300);
// }

var startCatWalk = function () {
    // img.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif";
    catTimer = window.setInterval(catLeftWalk, delayMs);
}

var speedCatWalk = function () {
    movePixels = movePixels * 2;
}

var stopCatWalk = function () {
    window.clearInterval(catTimer);
}

startBtn.addEventListener('click', startCatWalk);
stopBtn.addEventListener('click', stopCatWalk);
speedBtn.addEventListener('click', speedCatWalk);


// var catWalk = function () {
//     var img = document.getElementsByTagName('img')[0];
//     // img.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif";
//     var currentLeft = parseInt(img.style.left);

//     img.style.left = (currentLeft + movePixels) + 'px';

//     if (currentLeft > (window.innerWidth - 320)) {
//         img.setAttribute("class", "flip");
//         movePixels = -8;
//         img.style.left = (currentLeft + movePixels) + 'px';
//     } 
//     if (currentLeft < 0) {
//         img.removeAttribute("class", "flip");
//         movePixels = 8;
//     } 
//     if (currentLeft == window.innerWidth / 2) {
//         catDance();
//     }
// }

