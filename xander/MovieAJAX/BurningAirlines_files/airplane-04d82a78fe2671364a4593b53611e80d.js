var app = app || {};

app.Airplane = Backbone.Model.extend({
  urlRoot: function () {
    return '/flights/' + this.get('flight_id') + '/airplane';
  },
  defaults: {
    name: 'New Plane',
    row: 0,
    column: 0
  }
});
