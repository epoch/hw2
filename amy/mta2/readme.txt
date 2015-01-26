
<!-- 
<div class="map">
    <div class="line_and_station">
        <h2>Line N</h2>
        <div class="line N">
            <div class="station"><p>Times Square</p></div><div class="station"><p>34th</p></div><div class="station"><p>28th</p></div><div class="station"><p>23rd</p></div><div class="station"><p class="union">Union Square</p></div><div class="station"><p>8th</p></div><div class="station empty"><p class="empty">None</p></div>
        </div>
    </div>

    <div class="line_and_station">
        <h2>Line L</h2>
        <div class="line L">
            <div class="station empty"><p class="empty">None</p></div><div class="station empty"><p class="empty">None</p></div><div class="station"><p>6th</p></div><div class="station"><p>8th</p></div><div class="station"><p class="union">Union Square</p></div><div class="station"><p>3rd</p></div><div class="station"><p>1st</p></div>
        </div>
    </div>
    
    <div class="line_and_station">
        <h2>Line 6</h2>
        <div class="line 6">
            <div class="station"><p>Grand Central</p></div><div class="station"><p>33rd</p></div><div class="station"><p>28th</p></div><div class="station"><p>23rd</p></div><div class="station"><p class="union">Union Square</p></div><div class="station"><p>Astor Place</p></div><div class="station empty"><p class="empty">None</p></div>
        </div>
    </div>
    
</div> --> <!-- map end -->


<!-- 
And at the bottom when you have your P tags, also have some logic that says, if the station name of this P tag exists in the stations list, add the class

So you'll have to:
Loop through the LI
For each LI, loop through all the P tags and compare the content of the P tag to the content of the LI tag
If it matches, set a class on the P tag -->




Rather than compare the contents of an LI to the contents of all the P tags..
Kay • 1:04 AM
mmm?
1:05 AM
Amy Simmons
Kay Shapievsky
if you can convert the name of a station to a css valid class (for example, Union Square would become union-square)
And you then assign that class to the P tag, you can use a straight selector
Kay • 1:05 AM
wait
u lost me
1:05 AM
Amy Simmons
Kay Shapievsky
So you can do $('.union-square').addClass('active')
Well... add a class to each P tag that represents the name of its station
Kay • 1:06 AM
so manually give each p tag a clas
that represent the name of its station
1:06 AM
Amy Simmons
Kay Shapievsky
Yeah
Kay • 1:06 AM
got that much
1:06 AM
Amy Simmons
Kay Shapievsky
Correct
Kay • 1:06 AM
bue how does that help?
but*
1:07 AM
Amy Simmons
Kay Shapievsky
Then on the LI, give it a data attribute that matches the corresponding P class
Kay • 1:07 AM
ohh
but i cant do that
bc the lis
is genertated by a loop
1:07 AM
Amy Simmons
Kay Shapievsky
So the LI for Union Station would be:
<li data-station="union-station">
Kay • 1:07 AM
the li changes every time
1:07 AM
Amy Simmons
Kay Shapievsky
So use Ruby to convert the name of the station in the loop to a css class
Use Ruby to convert "Union Station" to "union-station"
And then assign that value to the data attribute of the LI
Kay • 1:08 AM
use ruby to add a class to whatever li it puts out?
1:08 AM
Amy Simmons
Kay Shapievsky
Yes
Kay • 1:08 AM
kay
this is getting harder
1:08 AM
Amy Simmons
Kay Shapievsky
Either a class or a data attribute
Otherwise you're going to have more loops
Which is ok too (the first solution I gave you)


Loop through each LI
For each LI, loop through all the P tags and check their content ( .html() ) against the content of the LI
If the contents match, add the class
Or you could use ':contains' in jQuery
http://api.jquery.com/contains-selector/


Why do you need to do it in Javascript anyway?
Why not add the class in Ruby?
For each P tag, can't you just use the ruby 'include' function


So if the name of the station exists in the array, add the class
Kay • 1:11 AM
if the name if the station is included in the p
add the class to the p
i just didnt know u could add class in ruby
but of course u could
u can do anything in ruby
!
1:11 AM
Amy Simmons
Kay Shapievsky
stations?include 'Union Square'
exactly. Backend languages spit out markup
And that markup includes classes
http://ruby-doc.org/core-1.9.3/Array.html#method-i-include-3F
So just use Ruby to do that logic. Much simpler


