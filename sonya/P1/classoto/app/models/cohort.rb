# == Schema Information
#
# Table name: cohorts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cohort     :string
#  year       :string
#  created_at :datetime
#  updated_at :datetime
#

class Cohort < ActiveRecord::Base
  has_many :users
end
