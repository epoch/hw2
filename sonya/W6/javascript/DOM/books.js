/*
Iterate through the array of books. 
For each book, create a p element with the book title and author and append it to the page.
Bonus: Use a ul and li to display the books.
Bonus: add a property to each book with the URL of the book cover, and add an img element for each book on the page.
Bonus: Change the style of the book depending on whether you have read it or not.
*/

var books = [{
    title: 'The Design of EveryDay Things',
    author: 'Don Norman',
    img: 'http://ecx.images-amazon.com/images/I/71T0PJT2F1L.gif',
    alreadyRead: false
  },

  {
    title: 'The Most Human Human',
    author: 'Brian Christian',
    img: 'http://d.gr-assets.com/books/1295465264l/8884400.jpg',
    alreadyRead: true
  }
];

for (var i = 0; i < books.length; i++) {
  var book = books[i];
  var p = document.createElement('p');
  p.innerHTML = '<b>' + book.title + '</b>' + ' by ' + book.author;
  document.body.appendChild(p);
};

