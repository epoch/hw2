# == Schema Information
#
# Table name: oceans
#
#  id               :integer          not null, primary key
#  name             :string
#  image            :text
#  max_depth        :float
#  earth_percentage :float
#  countries        :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Ocean < ActiveRecord::Base
end
