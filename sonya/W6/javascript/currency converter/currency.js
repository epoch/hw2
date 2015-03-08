/*
Find the exchange rate between dollars and pounds
1.9806AUD = 1GBP
Store the exchange rate in a variable

Converting dollars to pounds:
Store a dollar amount into a variable.
Convert it to pounds and output "$NN is £NN".
Converting pounds to dollars:

Now store a pound amount into a variable.
Convert it to dollar and output "£NN is $NN."
Cleaning it up:

Can you make sure the output is only 2 decimal places?
Refactoring

Can you refactor the code so that it uses functions? 
Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
Do the same for poundsToDollars
*/

var dollarsToPounds = function(dollar){
 var exchangeRate = 0.504550;
 result = (dollar * exchangeRate);
 console.log("$" + dollar.toFixed(2) + " is " + "£" + result.toFixed(2));
};

dollarsToPounds(10);

var poundsToDollars = function(pound){
 var exchangeRate = 1.98196;
 result = (pound * exchangeRate);
 console.log("£" + pound.toFixed(2) + " is " + "$" + result.toFixed(2));
};

 poundsToDollars(10);