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
var startUnionSq = subway[lineStart].indexOf("UNION STATION");
var endUnionSq = subway[lineEnd].indexOf("UNION STATION");

var trip = [];

if (lineStart === lineEnd) {
  if (start < end) {
    for(i = start; i <= end; i++){
      var tripStops = subway[lineStart][i];
      trip.push(tripStops);
    }
  } else if (start > end){
      for(i = end; i <= start; i++){
        var tripStops = subway[lineStart][i];
        trip.push(tripStops);
      }
  }
  var tripLength = trip.length;
} else {
  if (start < startUnionSq) {
    for(i = start; i <= startUnionSq; i++){
      var tripStops = subway[lineStart][i];
      trip.push(tripStops);
    }
  }
  if (end < endUnionSq) {
    for (i = end; i <= (endUnionSq + 1); i++) {
      var tripStops = subway[lineEnd][i];
      trip.push(tripStops);
    }
  }
  if (start > startUnionSq) {
    for (i = startUnionSq; i <= start; i++) {
      var tripStops = subway[lineStart][i];
      trip.push(tripStops);
    }
  }
  if (end > endUnionSq) {
    for (i = (endUnionSq + 1); i <= end; i++) {
      var tripStops = subway[lineEnd][i];
      trip.push(tripStops);
    }
  }
  var tripLength = trip.length;
}
  var trip = trip.join(", ");

alert("Your trip: " + trip + " with " + tripLength + " stops.");
