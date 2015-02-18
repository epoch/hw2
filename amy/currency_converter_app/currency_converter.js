// https://gist.github.com/wofockham/7658dd6baf784e710a12

var dollarsToPoundsExchangeRate = 0.5038;
var poundsToDollarsExchangeRate = 1.9841;

// var dollarAmount = 10

var dollarsToPounds = function(dollar){
  var calc = dollar * dollarsToPoundsExchangeRate
  console.log(dollar + " dollars converted to pounds is " + calc.toFixed(2) + ".")
};

dollarsToPounds(10);

var poundsToDollars = function(pounds){
  var calc = pounds * poundsToDollarsExchangeRate
  console.log( pounds + " pounds converted to dollars is " + calc.toFixed(2) + ".")
};
poundsToDollars(10);

