# make a list of robot names (10ish) and every time a certain rename/reset function is called, assign a new name by 
# random using Random.rand(number) 
# before assigning it, check it if matches the one it already has
# mac address never changes (assign a random number to each one that isn't changed when reset, only the name)
# maybe put random names in an array or hash (when the random number is generated, use it as a key, with the name as the value)

# possibly cheating solutions

# require 'securerandom'

# class Robot
# 	attr_accessor :name, :mac_address

# 	def initialize
# 		@name = SecureRandom.hex(3)
# 		@mac_address = Random.rand(100000..999999)
# 	end

# 	def reset
# 		@name = SecureRandom.hex(3)
# 	end

# end

# limited 'solutions'

# class Robot
# 	attr_accessor :name, :mac_address

# 	$robo_names = {
# 		1 => 'RX837',
# 		2 => 'BC811',
# 		3 => 'AX132',
# 		4 => 'OR456',
# 		5 => 'EX110',
# 		6 => 'YZ980',
# 		7 => 'EC617',
# 		8 => 'FX341',
# 		9 => 'LP610',
# 		10 =>'RO80T'
# 	}

# 	def initialize
# 		@name = $robo_names[Random.rand(1..10)]
# 		@mac_address = Random.rand(100000..999999)
# 	end

# 	def reset
# 		new_name = $robo_names[Random.rand(11)]

# 		while new_name == @name
# 			new_name = $robo_names[Random.rand(11)]
# 		end
		
# 		@name = new_name	
# 	end

# end

# class solution

class Robot
	attr_reader :instruction_count

	def initialize
		@instruction_count = 0

		# makes sure they have the exact same time (setting them on separate lines would leave them microseonds apart)
		@creation_time = @boot_time = Time.now

		@name = alpha_prefix + numeric_suffix
		@mac_address = (0...4).map {rand(1000..9999).to_s}.join(':')
	end

	def name 
		@instruction_count += 1
		@name
	end

	def reset
		@instruction_count += 1
		@boot_time = Time.now
		@name = alpha_prefix + numeric_suffix
	end

	def timers
		"#{(Time.now - @boot_time).round} seconds since last boot, #{(Time.now - @creation_time).round} seconds since creation"
	end

	private # so that outside users cannot use the following two methods, they are unnecessary to outide world
	
	def alpha_prefix
		('A'..'Z').to_a.sample(2).join
	end

	def numeric_suffix
		Random.rand(100..999).to_s
	end
end

# require "pry"
# binding.pry

puts "Robot 1: "
robot1 = Robot.new
puts robot1.name
puts robot1.name
puts robot1.name
puts robot1.mac_address

puts "Robot 2: "
robot2 = Robot.new
puts robot2.name
puts robot2.name
puts robot2.name
puts robot2.mac_address

puts "Robot 3: "
robot3 = Robot.new
puts robot3.name
puts robot3.name
puts robot3.mac_address
puts "Resetting to factory settings."
robot3.reset
puts robot3.name
puts robot3.name
puts robot3.mac_address