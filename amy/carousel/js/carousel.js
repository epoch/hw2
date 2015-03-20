// OPTION #1

$(document).ready(function(){

  var carousel = $('#carousel')
  var next = $('#next')
  var previous = $('#previous')

  var moveLeft = function(){
    var position = carousel.css(["left"])
    var pixels = position.left
    var maxPixels = -1224 + "px"
    var startPixels = "0px"  
    if (pixels === maxPixels) {
      console.log('end reached');
      carousel.css({"left": startPixels});
      // carousel.fadeIn( "slow" );
      // carousel.animate({ "left": "0px" });
    }else{
      carousel.animate({ "left": "-=612px" }, "slow" );
    }
  };

  var moveRight = function(){
    var position = carousel.css(["left"])
    var pixels = position.left
    var maxPixels = -1224 + "px"
    if (pixels === "0px"){
      carousel.css({"left": maxPixels});
      // carousel.fadeOut( "slow" );
    }else{
      carousel.animate({ "left": "+=612px" }, "slow" );
    }
  };

  next.on('click', moveLeft);
  previous.on('click', moveRight);

});

// OPTION #2


// $(document).ready(function(){

//   var carousel = $('#carousel')
//   var next = $('#next')
//   var previous = $('#previous')

//   var moveLeft = function(){
//     var position = carousel.css(["left"])
//     var pixels = position.left
//     var maxPixels = -1224 + "px"
//     var startPixels = "0px"  
//     if (pixels === maxPixels) {
//       console.log('end reached');


//       // $('#img3').detach().insertBefore($('#img1'));


//       carousel.css({"left": startPixels});
//       // carousel.fadeIn( "slow" );
//       // carousel.animate({ "left": "0px" });
//     }else{
//       carousel.animate({ "left": "-=612px" }, "slow" );
//     }
//   };

//   var moveRight = function(){
//     debugger;
//     var position = carousel.css(["left"])
//     var pixels = position.left
//     var maxPixels = -1224 + "px"
//     if (pixels === "0px"){
//       carousel.css({"left": maxPixels});
//       // carousel.fadeOut( "slow" );
//     }else{
//       carousel.animate({ "left": "+=612px" }, "slow" );
//     }
//   };

//   next.on('click', moveLeft);
//   previous.on('click', moveRight);

// });


// carousel.children().first().get(0).src

// carousel.children().last().get(0).src


// carousel.style.marginLeft = 0;

// // Slides the images to the left or goes back to the first image if it has reached the end
// function toLeft(){
// }


// // Slides the images to the right or goes back to the last image if it has reached the end
// function toRight(){
// }

//Hook up the next and previous buttons to call the toLeft and toRight functions




// use jquery animate for the slider

// and a jquery method called stop with special parameters to get it 
// to finish the old animation before it starts the next one

// another problem is what to do when you get to the last image

// it can also go get a copy of the first image and move it to the end, 
// so it's like its on a loop, you can create a new element or do it 
// with the existing one by changing the css



// joel tip:
// use carousel.width instead of harcoding it, in case you add more images 


