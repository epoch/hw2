// Todo Router

var Workspace = Backbone.Router.extend({
  routes: {
    // Router uses a *splat to set up a default route 
    // which passes the string after ‘#/’ in the URL to setFilter().
    '*filter': 'setFilter'
  },

  // setFilter() sets app.TodoFilter to string after ‘#/’ in the URL.
  setFilter: function(param) {
    // Set the current filter to be used
    if (param) {
      param = param.trim();
    }
    app.TodoFilter = param || '';

    // Trigger a collection filter event, causing hiding/unhiding
    // of Todo view items
    app.Todos.trigger('filter');
  }
});

app.TodoRouter = new Workspace();
Backbone.history.start();