<label for="title">Current Station: </label>
            <select name="current">
                <optgroup label="Line N">
                    <option value="N-8th">8th</option>
                    <option value="N-Union Square">Union Square</option>
                    <option value="N-23rd">23rd</option>
                    <option value="N-28th">28th</option>


<form action="/results">
    <label for="title">Station on</label>
    <select name="stop_on">
        <% $subway_lines.keys.each do |line| %>
          <optgroup id="line_on" value="<%=line%>" label="<%=line%>">
            <% $subway_lines[line].flatten.each do |station| %>
            <option id="stop_on" value="<%=station%>"><%=station%></option>
            <%end%>
          </optgroup> 
        <%end%>
    </select>
</label>

    <select>
        <% $subway_lines.keys.each do |line| %>
          <optgroup id="line_off" label="<%=line%>">
            <% $subway_lines[line].flatten.each do |station| %>
            <option id="stop_off"><%=station%></option>
            <%end%>
          </optgroup> 
        <%end%>
    </select>

    <button>Submit</button>


</form>







// var li = $('li')

// li.each(function() {

//     var p = $('.station p').html()

//     var contents = $(this).html()


//     if ($('.station').html() != "Union Square"){
//             $( ".station:contains('"+contents+"')" ).addClass('highlighted');

//     }


// });



// $('a').each(
//     function() {
//         var classes = this.classList;
//         for (var i=0,len=classes.length; i<len; i++){
//             if ($('body').hasClass(classes[i])){
//                 $(this).addClass('bodySharesClass');
//             }
//         }
//     });​



// var li = $('li')
// var p = $('.station p')




// $('.union-square').addClass('active')

// Rather than compare the contents of an LI to the contents of all the P tags..
// Kay • 1:04 AM
// mmm?
// 1:05 AM
// Amy Simmons
// Kay Shapievsky
// if you can convert the name of a station to a css valid class (for example, Union Square would become union-square)
// And you then assign that class to the P tag, you can use a straight selector
// Kay • 1:05 AM
// wait
// u lost me
// 1:05 AM
// Amy Simmons
// Kay Shapievsky
// So you can do $('.union-square').addClass('active')
// Well... add a class to each P tag that represents the name of its station
// Kay • 1:06 AM
// so manually give each p tag a clas
// that represent the name of its station
// 1:06 AM
// Amy Simmons
// Kay Shapievsky
// Yeah
// Kay • 1:06 AM
// got that much
// 1:06 AM
// Amy Simmons
// Kay Shapievsky
// Correct
// Kay • 1:06 AM
// bue how does that help?
// but*
// 1:07 AM
// Amy Simmons
// Kay Shapievsky
// Then on the LI, give it a data attribute that matches the corresponding P class
// Kay • 1:07 AM
// ohh
// but i cant do that
// bc the lis
// is genertated by a loop
// 1:07 AM
// Amy Simmons
// Kay Shapievsky
// So the LI for Union Station would be:
// <li data-station="union-station">
// Kay • 1:07 AM
// the li changes every time
// 1:07 AM
// Amy Simmons
// Kay Shapievsky
// So use Ruby to convert the name of the station in the loop to a css class
// Use Ruby to convert "Union Station" to "union-station"
// And then assign that value to the data attribute of the LI
// Kay • 1:08 AM
// use ruby to add a class to whatever li it puts out?
// 1:08 AM
// Amy Simmons
// Kay Shapievsky
// Yes
// Kay • 1:08 AM
// kay
// this is getting harder
// 1:08 AM
// Amy Simmons
// Kay Shapievsky
// Either a class or a data attribute
// Otherwise you're going to have more loops
// Which is ok too (the first solution I gave you)


// Loop through each LI
// For each LI, loop through all the P tags and check their content ( .html() ) against the content of the LI
// If the contents match, add the class
// Or you could use ':contains' in jQuery
// http://api.jquery.com/contains-selector/


// Why do you need to do it in Javascript anyway?
// Why not add the class in Ruby?
// For each P tag, can't you just use the ruby 'include' function


