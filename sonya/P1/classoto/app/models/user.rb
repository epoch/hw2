# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  image           :text
#  cohort_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string
#  is_admin        :boolean          default("false")
#

class User < ActiveRecord::Base
  has_secure_password
  belongs_to :cohort
  has_many :comments
  validates :name, :presence => true, :uniqueness => true
end
