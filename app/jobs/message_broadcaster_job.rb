class MessageBroadcasterJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "messages", { message: render_message(message) }
  end

  private

  def render_message(message)
    MessagesController.render(partial: 'message', locals: {message: message}).squish
  end
end
