# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string
#  nationality :string
#  dob         :date
#  bio         :string
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Author < ActiveRecord::Base
  has_many :books
end
