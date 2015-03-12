// this is the equivalent of conditional assignment in Ruby 
// As in if app is empty then make it a hash
var app = app || {};

// Todo Model
// ----------
// Our basic **Todo** model has `title` and `completed` attributes.
app.Todo = Backbone.Model.extend({

  // default attributes ensure that each new todo has a title and
  // completed keys
  defaults: {
    title: '',
    completed: false
  },

 // toggle the completed state of this todo item
  toggle: function(){
    this.save({
      completed: !this.get('completed')
    });
  }

});

// http://stackoverflow.com/questions/21969922/the-meaning-of-this-get-in-backbone-todo-mvc-app

