class Dialect < ApplicationRecord
  
  #relationships
  has_many :users

  #validations
  validates :name, :code, presence: true

end
