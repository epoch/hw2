// The Fortune Teller
// Write a function named tellFortune that takes 4 arguments: number of children, partner's name, geographic location, job title.
// Outputs your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."
// Call that function 3 times with 3 different values for the arguments.

var tellFortune = function(numChildren, partnerName, geoLocation, jobTitle) {
  console.log("You will be a " + jobTitle + " in " + geoLocation + ", and married to " + partnerName + " with " + numChildren + " kids.");
};

tellFortune(4, 'Frank', 'Paris', 'Developer');
tellFortune(2, 'Ryan', 'New York', 'Designer');
tellFortune(3, 'Seb', 'London', 'Developer');

// The Age Calculator
// Write a function named calculateAge that takes 2 arguments: birth year, current year. Calculates the 2 possible ages based on those years. outputs the result to the screen like so: "You are either NN or NN"
// Call the function three times with different sets of values.
// Bonus: Figure out how to get the current year in JavaScript instead of passing it in.

var calculateAge = function(birthYear) {
  var currentYear = (new Date()).getFullYear();
  var ageOne = currentYear - birthYear;
  var ageTwo = ageOne - 1; 
  console.log("You are either " + ageOne + " or " + ageTwo + ".");
};

calculateAge(1980);
calculateAge(1983);
calculateAge(1986);

// The Lifetime Supply Calculator
// Write a function named calculateSupply that takes 2 arguments: age, amount per day. Calculates the amount consumed for rest of the life (based on a constant max age). Outputs the result to the screen like so: "You will need NN to last you until the ripe old age of X". Call that function three times, passing in different values each time.
// Bonus: Accept floating point values for amount per day, and round the result to a round number.

var calculateSupply = function(age, amountPerDay) {
  var constantMaxAge = 100;
  var numYears = constantMaxAge - age;
  var totalAmount = Math.round((amountPerDay * 365) * numYears); 
  console.log("You will need " + totalAmount + " to last you until the ripe old age of " + constantMaxAge + ".");
} 

calculateSupply(20, 1.8);
calculateSupply(53, 7);
calculateSupply(44, 2);


// The Geometrizer
// Create 2 functions that calculate properties of a circle.
// Create a function called calcCircumfrence: Pass the radius to the function.
// Calculate the circumference based on the radius, and output "The circumference is NN".
// Create a function called calcArea: Pass the radius to the function.
// Calculate the area based on the radius, and output "The area is NN".

var calcCircumfrence = function(radius) {
  var circumference = Math.round(2 * Math.PI * radius);
  console.log("The circumference is " + circumference + ".")
}

calcCircumfrence(25);

var calcArea = function(radius) {
  var area = Math.round(Math.PI * radius * radius);
  console.log("The area is " + area + ".")
}
calcArea(25);

// The Temperature Converter
// Create a function called celsiusToFahrenheit:
// Store a celsius temperature into a variable.
// Convert it to fahrenheit and output "NN°C is NN°F".
// Create a function called fahrenheitToCelsius:
// Now store a fahrenheit temperature into a variable.
// Convert it to celsius and output "NN°F is NN°C."

var celsiusToFahrenheit = function() {
  var celsius = 25;
  var fahrenheit = Math.fround(1.8 * celsius + 32);
  console.log(celsius + "°C is " + fahrenheit + "°F.");
}
celsiusToFahrenheit();

var fahrenheitToCelsius = function() {
  var fahrenheit = 116.6;
  var celsius = Math.fround((fahrenheit - 32) / 1.8);
  console.log(fahrenheit + "°F is " + celsius + "°C.")
}
fahrenheitToCelsius();


// Which number's bigger?
// Write a function named greaterNum that:

// takes 2 arguments, both numbers.
// returns whichever number is the greater (higher) number.
// Call that function 2 times with different number pairs, and log the output to make sure it works (e.g. "The greater number of 5 and 10 is 10.").

// var greaterNum = function(x, y) {
//   if (x > y) {
//     console.log("The greater number of " + x + " and " + y + " is " + x + ".");
//   } else {
//     console.log("The greater number of " + y + " and " + x + " is " + y + ".");
//   }
// };

// greaterNum(3,5);
// greaterNum(90,16);

var greaterNum = function(x, y) {
  if (x > y) {
    return x;
  } else {
    return y;
  }
}

var x = 3;
var y = 90;
console.log("The greater number of " + x + " and " + y + " is " + greaterNum(x, y) + ".");

x = 90;
y = 3;
console.log("The greater number of " + x + " and " + y + " is " + greaterNum(x, y) + ".");



// The World Translator
// Write a function named helloWorld that: takes 1 argument, a language code (e.g. "es", "de", "en")
// returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
// Call that function for each of the supported languages and log the result to make sure it works.

// var helloWorld = function(langCode) {
//   if (langCode === 'es') {
//     console.log("Hola, Mundo");
//   } 
//   else if (langCode === 'fr') {
//     console.log("Bonjour, le monde");
//   } 
//   else {
//     console.log("Hello, World");
//   };
// };

// helloWorld('fr');
// helloWorld('es');
// helloWorld('en');


var helloWorld = function(langCode) {
  if (langCode === 'es') {
    return "Hola, Mundo";
  } 
  else if (langCode === 'fr') {
    return "Bonjour, le monde";
  } 
  else {
    return "Hello, World";
  }
}

console.log(helloWorld('fr'));
console.log(helloWorld('es'));
console.log(helloWorld('en'));


// The Grade Assigner
// Write a function named assignGrade that: takes 1 argument, a number score.
// returns a grade for the score, either "A", "B", "C", "D", or "F".
// Call that function for a few different scores and log the result to make sure it works.

// var assignGrade = function(numScore) {
//   if (numScore >= 90) {
//     console.log('A');
//   } 
//   else if (numScore >= 80 ) {
//     console.log('B');
//   }
//   else if (numScore >= 50) {
//     console.log('C');
//   }
//   else if (numScore >= 30) {
//     console.log('D');
//   }
//   else if (numScore >= 20) {
//     console.log('E');
//   }
//   else {
//     console.log('F')
//   }
// }


var assignGrade = function(numScore) {
  if (numScore >= 90) {
    return 'A';
  } else if (numScore >= 80 ) {
    return 'B';
  } else if (numScore >= 50) {
    return 'C';
  } else if (numScore >= 30) {
    return 'D';
  } else if (numScore >= 20) {
    return 'E';
  } else {
    return 'F';
  }
}


console.log(assignGrade(100));
console.log(assignGrade(81));
console.log(assignGrade(59));
console.log(assignGrade(32));
console.log(assignGrade(21));
console.log(assignGrade(1));


// The Pluralizer
// Write a function named pluralize that:

// takes 2 arguments, a noun and a number.
// returns the number and pluralized form, like "5 cats" or "1 dog".
// Call that function for a few different scores and log the result to make sure it works.
// Bonus: Make it handle a few collective nouns like "sheep" and "geese".

var pluralize = function(noun, number) {
  if (number === 1) {
    return number + " " + noun;
  } else {
    return number + " " + noun + "s";
  };
}

console.log(pluralize('cat', 2));
console.log(pluralize('dog', 1));

