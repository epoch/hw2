# == Schema Information
#
# Table name: oceans
#
#  id            :integer          not null, primary key
#  name          :string
#  image         :text
#  average_depth :integer
#  deepest_point :integer
#  area          :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Ocean < ActiveRecord::Base
    
end