// So if the name of the station exists in the array, add the class
// Kay • 1:11 AM
// if the name if the station is included in the p
// add the class to the p
// i just didnt know u could add class in ruby
// but of course u could
// u can do anything in ruby
// !
// 1:11 AM
// Amy Simmons
// Kay Shapievsky
// stations?include 'Union Square'
// exactly. Backend languages spit out markup
// And that markup includes classes
// http://ruby-doc.org/core-1.9.3/Array.html#method-i-include-3F
// So just use Ruby to do that logic. Much simpler






// CODE WORKS


// var ol = $('ol')
// var li_text = $('li').text()
// var station = $('.station')
// var p = $('.station p')
// var p_text = $('.station p').text()
// var line = $('.line')
// var li = $('li')


// var li = $('li')

// li.each(function() {

//     var p = $('.station p').html()
//     var p_text = $('.station p').html()
//     var contents = $(this).html()

//     $( "p:contains('"+contents+"')" ).addClass('highlighted');

//    console.log( "p:contains('"+contents+"')" )

// });

// CODE WORKS






// li.each(function(){

//     p.each(function(){

//         if(li_text == p_text){
//             station.addClass('highlighted');
//         }
//         else {
//             station.addClass('unhighlighted');
//         }

//     })

// });


// li.each(function() {

//     // if ( $("p_text:contains(li_text)") ) {

//     var ol = $('ol');
//     var li = $('li');
//     var li_text = $('li').text();
//     var station = $('.station');
//     var p = $('.station p');
//     var p_text = $('.station p').text();
//     var line = $('.line');
//     var p_match = li_text.match(/p_text/);
    

//     if ( p_text.is("li_text") )  {
  
//         station.addClass('highlighted');
//     }   
//     else {
//         console.log("Nothing")
//     }
    
// });



// $( "ul" ).click(function( event ) {
//   var target = $( event.target );
//   if ( target.is( "li" ) ) {
//     target.css( "background-color", "red" );
//   }
// });

// li.each(function() {

//     var contents = $(this).html()
//     var p = $('.station p').html()

//     if ( $( "p:contains(contents)" ) ) {
  
//         p.addClass('highlighted');
//     }   
    
// });

// li.each(function() {
// // get the variable with the contents of the current LI
// // construct the selector with contains to select a P tag that contains the contents of the LI
// });
// you just need one loop through the LI
// In that loop, build the jQuery selector for the P
// In your loop, do a console.log of any variables you assign


// And then get the contents using $(this).html()
// And then build the selector using that value
// And the selector would use :contains
// It's not the cleanest way of doing it but it will work
// Did you want me to write a snippet of the code for you?
 
//    if ( li == p ){
//        highlight();  
//     } else {
//         p.addClass('unhighlighted');
//     }
// }

// Loop through each LI
// For each LI, loop through all the P tags and check their content ( .html() ) against the content of the LI
// If the contents match, add the class

// // if (li.text() == p.text(){
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










<!-- 

 <% if @already_at_destination %>


  <% $subway_lines.values.flatten.each do |station| %>
                        <option value="<%=station%>" > <%=station%> </option>
                    <% end %>

  <p><%=@changeover%></p>



 <%@stations_after_changeover_arr.each do |station|%>
            <li><%=station%></li>
        <%end%>



    -->
    <!-- loop through the stations arrays to list the stations --> 




https://gist.github.com/wofockham/399e315a90e04a867455

https://gist.github.com/amysimmons/a08a2bfeb2af4cf10d1c

<%= erb :results, :layout => false %>

 <%= erb :results, :layout => false %>


Logic:


if one line 
    the only thing u need to worry about is if one index is bigger than the other then reverse the range


if multi line 

    index one will be stop on

    index two will be us

    index one will be us

    index two will be stop off



you would call journey function twice and pass in index one and index 2

spit out the arrays and add the lengths together 



# Activity:

# Students should create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.

# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# Hints:

# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines are keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)






# get/post in relation to MTA:

# if you say i wan tto get from this stop to another stop
# that shouldnt be a get request
# its going to appear inthe query string
# because you are querying somethign

# a post request for mta would be like creatign a new station
# or creating a new line

# drop down menus to select where you are going etc

# the logic will hopefully flow over

# u just have to use params instead of gets and puts

# try and get it working as a web page

# we want to know how many stations but we also need to see a list of stations in order

# the basic difference between them is whether it is changing something on the server or not

