subwayLines = {
    n: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    l: ['8th', '6th', 'Union Square', '3rd', '1st'],
    six: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}


    var origin = {
        line: 'N',
        stop: '28th'
    }

    var destination = {
        line: 'N',
        stop: 'Union Square'
    }

    var journey = function (line1, line2, stop1, stop2) {
       if (line1 === 'N' && line2 === 'N') {
        // console.log('Maybe!');
        var numStops = Math.abs(stop1 - stop2)
        console.log('What the?', numStops)
       // } else if (line === 'L') {
       //  for (var i = 0; i < subwayLines.l.length; i++) {
       //      console.log(subwayLines.l[i]);
       //  };
       // } else if (line === '6') {
       //  for (var i = 0; i < subwayLines.six.length; i++) {
       //      console.log(subwayLines.six[i]);
       //  };
       } else{
        console.log('Try again!');
       };
    }

    journey(origin.line, destination.line);



//     subwayLines[@journey[:origin_line].to_sym].index(@journey[:origin])
//     var destination = subwayLines[@journey[:destination_line].to_sym].index(@journey[:destination])

//     @origin_intersect = subway_lines[@journey[:origin_line].to_sym].index("Union Square")
//     @destination_intersect = subway_lines[@journey[:destination_line].to_sym].index("Union Square")

//     if @journey[:origin_line] == @journey[:destination_line]
//         @num_stops = (@destination - @origin).abs
//         if @origin < @destination
//             stops = subway_lines[@journey[:origin_line].to_sym].values_at(@origin..@destination)
//             @stops = stops.join(', ')
//         elsif @origin > @destination
//             stops = subway_lines[@journey[:origin_line].to_sym].values_at(@destination..@origin).reverse
//             @stops = stops.join(', ') 
//         end
//     else
//         if @origin > @destination
//             origin_stops = @origin_intersect - @origin
//             destination_stops = @destination - @destination_intersect
//             @num_stops = (origin_stops + destination_stops).abs
//             stops = subway_lines[@journey[:origin_line].to_sym].values_at(@origin..@origin_intersect) + subway_lines[@journey[:destination_line].to_sym].values_at(@destination..@destination_intersect).reverse
//             @stops = stops.join(', ') 
//         elsif @origin < @destination
//             origin_stops = @origin - @origin_intersect
//             destination_stops = @destination_intersect - @destination
//             @num_stops = (origin_stops + destination_stops).abs 
//             stops = subway_lines[@journey[:origin_line].to_sym].values_at(@origin..@origin_intersect).reverse + subway_lines[@journey[:destination_line].to_sym].values_at(@destination..@destination_intersect).reverse
//             @stops = stops.join(', ')

//         elsif @origin == @destination
//             origin_stops = @origin - @origin_intersect
//             destination_stops = @destination - @destination_intersect
//             @num_stops = (origin_stops + destination_stops).abs 
//         end
//     end
//     # binding.pry
//     erb :result
// end




  // origin: function(originLine, stop1) {
  //   // for (var i = 0; i < originLine.length; i++) {
  //     numStop = originLine.indexOf(stop1);
  //     console.log(numStop);
  //   // };
  //   // console.log(originLine, stop1)
  // },

  // destination: function (a, b) {

  // },
