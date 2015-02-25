var $container = $('.container');

var elem = "<form>";
      
      elem += "<label for=from_station>From: </label>";
      elem += "<select name=from_station, id=from_station>";
        elem += "<optgroup label='Line N'>";
          subway["Line N"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
        elem += "<optgroup label='Line L'>";
          subway["Line L"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
        elem += "<optgroup label='Line 6'>";
          subway["Line 6"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
      elem += "</select>";

      elem += "<label for=to_station>To: </label>";
      elem += "<select name=to_station, id=to_station>";
        elem += "<optgroup label='Line N'>";
          subway["Line N"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
        elem += "<optgroup label='Line L'>";
          subway["Line L"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
        elem += "<optgroup label='Line 6'>";
          subway["Line 6"].forEach( function (current) {
            elem += ( "<option>" + current + "</option>" );
          });
        elem += "</optgroup>"
      elem += "</select>";

      elem += '<button class="btn">Submit</button>';

    elem += "</form>"

$container.append(elem);

$from_station = $('#from_station').val();
$to_station = $('#to_station').val();