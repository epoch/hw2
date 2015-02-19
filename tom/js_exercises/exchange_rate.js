var dollarsToPounds = function(dollar_amt) {
  var exchange_amt = (dollar_amt * 0.5049).toFixed(2);
  console.log("A$" + dollar_amt + " is £" + exchange_amt);
};

dollarsToPounds(1);

var poundsToDollars = function(sterling_amt) {
  var exchange_amt = (sterling_amt * 1.9805).toFixed(2);
  console.log("£" + sterling_amt + " is A$" + exchange_amt);
};

poundsToDollars(1);
