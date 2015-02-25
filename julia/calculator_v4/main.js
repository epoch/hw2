var squareBtn = document.getElementById('square-button');
var halfBtn = document.getElementById('half-button');
var percentBtn = document.getElementById('percent-button');
var areaCircBtn = document.getElementById('area-button');

var square = function(num1) {
  var num1 = document.getElementById("square-input").value;
  var squaredNumber = num1 * num1;
  solution.innerHTML = "The result of squaring the number " + num1 + " is " + squaredNumber;
  return squaredNumber;
}

var half = function(num1) {
  var num1 = document.getElementById("half-input").value;
  var half = num1 / 2;
  solution.innerHTML = 'Half of ' + num1 + ' is ' +  half;
  return half;
}

var percent = function(num1, num2) {
  var num1 = document.getElementById("percent1-input").value;
  var num2 = document.getElementById("percent2-input").value;
  var percent = (num1/num2) * 100;
  solution.innerHTML = num1 + ' is ' + percent + '% of ' + num2;
  return percent;
}

var areaCircle = function(radius) {
  var radius = document.getElementById("area-input").value;
  var area = Math.PI * Math.sqrt(radius);
  solution.innerHTML = 'The area of circle with radius ' + radius + ' is ' + area;
  return area;
}

squareBtn.addEventListener('click', square);
halfBtn.addEventListener('click', half);
percentBtn.addEventListener('click', percent);
areaCircBtn.addEventListener('click', areaCircle);

