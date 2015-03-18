var app = app || {};

app.flights = new app.Flights();
app.users = new app.Users();

$(document).ready(function() {
  
  if ($('#main').length === 0) {
    return;
  }

  // Replace <%= erb style %> with {{ Handlebars style }}
  // to prevent a conflict with Rails views.
  _.templateSettings = {
    interpolate: /\{\{(.+?)\}\}/g
  };

  app.users.fetch();

  app.flights.fetch().done(function () {
      // This is global so we access it inside certain views.
    app.appRouter = new app.AppRouter();

    // This kicks off the router and makes the Back and Foward buttons work.
    Backbone.history.start();
  });

});
