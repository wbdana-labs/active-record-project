require_all './'

class User < ActiveRecord::Base

  has_and_belongs_to_many :books

end
