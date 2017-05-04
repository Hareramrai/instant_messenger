class Message < ApplicationRecord
  belongs_to :user
  belongs_to :dialect

  validates :body, presence: true
  validates :dialect, :user, presence: true

  delegate :username, to: :user, allow_nil: true
  delegate :code, to: :dialect

  before_save :translate_message 
  after_create_commit { MessageBroadcasterJob.perform_later(self) }

  def translator_image
    "#{code}.png"
  end


  private 

  def translate_message 
    self.body = Translator.new.translate(dialect, body)
  end
end
