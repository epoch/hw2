# class cobot

# def random_password(size = 8)
# chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
# (1..size).collect{|a| chars[rand(chars.size)] }.join
# end
	
# puts random_password.inspect

# end



class Robot
	attr_reader :name, :instruction_count

	def initialize
		@instruction_count = 0
		@creation_time = @boot_time = Time.now
		@name = alpha_prefix  + numeric_suffix
		@mac = (0...4).map { rand(1000..9999).to_s }.join(":")
	end

	def name
		@instruction_count +=1
		@name
	end

	def reset
		@instruction_count += 1
		@name = alpha_prefix + numeric_suffix
		@boot_time = Time.now
	end

	def timers
		"#{ (Time.now - @boot_time).round } seconds since last boot, " +
		"#{ (Time.now - @creation_time).round } seconds since creation"
	end

	private
	def alpha_prefix
		("A".."Z").to_a.sample(2).join
	end

	def numeric_suffix
		rand(100..999).to_s
	end

end

require 'pry'
binding.pry

