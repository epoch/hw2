# == Schema Information
#
# Table name: mountains
#
#  id            :integer          not null, primary key
#  name          :text
#  height        :integer
#  country       :text
#  nearest_ocean :text
#  image         :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Mountain < ActiveRecord::Base
    
end
