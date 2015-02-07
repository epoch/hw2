# == Schema Information
#
# Table name: challenges
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :string
#  nominee_name   :string
#  nominee_email  :string
#  banner_image   :text
#  cause          :string
#  target         :string
#  published      :boolean
#  end_date       :date
#  accepted_date  :date
#  completed_date :date
#  donated_date   :date
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Challenge < ActiveRecord::Base
end
