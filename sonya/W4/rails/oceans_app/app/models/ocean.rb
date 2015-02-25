# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :text
#  area       :text
#  ports      :float
#  created_at :datetime
#  updated_at :datetime
#

class Ocean < ActiveRecord::Base
end
