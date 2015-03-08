class Movie < ActiveRecord::Base

end

# this is saying butterfly class inheritds from active record Base
# the butterfly should have all the things that this magic class active record base has


# Steps in PRY
# require 'active_record'
# ActiveRecord
# class Butterfly < ActiveRecord::Base;
# end
# ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "butterflies.db");
# mona=Butterfly.new
# can now use ruby methods such as Butterfly.all or Butterfly.last
