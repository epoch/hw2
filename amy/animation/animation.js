var movePixels = 30;
// moviing the actual cat, how many pixels each time
var delayMs = 100;
// how often i want to move the cat each second, eg 100 px per second
var catTimer = null;

var startButton = document.getElementById('start-button');
var speedButton = document.getElementById('speed-button');
var stopButton = document.getElementById('stop-button');

var audioElement = document.createElement('audio');
audioElement.setAttribute('src', 'Im_Too_Sexy.mp3');
// audioElement.setAttribute('autoplay', 'autoplay');

var halfWindow = window.innerWidth/2

function catWalk(){
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  var currentRight = parseInt(img.style.right);
  var currentCenter = parseInt(img.style.center);
  img.style.left = (currentLeft + movePixels) + 'px';
  img.style.right = (currentRight - movePixels) + 'px';
  
  if (currentLeft > (window.innerWidth-img.width)) {
    
    // flip cat and send it backwards here
    img.style.right = '0px';
    img.setAttribute("class", "flipped");
    movePixels = -30;


  }else if (currentRight > (window.innerWidth-img.width)){
    img.style.left = '0px';
    img.removeAttribute("class", "flipped");
    movePixels = 30;

  }else if (currentLeft > (window.innerWidth/2 -img.width) && 
            currentLeft < (window.innerWidth/2) -img.width+movePixels+2)  {

    console.log(currentLeft, (window.innerWidth/2 -img.width), (window.innerWidth/2));

    console.log("half way");
    stopCatWalk();
    changeImage(img);
    // startCatWalk();
 
  // }else if (currentRight > (window.innerWidth/2 -img.width) ){
  //   console.log("half way");
  //   stopCatWalk();
  //   changeImage(img);
    // startCatWalk();
  }
    // 
    // window.setInterval(catWalk, delayMs);
}



function startCatWalk(){
    catTimer = window.setInterval(catWalk, delayMs);
    audioElement.play();
}

function speedCatWalk(){
    movePixels = movePixels * 2;
}

function stopCatWalk(){
    window.clearInterval(catTimer);
    audioElement.pause();

}

function changeImage(img){
  img.src = img.src.replace("http://www.anniemation.com/clip_art/images/cat-walk.gif", "http://www.freeallimages.com/wp-content/uploads/2014/09/happy-birthday-dancing-cat-gif-3.gif");
  setTimeout(function(){ 
    img.src = img.src.replace("http://www.freeallimages.com/wp-content/uploads/2014/09/happy-birthday-dancing-cat-gif-3.gif", "http://www.anniemation.com/clip_art/images/cat-walk.gif");
    startCatWalk();
  }, 3000);

}

startButton.addEventListener('click', startCatWalk);
speedButton.addEventListener('click', speedCatWalk);
stopButton.addEventListener('click', stopCatWalk);


// var dancingCat = document.createElement('img');
    // dancingCat.src=("http://www.freeallimages.com/wp-content/uploads/2014/09/happy-birthday-dancing-cat-gif-3.gif");


  // <article>
  //   <!-- <p>Move the above code into a separate JS file! -->
  //   <p>Add an event listener to the start button, so that the cat starts moving across the screen when its clicked.
  //   <p>Add an event listener to the stop button, so that the cat stops moving when clicked.
  //   <p>Add an event listener to the speed button, so that the cat moves faster when it's clicked. 
  //   <p>When the cat reaches the edge of the screen, have her walk back to the start. Repeat forever.
  //   <p>Make sure your code works even when the screen is resized (you will need to find the window width with Javascript.
  //   <p>BONUS: When the cat reaches half way, have her stop and replace the image with a dancing cat gif for a moment, then resume.
  // </article>




