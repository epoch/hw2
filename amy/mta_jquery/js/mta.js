$(document).ready(function(){

    var subwayLines = {
        "N": ["Times Square(N)", "34th(N)", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
        "L": ["8th(L)", "6th(L)", "Union Square", "3rd(L)", "1st(L)"],
        "6": ["Grand Central(6)", "33rd(6)", "28th(6)", "23rd(6)", "Union Square", "Astor Place(6)"]
    }

    var generateDepartureForm = function(subwayLines){
        $.each(subwayLines, function(key, value){
            
            var lineOn = key
            var subwayLine = $('<optgroup label='+lineOn+'>').addClass('subway-line');
            subwayLine.appendTo('.departure');

            for (var i = 0; i < value.length; i++){
                var stopOn = value[i];
                var subwayStation = $("<option value='" + stopOn + "'>" + stopOn + "</option>").addClass('subway-station');
                subwayStation.appendTo(subwayLine);
            };
        });
    }
    generateDepartureForm(subwayLines);

    var generateDestinationForm = function(subwayLines){
        $.each(subwayLines, function(key, value){
            
            var lineOff = key
            var subwayLine = $('<optgroup label='+lineOff+'>').addClass('subway-line');
            subwayLine.appendTo('.destination');

            for (var i = 0; i < value.length; i++){
                var stopOff = value[i];
                var subwayStation = $("<option value='" + stopOff + "''>" + stopOff + "</option>").addClass('subway-station');
                subwayStation.appendTo(subwayLine);
            };
        });
    }
    generateDestinationForm(subwayLines);

    var listStations = function(){
        
        var selectedLineOn = $('select.departure option:selected').parent().attr('label');
        var selectedStopOn = $('select.departure option:selected').val();
        var indexStopOn = subwayLines[selectedLineOn].indexOf(selectedStopOn);
        var indexUnionSquareOn = subwayLines[selectedLineOn].indexOf("Union Square");
        // console.log (selectedLineOn, selectedStopOn, indexStopOn, indexUnionSquareOn);

        var selectedLineOff = $('select.destination option:selected').parent().attr('label');
        var selectedStopOff = $('select.destination option:selected').val();
        var indexStopOff = subwayLines[selectedLineOff].indexOf(selectedStopOff);
        var indexUnionSquareOff = subwayLines[selectedLineOff].indexOf("Union Square");
        // console.log (selectedLineOff, selectedStopOff, indexStopOff, indexUnionSquareOff);

        var numStops = $('<p></p>').addClass('num-stops');
        numStops.appendTo('.container');
        var stationsList = $('<ul></ul>').addClass('stations-list');
        stationsList.appendTo('.container');
        if(selectedLineOn === selectedLineOff){

            // list stations and stops for single line journey

            if(indexStopOn < indexStopOff){
                
                var totalStations = subwayLines[selectedLineOn].slice(indexStopOn, indexStopOff + 1);
                console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");

                for ( var i = 0; i < totalStations.length; i++ ){
                    console.log(totalStations[i]);
                    $('<li>' +totalStations[i]+ '</li>').addClass('stations-name').appendTo(stationsList);
                };

            }else {
                var totalStations = subwayLines[selectedLineOn].slice(indexStopOff, indexStopOn + 1);
                var totalStations = totalStations.reverse();

                console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");

                for ( var i = 0; i < totalStations.length; i++ ){
                    console.log(totalStations[i]);
                    $('<li>' +totalStations[i]+ '</li>').addClass('stations-name').appendTo(stationsList);
                };
            }

        }else {

            // list stations and stops for changeover journey

            if(indexStopOn < indexUnionSquareOn){
                var stationsBeforeChangeoverArr = subwayLines[selectedLineOn].slice(indexStopOn, indexUnionSquareOn + 1);
            }else if (indexStopOn > indexUnionSquareOn) {
                var stationsBeforeChangeoverArr = subwayLines[selectedLineOn].slice(indexUnionSquareOn, indexStopOn + 1);
                var stationsBeforeChangeoverArr = stationsBeforeChangeoverArr.reverse();
            }

            if(indexStopOff < indexUnionSquareOff){
                var stationsAfterChangeoverArr = subwayLines[selectedLineOff].slice(indexStopOff, indexUnionSquareOff);
                var stationsAfterChangeoverArr = stationsAfterChangeoverArr.reverse();
            }else if (indexStopOff > indexUnionSquareOff){
                var stationsAfterChangeoverArr = subwayLines[selectedLineOff].slice(indexUnionSquareOff + 1, indexStopOff + 1);
            }

            var totalStations = stationsBeforeChangeoverArr.concat(stationsAfterChangeoverArr);

            console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
            numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");

            for ( var i = 0; i < totalStations.length; i++ ){
                console.log(totalStations[i]);
                $('<li>' +totalStations[i]+ '</li>').addClass('stations-name').appendTo(stationsList);
            };

        }

    };

$('.submit').on('click', listStations);

}); // end document.ready


    // var getDepartureInfo = function(){
    //     selectedLineOn = $('select.departure option:selected').parent().attr('label');
    //     selectedStopOn = $('select.departure option:selected').val();
    //     indexStopOn = subwayLines[selectedLineOn].indexOf(selectedStopOn);
    //     indexUnionSquareOn = subwayLines[selectedLineOn].indexOf("Union Square");
    //     console.log (selectedLineOn, selectedStopOn, indexStopOn, indexUnionSquareOn);
    // }

    // var getDestinationInfo = function(){
    //     selectedLineOff = $('select.destination option:selected').parent().attr('label');
    //     selectedStopOff = $('select.destination option:selected').val();
    //     indexStopOff = subwayLines[selectedLineOff].indexOf(selectedStopOff);
    //     indexUnionSquareOff = subwayLines[selectedLineOff].indexOf("Union Square");
    //     console.log (selectedLineOff, selectedStopOff, indexStopOff, indexUnionSquareOff);
    // }

    // var selectedLineOn 
    // var selectedStopOn 
    // var indexStopOn 
    // var indexUnionSquareOn 
    // var selectedLineOff 
    // var selectedStopOff
    // var indexStopOff 
    // var indexUnionSquareOff 

   // listStations(selectedLineOn, selectedStopOn, indexStopOn, indexUnionSquareOn, selectedLineOff, selectedStopOff, indexStopOff, indexUnionSquareOff);
    // listStations(selectedLineOn, selectedStopOn, indexStopOn, indexUnionSquareOn, selectedLineOff, selectedStopOff, indexStopOff, indexUnionSquareOff);


// $('.submit').on('click', getDepartureInfo, listStations);
