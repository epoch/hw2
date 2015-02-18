require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/mta'
require_relative 'lib/subway'

# Display's a given line in html using radio button
# @param line [symbol] Line to be displayed as a symbol as it appears in the hash
# @param display [string] how the string is to be displayed
# @param idsuffix [string] suffix to add to id so that each id can be unique
# @return [string] Menu as html

def display_menu(line, display, id_suffix)
    s = []
    s << "<div class=\"sub_menu #{id_suffix}\">"
    s << "    <h3>#{display}</h3>"

    Subway::LINES[line].each do |i|
        s << "        <p>"
        s << "            <label for=\"#{i}_#{id_suffix}\">"
        s << "            <input id=\"#{i}_#{id_suffix}\" name=\"#{id_suffix}\"
                          type=\"radio\" value=\"#{i}|#{line}\" required>"
        s << "            #{i}</label>"
        s << "        </p>"
    end

    s << "    </div>"
    s.join("\n")
end

get '/' do
    require 'pry'
    erb :menu
end

get '/process' do
    start_station, start_line = *(params["start"].split('|'))
    finish_station, finish_line = *(params["finish"].split('|'))
    if start_station == finish_station && start_line == finish_line
        return "<h1>You're aleady there, stupid!</h1>"
    end
    @mta = MTA.new(start_line.to_sym, start_station, finish_line.to_sym, finish_station)
    erb :result
end