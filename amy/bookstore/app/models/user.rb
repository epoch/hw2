# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
    has_many :books
end
