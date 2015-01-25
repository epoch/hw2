<!-- 



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

