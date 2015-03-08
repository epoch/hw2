var GPB = 1.982;
var AU = 1/GPB;
var dollars = 100;
var pounds = 230;

var dollarsToPounds = function(dollars) {
  return (dollars/GPB).toFixed(2);
}

var AUInGBP = (dollarsToPounds(dollars))
console.log('$ ' + dollars + ' is ' + '£' + AUInGBP + '.')


var poundsToDollars = function(pounds) {
  return (pounds/AU).toFixed(2);
} 

var GBPInAU = (poundsToDollars(pounds))
console.log('£ ' + pounds + ' is ' + '$' + GBPInAU + '.')