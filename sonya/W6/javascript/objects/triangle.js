/*
Write an area function in JavaScript that calculates the area of triangle:
Make sure your program detects triangles with invalid sizes 
(e.g. there are no triangles with sides 1, 1 and 15)
Step 1: sides = (a+b+c)/2
Step 2: area = √(sides*(sides-a)*(sides-b)*(sides-c)

a + b > c = 17 > 5
a + c > b = 12 > 10
b + c > a = 15 > 7
*/


var triangle = function(a, b, c){
  var sides = (a + b + c) / 2;
  var area = (sides - a)*(sides - b)*(sides - c) * sides;
  var areaSq = Math.sqrt(area);
  console.log("The area of your triangle is " + areaSq.toFixed(0));
};

triangle(3, 4, 5);