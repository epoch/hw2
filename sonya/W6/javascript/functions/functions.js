// Exercise 1: Fortune Teller

var tellFortune = function(numChildren, partnerName, geoLocation, job) {
  var future = 'You will be a ' + job + ' in ' + geoLocation + ' and married to ' + partnerName + ' with ' + numChildren + ' kids.';
  console.log(future);
};

tellFortune(4, 'Hooch', 'Seattle', 'Undertaker');
tellFortune(2, 'Dirty', 'Canada', 'Dev');

/*
Exercise 2: The Age Calculator
*/

var calculateAge = function(birthYear, currentYear) {
  var year = new Date().getFullYear();
  var age = year - birthYear;
  console.log('You are either ' + age + ' or ' + (age - 1)); 
}

calculateAge(1984, 2015);

/*
Exercise 3: Lifetime
*/

var calculateSupply = function(age, amountPerDay) {
  var maxAge = 85;
  var totalNeeded = parseInt(amountPerDay * 365) * (maxAge - age); 
  console.log('You will need ' + totalNeeded + ' to last you until the ripe out age of ' + maxAge + '.' );
};

calculateSupply(30, 5);
calculateSupply(1, 2);


/*Exercise 4: The Circle
Math.round(circumference * 100)/100
parseInt
*/

var calcCircumfrence = function(radius) {
  var circumference = 2 * Math.PI * radius;
  console.log('The circumference is '+ circumference);
};

var calcArea = function(radius){
  var area = Math.PI * radius * radius;
  console.log('The area is '+ area);
};

calcCircumfrence(5);
calcArea(10);

/*Create a function called celsiusToFahrenheit:

Store a celsius temperature into a variable.
Convert it to fahrenheit and output "NN°C is NN°F".
Create a function called fahrenheitToCelsius:

Now store a fahrenheit temperature into a variable.
Convert it to celsius and output "NN°F is NN°C."
*/

var celsiusToFahrenheit = function(celsius){
  var celsiusToFahrenheit = (celsius * 9 )/5 + 32;
  console.log(celsius + '°C is ' + celsiusToFahrenheit + '°F'); 
};

celsiusToFahrenheit(40);

/* Exercise 1: Greater Number
Write a function named greaterNum that:
takes 2 arguments, both numbers.
returns whichever number is the greater (higher) number.
Call that function 2 times with different number pairs, and log the output to make sure it works (e.g. "The greater number of 5 and 10 is 10.").
*/

var greaterNum = function(num1, num2){
  if (num1 > num2) {
    return num1;
  } else {
    return num2;
  }
};

console.log(greaterNum(5, 10));
// console.log('The greater number of ' + num1 + ' and ' + num2 + ' is ' + greaterNum(5, 10));

/* Exercise 2: World Translator
Write a function named helloWorld that:
takes 1 argument, a language code (e.g. "es", "de", "en")
returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
Call that function for each of the supported languages and log the result to make sure it works.
*/

var helloWorld = function(lang){
  if (lang === 'fr') {
    return 'Bonjour le monde';
  } else if (lang === 'es') {
    return 'Hola, Mundo';
  } else {
    return 'Hello World';
  }
};

console.log(helloWorld('en'));
console.log(helloWorld('fr'));
console.log(helloWorld('es'));

/* Exercise 3 - Grader
Write a function named assignGrade that:
takes 1 argument, a number score.
returns a grade for the score, either "A", "B", "C", "D", or "F".
Call that function for a few different scores and log the result to make sure it works.
*/

var assignGrade = function(numberScore){
  if (numberScore >= 85) {
    return 'A';
  } else if (numberScore >= 70) {
    return 'B';
  } else if (numberScore >= 50) {
    return 'C';
  } else if (numberScore >= 44) {
    return 'D';
  } else {
    return 'F';
  }
};

console.log('You got a ' + assignGrade(95));
console.log('You got a ' + assignGrade(65));

/*
The Pluralizer
Write a function named pluralize that:
takes 2 arguments, a noun and a number.
returns the number and pluralized form, like "5 cats" or "1 dog".
Call that function for a few different scores and log the result to make sure it works.
Bonus: Make it handle a few collective nouns like "sheep" and "geese".
*/

var pluralizeThat = function(noun, number){
  if (number != 1 && noun != 'sheep' && noun != 'fish') {
    return number + ' ' + noun + 's';
  } else {
    return number + ' ' + noun;
  }
};

console.log('I have ' + pluralizeThat('cat', 0));
console.log('I have ' + pluralizeThat('cat', 1));
console.log('I have ' + pluralizeThat('dog', 2));
