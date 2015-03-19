// Todo: set urlRoot (see comment.js from backboneblog)

var app = app || {};

app.Reservation = Backbone.Model.extend({
  urlRoot: function () {
    return '/flights/' + this.get('flight_id') + '/reservations';
  },
  defaults: {
    seat_row: 0,
    seat_column: 'not selected'
  }
});
