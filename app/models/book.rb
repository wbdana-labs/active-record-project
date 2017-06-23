require_all './'

class Book < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :authors

end
