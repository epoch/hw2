// this is the equivalent of conditional assignment in Ruby 
// As in if app is empty then make it a hash
var app = app || {};

// Todo Collection
// ---------------

// The collection of todos is backed by *localStorage* instead of a remote
// server.
var TodoList = Backbone.Collection.extend({

  // Save all of the todo items under the `"todos-backbone"` namespace.
  localStorage: new Backbone.LocalStorage('todos-backbone'),

  // Reference to this collection's model.
  model: app.Todo,

  // Filter down the list of all todo items that are finished.
  completed: function() {
    return this.filter(function( todo ) {
      return todo.get('completed');
    });
  },

  // Filter down the list to only todo items that are still not finished.
  remaining: function() {
    return this.without.apply( this, this.completed() );
  },

  // We keep the Todos in sequential order, despite being saved by unordered
  // GUID in the database. This generates the next order number for new items.
  nextOrder:function(){
    if (!this.length){
      return 1;
    }
    return this.last().get('order')+1;
  },

  // Todos are sorted by their original insertion order.
  comparator: function(todo){
    return todo.get('order');
  }

});

// create our global collection of todos
app.Todos = new TodoList();

// The collection’s completed() and remaining() methods return an array of finished and unfinished todos, respectively.

// A nextOrder() method implements a sequence generator while a comparator() sorts items by their insertion order.




