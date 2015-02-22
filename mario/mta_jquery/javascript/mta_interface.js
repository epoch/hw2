$(document).ready(function () {

  $container = $(".container");

  var displayJourney = function() {
    var $journey = $('<div/>').addClass("journey animated bounceInUp");
    $journey.append($('<h2/>').text("Below is your journey"));

    $.each(mta.journey(), function( index, value ) {
      $journey.append($('<p/>').text(value));
    });

    // Refactor button code as there is duplication
    var $buttonNext = $("<button>").addClass('btn btn-success').attr('id', 'nextButton').text("New Search");
    $journey.append($buttonNext);
    $container.append($journey);

    $("#nextButton").click(function(){
      $journey.addClass('animated bounceOutDown');
      setTimeout(function(){
        $container.empty();
        getStationInfo('start');
      }, 500);
    });
  }

  var getStationInfo = function(startOrFinish) {
    var $menu = $('<div/>').addClass("menu row");

    $menu.append($('<h2/>').text("Select your " + startOrFinish + " station."));

    $.each( LINES, function( key, value ) {
      var $subwayLineUL = $('<ul/>').addClass(key);
      $.each(value, function( index, value ) {

        var $li = $('<li/>');
        var stationID = value + '|' + key
        var $label = $("<label>").attr({for: stationID}).text(value);
        var $radioBtn = $('<input type="radio">').attr({id: stationID, value: stationID, name: 'stationLine'});

        $li.append($radioBtn, $label);
        $subwayLineUL.append($li);
      });
      var $subwayLine = $('<div/>').addClass('col-md-3');
      $subwayLine.append($('<h3/>').text(mta.prettyPrint[key])); 
      $menu.append($subwayLine.append($subwayLineUL));
    });

    var $buttonNext = $("<button>").addClass('btn btn-primary').attr('id', 'nextButton').text("Next");
    var $buttonRow = $("<div/>").addClass('col-md-9 buttonRow');
    $menu.append($buttonRow.append($buttonNext));
    $menu.addClass('animated fadeInRight');
    $container.append($menu);

    $("#nextButton").click(function(){
      var value = $("input[name=stationLine]:checked").val().split('|')
      mta[startOrFinish + 'Station'] = value[0];
      mta[startOrFinish + 'Line'] = value[1];
      $menu.addClass('animated fadeOutLeft');
      console.log(mta[startOrFinish + 'Station']);
      console.log(mta[startOrFinish + 'Line']);
      // Remove $menu with a delay so we get fadeOut animation effect
      setTimeout(function(){
        $container.empty();
        if (startOrFinish === 'start') {
          getStationInfo('finish');
        } else {
          displayJourney();
        }
      }, 300);
    });
  }

  getStationInfo('start');
});
