# == Schema Information
#
# Table name: books
#
#  id        :integer          not null, primary key
#  title     :string
#  published :string
#  publisher :string
#  image     :text
#  award     :text
#  author_id :integer
#

class Book < ActiveRecord::Base
    belongs_to :author
end
