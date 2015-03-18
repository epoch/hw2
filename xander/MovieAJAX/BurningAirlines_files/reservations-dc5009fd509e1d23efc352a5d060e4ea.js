var app = app || {};

app.Reservations = Backbone.Collection.extend({
  url: function () {
    return '/flights/' + this.flightID + '/reservations';
  },
  model: app.Reservation,
  initialize: function (options) {
    this.flightID = options.flight_id;
    // this.on('add', function (comment) {
    //   var commentView = new app.CommentView({model: comment});
    //   commentView.render();
    // });
  }
});
