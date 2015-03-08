/*
Create an object to hold information on your favorite recipe. 
It should have properties for title (a string), servings (a number), and ingredients (an array of strings).
On separate lines (one console.log statement for each), log the recipe information so it looks like:
Mole
Serves: 2
Ingredients:
cinnamon
cumin
cocoa
*/

var recipe = {
  title: "Mole",
  servings: 2,
  ingredients: ['cinnamon', 'cumin', 'cocoa']
};

console.log(recipe.title);
console.log(recipe.servings);
for (var i = 0; i < recipe.ingredients.length; i++) {
    console.log(recipe.ingredients[i]);
}

/*
The Reading List
Create an array of objects, where each object describes a book and has properties for the title (a string), author (a string), and alreadyRead (a boolean indicating if you read it yet).

Iterate through the array of book. For each book, log the book title and book author like so: "The Hobbit by J.R.R. Tolkien". Now use an if/else statement to change the output depending on whether you read it yet or not. If you read it, log a string like 'You already read "The Hobbit" by J.R.R. Tolkien', and if not, log a string like 'You still need to read "The Lord of the Rings" by J.R.R. Tolkien.'
*/

var book = [
  {title: "The Hobbit",
  author: "J.R.R. Tolkien",
  alreadyRead: true
  }];

for (var i = 0; i < book.length; i++) {
  var book = book[i];
  var bookInfo = book.title + '" by ' + book.author;
  if (book.alreadyRead) {
    console.log('You have already read "' + bookInfo);
  } else {
    console.log('You still need to read "' + bookInfo);
  };
};

/*
The Movie Database
It's like IMDB, but much much smaller!
Create an object to store the following information about your favorite movie: title (a string), duration (a number), and stars (an array of strings).
Create a function to print out the movie information like so: "Puff the Magic Dragon lasts for 30 minutes. Stars: Puff, Jackie, Living Sneezes."
*/

var favoriteMovie = {
  title: "Leon",
  duration: 90,
  stars: ["Natalie Portman", "Jean Reno"]
};

var printMovie = function(movie){
  console.log(movie.title + " lasts for " + movie.duration + " minutes.");
  console.log("It stars " + movie.stars.join(' and '));
};

printMovie(favoriteMovie);

/* JOEL'S EXAMPLE

var movieInfo = function(movie){
  var info = "";
  info += movie.title;
  info += ' lasts for ' + movie.duration + ' minutes.';
  info += ' Stars: ' + movie.stars.join(', ')
};

movieInfo(favoriteMovie);
*/




