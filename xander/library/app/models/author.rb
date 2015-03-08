# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string
#  nationality :string
#  dob         :date
#  dod         :date
#  university  :string
#  highlight   :string
#  num_books   :integer
#  image       :text
#

class Author < ActiveRecord::Base
    has_many :books
end
