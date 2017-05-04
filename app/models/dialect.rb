class Dialect < ApplicationRecord
  
  #relationships
  has_many :users
  has_many :messages

  #validations
  validates :name, :code, presence: true

end
