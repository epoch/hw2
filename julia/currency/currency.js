// Currency Converter App
// Find the exchange rate between dollars and pounds
// Store the exchange rate in a variable

// Converting dollars to pounds:
// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".

// Converting pounds to dollars:
// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:
// Can you make sure the output is only 2 decimal places?

// Refactoring
// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars

var exchangeRate = 0.504955;

// var dollar = 20.63;
// var convertPound = dollar * exchangeRate;
// console.log("$" + dollar + " is £" + convertPound.toFixed(2))

// var pound = 20.97;
// var convertDollar = exchangeRate * pound;
// console.log("£" + pound + " is $" + convertDollar.toFixed(2))

var dollarsToPounds = function(dollar) {
  var convertPound = dollar * exchangeRate;
  console.log("$" + dollar + " is £" + convertPound.toFixed(2))
}
dollarsToPounds(20);

var poundsToDollars = function(pound) {
  var convertDollar = exchangeRate * pound;
  console.log("£" + pound + " is $" + convertDollar.toFixed(2))
}
poundsToDollars(20);


