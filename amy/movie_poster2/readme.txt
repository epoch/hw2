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

---

If I had have wanted to have one set of html elements for the form, so that if I needed to change something it would carry across all pages, this is how I could have done it:

<div class="search_again">
    <%= erb :search, :layout => false %>
</div>


---

homework: MISSING STEP

I WANT TO SEE AL IST SAYING DID YOU MEAN

ALIEN, 
ALIEN3
ETC

WILL RETURN ALL THE MATCHES

AND WHEN I CLICK ON THIS IT WILL TAKE ME TO THE SINGLE PAGE 


THE OPEN MOVIE API ALREADY SUPPORTS THIS 

WE HAVE BEEN USING THE TITLE PARAMETER

T = JAWS

WHAT WE CAN INSTEAD USE IS S

SO IT SAYS S= JAWS

here i get back search results for all the movies which have jaws in the title


so this is only enough to give me the second page

s search

once we know whcih specific jaws or aliens movie, we make another request to them for the t version, thats how you get to the poster

if you search for something like alien resurrection 


extension:
in the rare exception when there is only one choice, you want to go straight to the poster page

you will need to redirect

so look up redirect in the sinatra documentation



Second homework task:

https://gist.github.com/wofockham/56f8d794c405a8d7cae6

you choose a game and go through to that game

secret number

the computer guesses a number and you do too

rock paper scissors

a get to 


magic 8 ball picks a random elemeent from the array

secret number picks a random number from an array

rock paper scirros is a tricky one



<!-- <p><%= params[:title] %>, <%= params[:year] %></p> -->



