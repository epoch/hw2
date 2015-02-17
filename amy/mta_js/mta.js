// https://gist.github.com/wofockham/7c37700256434ccba6df

console.log("hello mta js");

var subwayLines = {
    "N": ["Times Square(N)", "34th(N)", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
    "L": ["8th(L)", "6th(L)", "Union Square", "3rd(L)", "1st(L)"],
    "6": ["Grand Central(6)", "33rd(6)", "28th(6)", "23rd(6)", "Union Square", "Astor Place(6)"]
}

var lineOn = "N"

var stopOn = "8th(N)"

var lineOff = "6"

var stopOff = "33rd(6)"

// var noStation = function(lineOn, stopOn, lineOff, stopOff){
    if( (subwayLines.hasOwnProperty(lineOn)) && (subwayLines.hasOwnProperty(lineOff)) && (subwayLines[lineOn].indexOf(stopOn) >= 0) && (subwayLines[lineOff].indexOf(stopOff) >= 0) ){

        var indexStopOn = subwayLines[lineOn].indexOf(stopOn);

        var indexStopOff = subwayLines[lineOff].indexOf(stopOff);

        var indexUnionSquareOn = subwayLines[lineOn].indexOf("Union Square");

        var indexUnionSquareOff = subwayLines[lineOff].indexOf("Union Square");

    }else {
        console.log("There is no stop or station by that name.");

    };

// var indexStopOn = subwayLines[lineOn].indexOf(stopOn) 

// var indexStopOff = subwayLines[lineOff].indexOf(stopOff) 

// var indexUnionSquareOn = subwayLines[lineOn].indexOf("Union Square")

// var indexUnionSquareOff = subwayLines[lineOff].indexOf("Union Square")

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
            var stationsBeforeChangeoverArr = subwayLines[lineOn].slice(indexStopOn, indexUnionSquareOn + 1);
        }else if (indexStopOn > indexUnionSquareOn) {
            var stationsBeforeChangeoverArr = subwayLines[lineOn].slice(indexUnionSquareOn, indexStopOn + 1);
            var stationsBeforeChangeoverArr = stationsBeforeChangeoverArr.reverse();
        }

        if(indexStopOff < indexUnionSquareOff){
            var stationsAfterChangeoverArr = subwayLines[lineOff].slice(indexStopOff, indexUnionSquareOff);
            var stationsAfterChangeoverArr = stationsAfterChangeoverArr.reverse();
        }else if (indexStopOff > indexUnionSquareOff){
            var stationsAfterChangeoverArr = subwayLines[lineOff].slice(indexUnionSquareOff + 1, indexStopOff + 1);
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




// !("key" in obj) // true if "key" doesn't exist in object
// !"key" in obj   // ERROR!  Equivalent to "false in obj"

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







