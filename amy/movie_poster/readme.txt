you make a request to the api parameter and it will give you something back

http://www.omdbapi.com/?t=jaws

show me on this website the title result for the movie jaws

as long as you ask for the right url 


enter some text

visit this url

and pluck the poster out of this data


/ page

textarea

and a go button

/movie poster

params search = jaws

take the word jaws

put it in a url like this

request this data

pick through this data to find the poster

and stick jaws poster inside the page here

you can also search again on this page

we want to get this data from inside of ruby

we wan tto request that url inside of ruby, and have it get some datback for you

title = "jaws" #params[:something]


Steps:

require 'httparty'

require 'json'

title = 'jaws'

url = "http://www.omdbapi.com/?t=#{title}"

raw_data = HTTParty.get(url)

movie_data = JSON.parse raw_data
*turns the strings into a hash

movie_data["Poster"]
is how you access the poster 

Steps end

when yo uprocess the resuls
you get the querry string

put it back on the page



<!-- <div class="poster">
<%= params[





:movie_data["Poster"]] %>
</div> -->




<h2 class="title"><%= params[:title] %></h2>


if movie data 







