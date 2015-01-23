03-frontend $ pry
[1] pry(main)> require 'httparty'
=> true
[2] pry(main)> require 'json'
=> false
[3] pry(main)> title = 'jaws'
=> "jaws"
[4] pry(main)> url = "http://omdbapi.com/?t=#{ title}"
=> "http://omdbapi.com/?t=jaws"
[5] pry(main)> raw_data= HTTParty.get url
=> "{\"Title\":\"Jaws\",\"Year\":\"1975\",\"Rated\":\"PG\",\"Released\":\"20 Jun 1975\",\"Runtime\":\"124 min\",\"Genre\":\"Drama, Thriller\",\"Director\":\"Steven Spielberg\",\"Writer\":\"Peter Benchley (screenplay), Carl Gottlieb (screenplay), Peter Benchley (based on the novel by)\",\"Actors\":\"Roy Scheider, Robert Shaw, Richard Dreyfuss, Lorraine Gary\",\"Plot\":\"When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and grizzled fisherman set out to stop it.\",\"Language\":\"English\",\"Country\":\"USA\",\"Awards\":\"Won 3 Oscars. Another 10 wins & 14 nominations.\",\"Poster\":\"http://ia.media-imdb.com/images/M/MV5BNDcxODkyMjY4MF5BMl5BanBnXkFtZTgwOTk5NTc5MDE@._V1_SX300.jpg\",\"Metascore\":\"79\",\"imdbRating\":\"8.1\",\"imdbVotes\":\"325,500\",\"imdbID\":\"tt0073195\",\"Type\":\"movie\",\"Response\":\"True\"}"
[6] pry(main)> movie_data = JSON.parse raw_data
=> {"Title"=>"Jaws",
 "Year"=>"1975",
 "Rated"=>"PG",
 "Released"=>"20 Jun 1975",
 "Runtime"=>"124 min",
 "Genre"=>"Drama, Thriller",
 "Director"=>"Steven Spielberg",
 "Writer"=>"Peter Benchley (screenplay), Carl Gottlieb (screenplay), Peter Benchley (based on the novel by)",
 "Actors"=>"Roy Scheider, Robert Shaw, Richard Dreyfuss, Lorraine Gary",
 "Plot"=>
  "When a gigantic great white shark begins to menace the small island community of Amity, a police chief, a marine scientist and grizzled fisherman set out to stop it.",
 "Language"=>"English",
 "Country"=>"USA",
 "Awards"=>"Won 3 Oscars. Another 10 wins & 14 nominations.",
 "Poster"=>"http://ia.media-imdb.com/images/M/MV5BNDcxODkyMjY4MF5BMl5BanBnXkFtZTgwOTk5NTc5MDE@._V1_SX300.jpg",
 "Metascore"=>"79",
 "imdbRating"=>"8.1",
 "imdbVotes"=>"325,500",
 "imdbID"=>"tt0073195",
 "Type"=>"movie",
 "Response"=>"True"}
[7] pry(main)> movie_data.keys
=> ["Title",
 "Year",
 "Rated",
 "Released",
 "Runtime",
 "Genre",
 "Director",
 "Writer",
 "Actors",
 "Plot",
 "Language",
 "Country",
 "Awards",
 "Poster",
 "Metascore",
 "imdbRating",
 "imdbVotes",
 "imdbID",
 "Type",
 "Response"]
[8] pry(main)> movie_data.poster
NoMethodError: undefined method `poster' for #<Hash:0x007f996aa0f8b0>
from (pry):8:in `__pry__'
[9] pry(main)> movie_data[poster]
NameError: undefined local variable or method `poster' for main:Object
from (pry):9:in `__pry__'
[10] pry(main)> movie_data["Poster"]
=> "http://ia.media-imdb.com/images/M/MV5BNDcxODkyMjY4MF5BMl5BanBnXkFtZTgwOTk5NTc5MDE@._V1_SX300.jpg"
[11] pry(main)>