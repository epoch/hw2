var app = app || {};

// Kind of like the Rails router with embedded actions.
// Makes the application navigatable, with meaningful URLs.
app.AppRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
  },

  index: function () {
    var flightView = new app.FlightView({collection: app.flights});
    flightView.render();
  }
});
