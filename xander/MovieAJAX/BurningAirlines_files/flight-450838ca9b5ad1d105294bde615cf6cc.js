// Todo: set urlRoot (see comment.js from backboneblog)

var app = app || {};

app.Flight = Backbone.Model.extend({
  defaults: {
    flight_num: 0,
    date: '2012-04-23T18:25:43.511Z',
    origin: 'no origin set',
    destination: 'no destination set'
  }
});
