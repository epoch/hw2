def create_tenant
	puts "Tenant Creation:"
	print "Enter tenant name: "
	name = gets.chomp

	print "Enter tenant age: "
	age = gets.chomp

	print "Enter tenant gender: "
	gender = gets.chomp 

	tenant = Tenant.new name, age, gender
	tenant # this returns the tenant
end

tenants = [] # list of all tenants, but they also need to be stored in the apartments
tenants << create_tenant

# now we are storing new tenants into the tenants array every time we create one

# this would be the menu option to list the tenants
puts tenants 