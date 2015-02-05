# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :text
#  area       :float
#  depth      :float
#  mean_depth :float
#  created_at :datetime
#  updated_at :datetime
#

class Ocean < ActiveRecord::Base
end
