require 'erb'
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
    s << "<div class=\"sub_menu\">"
    s << "    <h3>#{display}</h3>"

    Subway::LINES[line].each do |i|
        s << "        <p>"
        s << "            <label for=\"#{i}_#{id_suffix}\">"
        s << "            <input id=\"#{i}_#{id_suffix}\" name=\"#{i}\" type=\"radio\" value=\"#{i}\">"
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