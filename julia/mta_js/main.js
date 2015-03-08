var subway = {
    n: ['Times Square', '34th', '28th on N', '23rd on N', 'Union Square', '8th on N'],
    l: ['8th on L', '6th', 'Union Square', '3rd', '1st'],
    six: ['Grand Central', '33rd', '28th on Six', '23rd on Six', 'Union Square', 'Astor Place']
  }

var journey = {
  
  journeyDetails: function (line1, line2, stop1, stop2, subway){
    // Subway Line Variables
    var originLine = subway[line1];
    var destinationLine = subway[line2];

    // Intersection Variables
    var originIntersect = originLine.indexOf('Union Square');
    var destinationIntersect = destinationLine.indexOf('Union Square');

    var numberOfStops;
    var stopNames;
    var originDetails;
    var destinationDetails;

    if (originLine === destinationLine) { // Single Journey
      originStation = originLine.indexOf(stop1);
      destinationStation = destinationLine.indexOf(stop2);

      if (originStation < destinationStation) {
        stopNames = originLine.slice(originStation, destinationStation + 1);
        for (var i = 0; i < stopNames.length; i++) {
          console.log(stopNames[i]);
        };
        numberOfStops = Math.abs(originStation - destinationStation);

      } else {
        stops = originLine.slice(destinationStation, originStation + 1);
        for (var i = stopNames.length - 1; i >= 0; i--) {
          console.log(stopNames[i]);
        };
        numberOfStops = Math.abs(originStation - destinationStation);
      };

    } else { // Multi-line Journey
      originStation = originLine.indexOf(stop1);
      destinationStation = destinationLine.indexOf(stop2);

      if (originStation < destinationStation) {
        var originStopNames = originLine.slice(originStation, originIntersect).join(', ');
        var destinationStopNames = destinationLine.slice(destinationIntersect, destinationStation + 1).join(', ');
        stopNames = (originStopNames + ", " + destinationStopNames).split(', ');

        for (var i = 0; i < stopNames.length; i++) {
          console.log(stopNames[i]);
        };
        numberOfStops = Math.abs(originStation - originIntersect) + (destinationStation - destinationIntersect);
        console.log(numberOfStops);

      } else if (originStation > destinationStation) {
        var originStopNames = originLine.slice(originIntersect, originStation + 1).join(', ');
        var destinationStopNames = destinationLine.slice(destinationStation, destinationIntersect).join(', ');
        stopNames = (destinationStopNames + ", " + originStopNames).split(', ');
        for (var i = 0; i < stopNames.length; i++) {
          console.log(stopNames[i]);
        };
        numberOfStops = Math.abs(originIntersect - originStation) + (destinationIntersect - destinationStation);

        console.log(numberOfStops);

      } else if (originStation === destinationStation) {
        var originStopNames = originLine.slice(originStation, originIntersect + 1).join(', ');
        var destinationStopNames = destinationLine.slice(destinationStation, destinationIntersect - 1).join(', ');
        // console.log(originStopNames);
        // console.log(destinationStopNames);

        stopNames = (originStopNames + ", " + destinationStopNames).split(', ');

        for (var i = 0; i < stopNames.length; i++) {
          console.log(stopNames[i]);
        };
        numberOfStops = Math.abs(originIntersect - originStation) + (destinationIntersect - destinationStation);

        console.log(numberOfStops);
      };
    }
  }
}

var result = journey.journeyDetails('n', 'l', 'Times Square', '8th on L', subway);
