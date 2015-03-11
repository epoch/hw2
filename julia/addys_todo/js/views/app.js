var app = app || {};

// The Application

// Our overall AppView is the top-level piece of UI.
app.AppView = Backbone.View.extend({

  // Instead of generating a new element, bind to the existing skelton of
  // the App already in the HTML.
  el: '#todoapp',

  // Our template for the line of statistics at the bottom of the app.
  statsTemplate: _.template($('#stats-template').html()),

  // Delegated events for creating new items, and clearing completed ones.
  events: {
    'keypress #new-todo': 'createOnEnter',
    'click #clear-completed': 'clearCompleted',
    'click #toggle-all': 'toggleAllComplete'
  },

  // At initialization we bind to the relevant events on the 'Todos'
  // collection, when items are added or changed.
  // Caches the elements it will be using into local properties 
  // (this.$() finds elements relative to this.$el). 
  initialize: function () {
    this.allCheckbox = this.$('#toggle-all')[0];
    this.$input = this.$('#new-todo');
    this.$footer = this.$('#footer');
    this.$main = this.$('#main');

    //  addOne() creates an instance of TodoView view, renders it, 
    // and appends the resulting element to our Todo list.
    this.listenTo(app.Todos, 'add', this.addOne);

    // Iterates over all of the Todos currently in our collection and 
    // fires addOne() for each item.
    // We can use this within addAll() to refer to the view because listenTo() implicitly set the callback’s context to the view when it created the binding
    this.listenTo(app.Todos, 'reset', this.addAll);

    // Listens for changes to the completed flag for any model in the collection.
    this.listenTo(app.Todos, 'change:completed', this.filterOne);
    this.listenTo(app.Todos, 'filter', this.filterAll);
    this.listenTo(app.Todos, 'all', this.render);

    app.Todos.fetch();
  },

  // Re-rendering the App just means refreshing the statistics.
  // The rest of the app doesn't change. 
  render: function () {
    var completed = app.Todos.completed().length;
    var remaining = app.Todos.remaining().length;

    if (app.Todos.length) {
      this.$main.show();
      this.$footer.show();

      this.$footer.html(this.statsTemplate({
        completed: completed,
        remaining: remaining
      }));

      this.$('#filters li a')
        .removeClass('selected')
        .filter('[href="#/' + (app.TodoFilter || '') + '"]')
        .addClass('selected');
    } else {
      this.$main.hide();
      this.$footer.hide();
    }
    this.allCheckbox.checked = !remaining;
  },

  // Add a single todo item to the list by creating a view for it, and
  // appending its element to the '<ul>'.
  addOne: function (todo) {
    var view = new app.TodoView({ 
      model: todo 
    });
    $('#todo-list').append(view.render().el);
  },

  // Add all items in the collection at once.
  addAll: function () {
    this.$('#todo-list').html('');
    app.Todos.each(this.addOne, this);
  },

  filterOne: function (todo) {
    todo.trigger('visible');
  },

  // Toggles which todo items are visible based on the filter currently selected in the UI (all, completed or remaining) via calls to filterOne().
  filterAll: function () {
    app.Todos.each(this.filterOne, this);
  },

  // Generate the attributes for a new Todo item.
  newAttributes: function () {
    return {
      title: this.$input.val().trim(),
      order: app.Todos.nextOrder(),
      completed: false
    };
  },

  // If you hit return in the main input field, create new Todo model,
  // persisting it to localStorage.
  createOnEnter: function (event) {
    // this is refers to the view and not the DOM element since the callback was bound using the events hash.
    if (event.which !== ENTER_KEY || !this.$input.val().trim()) {
      return;
    }

    app.Todos.create(this.newAttributes());
    this.$input.val('');
  },

  // Clear all completed todo items, destroying their models.
  clearCompleted: function() {
    _.invoke(app.Todos.completed(), 'destroy');
    return false;
  },

  toggleAllComplete: function() {
    var completed = this.allCheckbox.checked;

    app.Todos.each(function(todo) {
      todo.save({
        'completed': completed
      });
    });
  }
});

