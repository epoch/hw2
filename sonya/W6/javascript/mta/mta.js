var subway = {
  nLine: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  lLine: ['8th', '6th', 'Union Square', '3rd', '1st'],
  sixLine: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
};

function stopsBetween(startLine, startStation, endLine, endStation, transferStation) {
  var stopsToUnion = subway[startLine].indexOf(transferStation) - subway[startLine].indexOf(startStation);
  var stopsFromUnion = subway[endLine].indexOf(endStation) - subway[endLine].indexOf(transferStation);
  var countStopsWithTransfer = Math.abs(stopsToUnion) + Math.abs(stopsFromUnion);

  if (startLine === endLine) {
    var sameLineCalc = subway[endLine].indexOf(endStation) - subway[startLine].indexOf(startStation);
    return sameLineCalc;
  } else if (startLine != endLine) {
    return countStopsWithTransfer;
  } 
}

// TESTS
var singleLineJourney = stopsBetween("nLine", "34th", "nLine", "8th");
if (singleLineJourney !== 4) {
  console.log("Expected single line journey to have 4 stops, actually has", singleLineJourney);
} else {
  console.log("There are", singleLineJourney, "stops");
}

var multiLineJourney = stopsBetween("nLine", "23rd", "lLine", "3rd", "Union Square");
if (multiLineJourney !== 2) {
  console.log("Expected multi-line journey to have 2 stops, actually has", multiLineJourney);
} else {
  console.log("There are", multiLineJourney, "stops");
}

var multiLineJourneyBackwards = stopsBetween("nLine", "8th", "lLine", "6th", "Union Square");
if (multiLineJourneyBackwards !== 2) {
  console.log("Expected multi-line journey to have 2 stops, actually has", multiLineJourneyBackwards);
} else {
  console.log("There are", multiLineJourneyBackwards, "stops");
}

var multiLineJourneyChangeDirection = stopsBetween("nLine", "8th", "lLine", "3rd", "Union Square");
if (multiLineJourneyChangeDirection !== 2) {
  console.log("Expected multi-line journey to have 2 stops, actually has", multiLineJourneyChangeDirection);
} else {
  console.log("There are", multiLineJourneyChangeDirection, "stops");
}

var multiLineJourneyStartUnion = stopsBetween("nLine", "Union Square", "lLine", "3rd", "Union Square");
if (multiLineJourneyStartUnion !== 1) {
  console.log("Expected multi-line journey to have 1 stops, actually has", multiLineJourneyStartUnion);
} else {
  console.log("There are", multiLineJourneyStartUnion, "stops");
}