$(document).ready(function(){

    var subwayLines = {
        "N": ["Times Square(N)", "34th(N)", "28th(N)", "23rd(N)", "Union Square", "8th(N)"],
        "L": ["8th(L)", "6th(L)", "Union Square", "3rd(L)", "1st(L)"],
        "6": ["Grand Central(6)", "33rd(6)", "28th(6)", "23rd(6)", "Union Square", "Astor Place(6)"]
    }

    var submitDeparture = function(subwayLines){
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
    submitDeparture(subwayLines);

    var submitDestination = function(subwayLines){
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
    submitDestination(subwayLines);

    // var lineOn = function(){
    //     var selectedLineOn = $('select.departure option:selected').parent().attr('label');
    //     console.log (selectedLineOn);
    // }
    // $('.submit-departure').on('click', lineOn);

    var getDepartureInfo = function(){
        var selectedLineOn = $('select.departure option:selected').parent().attr('label');
        var selectedStopOn = $('select.departure option:selected').val();
        var indexStopOn = subwayLines[selectedLineOn].indexOf(selectedStopOn);
        var indexUnionSquareOn = subwayLines[selectedLineOn].indexOf("Union Square");
        console.log (selectedLineOn, selectedStopOn, indexStopOn, indexUnionSquareOn);
    }
    $('.submit-departure').on('click', getDepartureInfo);

    // var lineOff = function(){
    //     var selectedLineOff = $('select.destination option:selected').parent().attr('label');
    //     console.log (selectedLineOff);
    // }
    // $('.submit-destination').on('click', lineOff);

    var getDestinationInfo = function(){
        var selectedLineOff = $('select.destination option:selected').parent().attr('label');
        var selectedStopOff = $('select.destination option:selected').val();
        var indexStopOff = subwayLines[selectedLineOff].indexOf(selectedStopOff);
        var indexUnionSquareOff = subwayLines[selectedLineOff].indexOf("Union Square");
        console.log (selectedLineOff, selectedStopOff, indexStopOff, indexUnionSquareOff);
    }
    $('.submit-destination').on('click', getDestinationInfo);

    // var indexStopOn = subwayLines[lineOn].indexOf(stopOn);
    // console.log

    // var indexStopOff = subwayLines[lineOff].indexOf(stopOff);

    // var indexUnionSquareOn = subwayLines[lineOn].indexOf("Union Square");

    // var indexUnionSquareOff = subwayLines[lineOff].indexOf("Union Square");

}); // end document.ready


   
