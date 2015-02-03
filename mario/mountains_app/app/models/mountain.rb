# == Schema Information
#
# Table name: mountains
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :text
#  height     :integer
#  country    :text
#  created_at :datetime
#  updated_at :datetime
#

class Mountain < ActiveRecord::Base
end
