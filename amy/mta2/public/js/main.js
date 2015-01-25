ol = $('ol')
li = $('li')
station = $('.station')
p = $('.station p')
line = $('.line')


function highlight() {
    p.addClass('highlighted');  
}

for (i = 0; i < ol.length; i++) { 
 
   if ( li == p ){
       highlight();  
    } else {
        p.addClass('unhighlighted');
    }
}

// if (li.text() == p.text(){
//     highlight();
// }




// function highlightStations(ol, li, p) {
    
//     for (i = 0; i < ol.length; i++) { 
 
//        if ( li.text() == p.text() ){
//             p.addClass('highlighted');
//         } else {
//             p.addClass('unhighlighted');
//         }

//     }

// }

// highlightStations(ol, li, p)




// function highlightStations(li, p) {
    
//     if ( li.text() == p.text() ){
//         p.addClass('highlighted');
//     } else {
//         p.addClass('unhighlighted');
//     }
// }

// highlightStations(li, p)






// function highlightStations(list_item, station_name) {
    
//     if ( list_item.text() == station_name.text() ){
//         this.station_name.addClass('highlighted');
//         // return p1 * p2; 
//     }
//     else
//         station_name.addClass('unhighlighted');
// }

// highlightStations(li, p)






// for (i = 0; i < ol.length; i++) { 
//     li.toggleClass('highlighted');
// }

// for (i = 0; i < ol.length; i++) {
//     for (x = 0; x < station.length; x++) {
//          if (li == p) {
//             p.toggleClass('highlighted');
//         }
//     }
// }

// for (i = 0; i < ol.length; i++) {
//          // if (li === p) {
//             li.toggleClass('highlighted');
//     }
// }

// if (li == p) {
//     p.toggleClass('highlighted');
// }
    


// $(".station p").filter(function() {

//     if ( $(".station p") == $('li') ) {
//         return this.toggleClass('highlighted');
//     }
// }
     


//     return $(this).text() === "hello";
// }).css("font-weight", "bold");



  // for (x = 0; x < p; x++) {
  //       if (li == p) {
  //           p.toggleClass('highlighted');
  //       } 
  //   }




