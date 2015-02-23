class Butterfly < ActiveRecord::Base
  belongs_to :plant
end

# class single, table pural so ActiveRecord can connect but can configure if you do not follow convention.

#create table movies
# class movie