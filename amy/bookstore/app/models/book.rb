# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  genre      :string
#  publisher  :string
#  year       :string
#  isbn       :integer
#  summary    :text
#  image      :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Book < ActiveRecord::Base
    belongs_to :author
    belongs_to :user
end
