var Workspace = Backbone.Router.extend({
  routes:{
    '*filter': 'setFilter'
  },

  setFilter: function(param){
  // Set the current filter to be used
  if(param){
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