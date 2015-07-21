class Person < ActiveRecord::Base

  has_many :books, foreign_key: :author_id

end
