const EXCHANGE_RATE = 0.65

var dollarsToPounds = function(dollars) {
  return "AUD$" + dollars + " is GBP£" + (dollars * EXCHANGE_RATE).toFixed(2);
}

console.log(dollarsToPounds(3.65));

var poundsToDollars = function(pounds) {
  return "GBP£" + pounds + " is AUD$" + (pounds / EXCHANGE_RATE).toFixed(2);
}

console.log(poundsToDollars(3.65));
