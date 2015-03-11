var app = app || {};

// Todo Collection
// The collection of todos is stored by localStorage instead of a remote server.

// The collection uses the LocalStorage adapter to override 
// Backbone’s default sync() operation with one that will 
// persist our Todo records to HTML5 Local Storage. 
// Through local storage, they’re saved between page requests.
var TodoList = Backbone.Collection.extend({

  // Reference to collection's model.
  model: app.Todo,

  // Save all of the todo items unde the '"todos-backbone"' namespace.
  localStorage: new Backbone.LocalStorage('todos-backbone'),

  // Returns finished todos - filter all the items to just list finished items.
  completed: function () {

    // 'this.filter' is an underscore method.
    // Looks through each value in the list, returning an array
    // of all the values that pass a truth test (predicate).
    return this.filter(function (todo) { 
      return todo.get('completed');
    });
  },

  // Returns unfinished todos - filters all the items to just the unfinished items.
  remaining: function () {

    // 'this.without' is an underscore method.
    // Returns a copy of the array with all instances of the values removed.
    return this.without.apply( this, this.completed() );
  },

  // We keep the Todos in sequential order, despite being saved by unordered GUID in the database. 
  // This generates the next order number for new items.
  // Implements a sequence generator.
  nextOrder: function () {
    if (!this.length) {
      return 1;
    }

    // 'this.last' is an underscore method.
    // Returns the last element of the array. 
    return this.last().get('order') + 1;
  },

   // Sorts Todos by their insertion order (when entered?).
   comparator: function (todo) {
    return todo.get('order');
   }
});

// Create global collection of Todos.
app.Todos = new TodoList();