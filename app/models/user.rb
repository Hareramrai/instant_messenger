class User < ApplicationRecord
  #relationships
  belongs_to :dialect

  #validation
  validates :username, presence: true, uniqueness: { case_sensitive: false } 
  validates :dialect, presence: true

  delegate :name, to: :dialect, allow_nil: true, prefix: true

end
