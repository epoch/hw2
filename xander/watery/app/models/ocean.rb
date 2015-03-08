# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :string
#  max_depth  :float
#  area       :float
#  volume     :float
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Ocean < ActiveRecord::Base
end
