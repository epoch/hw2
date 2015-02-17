// https://gist.github.com/wofockham/7c37700256434ccba6df

console.log("hello mta js");

subwayLines = {
    "N": ["Times Square(N)", "34th(N)", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
    "L": ["8th(L)", "6th(L)", "Union Square", "3rd(L)", "1st(L)"],
    "6": ["Grand Central(6)", "33rd(6)", "28th(6)", "23rd(6)", "Union Square", "Astor Place(6)"]
}

var lineOn = "6"

var stopOn = "Astor Place(6)"

var lineOff = "N"

var stopOff = "34th(N)"

var indexStopOn = subwayLines[lineOn].indexOf(stopOn) 

var indexStopOff = subwayLines[lineOff].indexOf(stopOff) 

var indexUnionSquareOn = subwayLines[lineOn].indexOf("Union Square")

var indexUnionSquareOff = subwayLines[lineOff].indexOf("Union Square")

var stations = function(indexStopOn, indexStopOff, indexUnionSquareOn, indexUnionSquareOff){

    if(lineOn === lineOff){

        // list stations and stops for single line journey

        if(indexStopOn < indexStopOff){
            
            var totalStations = subwayLines[lineOn].slice(indexStopOn, indexStopOff + 1);
            console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
            
            for ( var i = 0; i < totalStations.length; i++ ){
                console.log(totalStations[i]);
            };

        }else {
            var totalStations = subwayLines[lineOn].slice(indexStopOff, indexStopOn + 1);
            var totalStations = totalStations.reverse();

            console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");

            for ( var i = 0; i < totalStations.length; i++ ){
                console.log(totalStations[i]);
            };
        }

    }else {

        // list stations and stops for changeover journey

        if(indexStopOn < indexUnionSquareOn){
            var stationsBeforeChangeoverArr = subwayLines[lineOn].slice(indexStopOn, indexUnionSquareOn);
        }else if (indexStopOn > indexUnionSquareOn) {
            var stationsBeforeChangeoverArr = subwayLines[lineOn].slice(indexUnionSquareOn, indexStopOn + 1);
            var stationsBeforeChangeoverArr = stationsBeforeChangeoverArr.reverse();
        }

        if(indexStopOff < indexUnionSquareOff){
            var stationsAfterChangeoverArr = subwayLines[lineOff].slice(indexStopOff, indexUnionSquareOff);
            var stationsAfterChangeoverArr = stationsAfterChangeoverArr.reverse();
        }else if (indexStopOff > indexUnionSquareOff){
            var stationsAfterChangeoverArr = subwayLines[lineOff].slice(indexUnionSquareOff, indexStopOff + 1);
        }
        // var stationsAfterChangeoverArr = stationsAfterChangeoverArr.shift;

        var totalStations = stationsBeforeChangeoverArr.concat(stationsAfterChangeoverArr);

        // totalStations.push(stationsBeforeChangeoverArr, stationsAfterChangeoverArr);

        console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");

        for ( var i = 0; i < totalStations.length; i++ ){
            console.log(totalStations[i]);
        };

    }

};

stations(indexStopOn, indexStopOff, indexUnionSquareOn, indexUnionSquareOff);

var changeover = function(lineOn, lineOff){
    // say whether the person needs to change lines at Union Square
    if(lineOn != lineOff){
        var changeover = true
        console.log ("Don't forget to change lines at Union Square.");
    }
};
changeover(lineOn, lineOff);

var alreadyAtDestination = function(stopOn, stopOff){
    // tell the user if they're already at their destination
    if(stopOn === stopOff){
        var atDestination = true
        console.log ("Looks like you're alreay there!");
    }
};
alreadyAtDestination(stopOn, stopOff);


// var fruits = ["Banana", "Orange", "Lemon", "Apple", "Mango"];
// var citrus = fruits.slice(1, 3);


// var stops = function(indexStopOn, indexStopOff, indexUnionSquareOn, indexUnionSquareOff){

//     if(lineOn === lineOff){

//         // calculate stops for single line journey
//         var numStops = Math.abs(indexStopOff - indexStopOn);
//         // console.log("There are " + numStops + " stops until you reach your destination.");

//     }else {

//         // calculate stops for changeover journey
//         var stationsBeforeChangeover = Math.abs(indexUnionSquareOn - indexStopOn);
//         var stationsAfterChangeover = Math.abs(indexStopOff - indexUnionSquareOff);
//         var numStops = stationsBeforeChangeover + stationsAfterChangeover;
//         // console.log("There are " + numStops + " stops until you reach your destination.");
//     }

// };

// stops(indexStopOn, indexStopOff, indexUnionSquareOn, indexUnionSquareOff);







