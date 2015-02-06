# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :text
#  cohort_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  belongs_to :cohort
  has_many :comments
end
