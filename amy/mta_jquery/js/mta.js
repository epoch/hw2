$(document).ready(function(){

    var subwayLines = {
        "N": ["Times Square(N)", "34th(N)", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
        "L": ["8th(L)", "6th(L)", "Union Square", "3rd(L)", "1st(L)"],
        "6": ["Grand Central(6)", "33rd(6)", "28th(6)", "23rd(6)", "Union Square", "Astor Place(6)"]
    }

    var numStops = $('<p></p>').addClass('num-stops');
        numStops.appendTo('.journey');
    var stationsList = $('<ul></ul>').addClass('stations-list');
        stationsList.appendTo('.journey');
    var changeStationsMsg = $('<p></p>').addClass('change-stations');
        changeStationsMsg.appendTo('.journey');
    var alreadyThereMsg = $('<p></p>').addClass('already-there');
        alreadyThereMsg.appendTo('.journey');

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

            // if the user selects union square on one line and any station on another
            if(selectedStopOn === "Union Square"){
                selectedLineOn = selectedLineOff;
                console.log(selectedLineOn);

                if(indexStopOff < indexUnionSquareOff){
                    console.log("true that");
                    var totalStations = subwayLines[selectedLineOn].slice(indexStopOff, indexUnionSquareOff + 1);
                    var totalStations = totalStations.reverse();
                    console.log(indexStopOff, indexUnionSquareOff);
                    console.log(totalStations);
                    console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                    numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                }
                else if(indexStopOff > indexUnionSquareOff){
                    console.log("true");
                    var totalStations = subwayLines[selectedLineOn].slice(indexUnionSquareOff, indexStopOff + 1);
                    console.log(indexStopOff, indexUnionSquareOff);
                    console.log(totalStations);
                    console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                    numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                }
            }else if(selectedStopOff === "Union Square"){
                selectedLineOff = selectedLineOn;
                console.log(selectedLineOff);

                if(indexStopOn < indexUnionSquareOn){
                    console.log("true that");
                    var totalStations = subwayLines[selectedLineOff].slice(indexStopOn, indexUnionSquareOn + 1);
                    console.log(indexStopOn, indexUnionSquareOn);
                    console.log(totalStations);
                    console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                    numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                }
                else if(indexStopOn > indexUnionSquareOn){
                    console.log("true");
                    var totalStations = subwayLines[selectedLineOff].slice(indexUnionSquareOn, indexStopOn + 1);
                    var totalStations = totalStations.reverse();
                    console.log(indexStopOn, indexUnionSquareOn);
                    console.log(totalStations);
                    console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                    numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                }
            }

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


            if(stationsBeforeChangeoverArr && stationsAfterChangeoverArr){
                var totalStations = stationsBeforeChangeoverArr.concat(stationsAfterChangeoverArr);
                console.log(totalStations);
                console.log("two arrays present");
                console.log("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
                numStops.html("There are " + (totalStations.length - 1) + " stops until you reach your destination:");
            }

            for ( var i = 0; i < totalStations.length; i++ ){
                console.log(totalStations[i]);
                $('<li>' +totalStations[i]+ '</li>').addClass('stations-name').appendTo(stationsList);
            };

        }

        var changeover = function(selectedLineOn, selectedLineOff){
        // say whether the person needs to change lines at Union Square
            if(selectedLineOn != selectedLineOff){
                var changeover = true
                console.log ("Don't forget to change lines at Union Square.");
                changeStationsMsg.html("Don't forget to change lines at Union Square.");
            }
        };
        changeover(selectedLineOn, selectedLineOff);

        var alreadyAtDestination = function(selectedStopOn, selectedStopOff){
            // tell the user if they're already at their destination
            if(selectedStopOn === selectedStopOff){
                var atDestination = true
                console.log ("Looks like you're alreay there!");
                alreadyThereMsg.html("Looks like you're alreay there!");
            }
        };
        alreadyAtDestination(selectedStopOn, selectedStopOff);

    };


    var clearStations = function(){
        console.log("im clearing");
        $('ul').empty();
    }

    $('.submit').on('click', clearStations);
    $('.submit').on('click', listStations);

}); // end document.ready

