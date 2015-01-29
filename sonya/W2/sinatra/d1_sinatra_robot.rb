# class Robot
	
# 	attr_accessor :name, :mac_id

# 	def initialize(name, mac_id)
# 		@name = name
# 		@mac_id = mac_id
# 	end

# 	def to_s
# 		"#{ @name } was created with mac id #{ mac_id }."
# 	end
# end

# The first time you boot them up, a random name is generated, such as RX837 or BC811
# mac_id = Random.rand ()
# 'mac_id'.gsub(/[A-Z]/, '0')

# def create_robot
# 	puts "Create a robot"
# 	print "Enter robot name: "
# 	name = gets.chomp

# 	print "Enter robot Mac ID: "
# 	mac_id = gets.chomp
	
# 	Robot.new(name, mac_id)

# 	puts Robot
# end

# puts Robot

###########################################

# Joel's first solution

# class Robot

# 	attr_reader :name

# 	def initialize
# 		@name = ('A'...'Z').to_a.sample(2).join + Random.rand(100...1000).to_s 
# 	end

# 	def reset
# 		@name = ('A'...'Z').to_a.sample(2).join + Random.rand(100...1000).to_s 
# 	end

# end

###########################################

# Joel's refactored solution

class Robot

	attr_reader :instruction_count # if you add , :mac here you'll be able to call robot1.mac

	def initialize
		@instruction_count = 0
		@name = alpha_prefix + numeric_suffix
		@mac = (0...4).map { rand(1000..9999).to_s }.join(':')
		@creation_time = @boot_time = Time.now
	end

	def name
		@instruction_count += 1
		@name
	end

	def reset
		@instruction_count += 1
		@name = alpha_prefix + numeric_suffix
		@boot_time = Time.now
	end

	def timers
		"#{ (Time.now - @boot_time).round } seconds since last boot and " + 
		"#{ (Time.now - @creation_time).round } seconds since creation."
	end

	# removes method from available list. Only class Robot can use it
	# NB: only call private at the bottom
	private 
	def alpha_prefix
		('A'...'Z').to_a.sample(2).join
	end

	def numeric_suffix
		Random.rand(100..999).to_s
	end

end

require 'pry'
binding.pry









































