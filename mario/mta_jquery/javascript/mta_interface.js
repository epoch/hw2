// jQuery newbie so comment overkill

$(document).ready(function () {

  // Object to store client choices
  var mtaClient = {};

  $container = $(".container");

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
      mtaClient[startOrFinish + 'Station'] = value[0];
      mtaClient[startOrFinish + 'Line'] = value[1];
      $menu.addClass('animated fadeOutLeft');
      console.log(mtaClient[startOrFinish + 'Station']);
      console.log(mtaClient[startOrFinish + 'Line']);
      // Remove $menu with a delay so we get fadeOut animation effect
      setTimeout(function(){
        $container.empty();
        if (startOrFinish === 'start') {
          getStationInfo('finish');
        }
      }, 300);
    });
  }
  
  getStationInfo('start');
});
