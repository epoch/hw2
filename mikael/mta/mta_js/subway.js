var subway = {
  'N' : ['TIMES SQUARE', '34N', '28N', '23N', 'UNION STATION', '8N'],
  'L' : ['8L', '6L', 'UNION STATION', '3L', '1L'],
  'S' : ['GRAND CENTRAL', '33S', '28S', '23S', 'UNION STATION', 'ASTOR PLACE']
};

console.log('Start line? (N, L or S)');
var lineStart = prompt('Selection: ');

console.log('Start station? ' + subway[lineStart]);
var stationStart = prompt('Selection: ');

console.log('End line? (N, L or S)');
var lineEnd = prompt('Selection: ');

console.log('Stop line? ' + subway[lineEnd]);
var stationEnd = prompt('Selection: ');

var start = subway[lineStart].indexOf(stationStart);
var end = subway[lineEnd].indexOf(stationEnd);
var startUnionStation = subway[lineStart].indexOf("UNION STATION");
var stopUnionStation = subway[lineEnd].indexOf("UNION STATION");

var trip = [];

if (lineStart === lineEnd) {
  if (start < end) {
    for(n = start; n <= end; n++){
      var tripStops = subway[lineStart][n];
      trip.push(tripStops);
    }
  } else if (start > end){
      for(n = end; n <= start; n++){
        var tripStops = subway[lineStart][n];
        trip.push(tripStops);
      }
  }
  var tripLength = trip.length;
} else {
  if (start < startUnionStation) {
    for(n = start; n <= startUnionStation; n++){
      var tripStops = subway[lineStart][n];
      trip.push(tripStops);
    }
  }
  if (end < stopUnionStation) {
    for (n = end; n <= (stopUnionStation + 1); n++) {
      var tripStops = subway[lineEnd][n];
      trip.push(tripStops);
    }
  }
  if (start > startUnionStation) {
    for (n = startUnionStation; n <= start; n++) {
      var tripStops = subway[lineStart][n];
      trip.push(tripStops);
    }
  }
  if (end > stopUnionStation) {
    for (n = (stopUnionStation + 1); n <= end; n++) {
      var tripStops = subway[lineEnd][n];
      trip.push(tripStops);
    }
  }
  var tripLength = trip.length;
}
var trip = trip.join(", ");

alert("Your trip: " + trip + " with " + tripLength + " stops.");
