$(document).ready(function () {

  $container = $(".container");

  var displayJourney = function() {
    var $journey = $('<div/>').addClass("journey animated bounceInUp");
    $.each(mta.journey(), function( index, value ) {
      $journey.append($('<p/>').text(value));
    });

    // Refactor button code as there is duplication
    var $buttonNext = $("<button>").attr('id', 'nextButton').text("New Search");
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
    var $menu = $('<div/>').addClass("menu");

    $.each( LINES, function( key, value ) {
      var $subwayLine = $('<ul/>').addClass(key);
      $.each(value, function( index, value ) {

        var $li = $('<li/>');
        var stationID = value + '|' + key
        var $label = $("<label>").attr({for: stationID}).text(value);
        var $radioBtn = $('<input type="radio">').attr({id: stationID, value: stationID, name: 'stationLine'});

        $li.append($radioBtn, $label);
        $subwayLine.append($li);
      }); 
      $menu.append($subwayLine);
    });

    var $buttonNext = $("<button>").attr('id', 'nextButton').text("Next");
    $menu.append($buttonNext);
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
