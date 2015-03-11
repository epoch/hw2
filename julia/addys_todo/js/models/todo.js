var app = app || {};

// Todo Model

// The todo model has two attributes: title and completed (the todo item's status).
app.Todo = Backbone.Model.extend({

  // Default attributes ensure that each todo has a 'title' and 'completed' status.
  defaults: {
    title: '',
    completed: false
  },
  // The toggle method toggles the 'completed' state of the item.
  toggle: function () {
    // Updates and sets the status so it's not lost???
    this.save({
      completed: !this.get('completed') 
    });
  }
});
