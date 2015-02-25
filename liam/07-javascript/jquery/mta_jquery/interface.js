var $container = $('.container');

// Create Optgroup of Stations and Lines
var statLines = "";
$.each(subwayLines, function(key, value){
  statLines += '<optgroup label="Line ' + key + '" >';
    subwayLines[key].forEach( function (current) {
      statLines += "<option>" + current + "</option>";
    });
  statLines += "</optgroup>";
});

// Create Menu (form)
var menu = "<form>";

// From Station
menu += "<label for=from_station>From: </label>";
menu += "<select name=from_station, id=from_station>";
menu +=  statLines
menu += "</select>";

// To Station
menu += "<label for=to_station>To: </label>";
menu += "<select name=to_station, id=to_station>";
menu +=  statLines
menu += "</select>";

// Submit Button
menu += '<button class="btn">Submit</button>';
menu += "</form>";

// Append menu to container
$container.append(menu);

