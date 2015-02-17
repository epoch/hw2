# == Schema Information
#
# Table name: pledges
#
#  id           :integer          not null, primary key
#  amount       :integer
#  reason       :string
#  user_id      :integer
#  challenge_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Pledge < ActiveRecord::Base
end
