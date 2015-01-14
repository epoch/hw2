LINE_N = ['times square', '34th', '28th', '23rd','union square', '8th']
LINE_L = ['8th', '6th', 'union square', '3rd', '1st']
LINE_6 = ['grand central', '33rd', '28th', '23rd', 'union square', 'astor place']

LINES = { 'n' => LINE_N, 'l' => LINE_L, '6' => LINE_6 }

def route(start, ending)
  # If the start and ending stations are in the same line.
  if start[0] == ending[0]
    line = LINES[start[0].downcase]

    if line.nil?
      puts "There is no such line: #{start[0]}"
      return nil
    else
      s_index = line.index(start[1])
      e_index = line.index(ending[1])
      if s_index < e_index
        return line[s_index..e_index]
      else
        return line[e_index..s_index].reverse
      end
    end
    # If the start and ending stations aren't in the same line.
  else
    s_line = LINES[start[0].downcase]
    e_line = LINES[ending[0].downcase]
    if s_line.nil? || e_line.nil?
      puts "There is no such line: #{start[0]}"
      return nil
    else
      s_index = s_line.index(start[1])
      u_s_index = s_line.index('union square')
      u_e_index = e_line.index('union square')
      e_index = e_line.index(ending[1])
      if s_index < u_s_index
        f_stations = s_line[s_index..u_s_index]
      else
        f_stations = s_line[u_s_index..s_index].reverse
      end
      if u_e_index < e_index
        l_stations = e_line[u_e_index..e_index]
      else
        l_stations = e_line[e_index..u_e_index].reverse
      end
      return (f_stations - ['union square'] + l_stations)
    end
  end
end
