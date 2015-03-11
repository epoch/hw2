// This will be in charge of individual Todo records, making sure the view updates when the todo does. 
// To enable this functionality, we will add event listeners to the view that listen for events on an individual todo’s HTML representation.

var app = app || {};

// Todo Item View
// --------------

// The DOM element for a todo item...

app.TodoView = Backbone.View.extend({

  //... is a list tag.
  tagName: 'li',

  // Cache the template function for a single item.
  template: _.template( $('#item-template').html() ),

  // The DOM events specific to an item.
  events: {

    'click .toggle': 'togglecompleted',
    'dblclick label': 'edit',
    'click .destroy': 'clear',           
    'keypress .edit': 'updateOnEnter',
    'blur .edit': 'close'
  },

  // The TodoView listens for changes to its model, re-rendering. Since there's
  // a one-to-one correspondence between a **Todo** and a **TodoView** in this
  // app, we set a direct reference on the model for convenience.
  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'visible', this.toggleVisible);
  },

  // Re-renders the titles of the todo item.
  render: function(){
    this.$el.html(this.template(this.model.attributes));
    this.$input = this.$('.edit');
    return this;
  },

  // Toggles visibility of item
  toggleVisible: function(){
    this.$el.toggleClass('hidden', this.isHidden());
  },

  // Determines if item should be hidden
  isHidden: function(){
    var isCompleted = this.model.get('completed');
    return(//hidden cases only
      (!isCompleted && app.TodoFilter === 'completed')
      || (isCompleted && app.TodoFilter === 'active')
     );
  },

  // Toggle the `"completed"` state of the model.
  togglecompleted: function(){
    this.model.toggle();
  },

  // Switch this view into `"editing"` mode, displaying the input field.
  edit: function(){
    this.$el.addClass('editing');
    this.$input.focus();
  },

  // // close the editing mode, saving changes to the todo
  // close: function(){
  //   var value = this.$input.val().trim();

  //   if(value){
  //     this.model.save({title:value});
  //   }
  //   this.$el.removeClass('editing');
  // },


  // Close the `"editing"` mode, saving changes to the todo.
  close: function() {
    var value = this.$input.val().trim();

    if ( value ) {
      this.model.save({ title: value });
    } else {
      this.clear(); // NEW
    }

    this.$el.removeClass('editing');
  },


  // If you hit `enter`, we're through editing the item.
  updateOnEnter: function(){
    if(e.which === ENTER_KEY){
      this.close();
    }
  },

  // Remove the item, destroy the model from *localStorage* and delete its view.
  clear: function(){
    this.model.destroy();
  }

});