require 'sinatra'
require 'sinatra/reloader'
require 'pry'

$subway = {
  :line_n => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  :line_l => ["8th", "6th", "Union Square", "3rd", "1st"],
  :line_6 => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

get '/' do
  erb :menu
end

get '/new' do
  erb :new_trip
end

get '/trip' do

  # The :from_station and :to_station correspond to the slection that the user makes in the form
  params[:from_station]
  params[:to_station]

  # Splitting the option value using '-' (because I added a '-' in between the Line and Station)
  from_station = params[:from_station].split('-')
  to_station = params[:to_station].split('-')

  # Storing values for calculation of route
  @from_line = from_station[0].to_sym
  @from_station = from_station[1]
  @to_line = to_station[0].to_sym
  @to_station = to_station[1]

  # Turning stations into indexes
  @from_station_index = $subway[@from_line].index(@from_station).to_i
  @to_station_index = $subway[@to_line].index(@to_station).to_i

  # Turning transfer intersections into indexes
  @from_transfer_index = $subway[@from_line].index("Union Square")
  @to_transfer_index = $subway[@to_line].index("Union Square")

  # Calculate number of stops for all possible scenarios
  if @from_station == @to_station
    @message = "No need to travel! You are already at #{@to_station} station."
  elsif @from_line == @to_line
    @total_stops = @from_station_index > @to_station_index ? @from_station_index - @to_station_index : @to_station_index - @from_station_index
    @message = "You will travel on the same line from #{@from_station} to #{@to_station}. You have a total of #{@total_stops} stop(s) to travel."
  elsif @from_line != @to_line && @from_station_index == @from_transfer_index
    @total_stops = @to_station_index > @to_transfer_index ? @to_station_index - @to_transfer_index : @to_transfer_index - @to_station_index
    @message = "You will have a total of #{@total_stops} stop(s) before disembarking at #{@to_station}."
  elsif @from_line != @to_line && @to_station_index == @to_transfer_index
    @total_stops = @from_station_index > @to_transfer_index ? @from_station_index - @to_transfer_index : @to_transfer_index - @from_station_index
    @message = "You will have a total of #{@total_stops} stop(s) before disembarking at #{@to_station}."
  else
    @first_leg = @from_station_index > @from_transfer_index ? @from_station_index - @from_transfer_index : @from_transfer_index - @from_station_index
    @second_leg = @to_station_index > @to_transfer_index ? @to_station_index - @to_transfer_index : @to_transfer_index - @to_station_index
    @total_stops = @first_leg + @second_leg
    @message = "You will have #{@first_leg} stop(s) before transferring at Union Square. After boarding your second train, you will have #{@second_leg} more stop(s) before disembarking at #{@to_station} station."
  end

  erb :trip

end