# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  year       :string
#  genre      :string
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#  author_id  :integer
#

class Book < ActiveRecord::Base
  belongs_to :author
end
